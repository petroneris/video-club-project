package com.snezana.controllers;

import com.snezana.dao.FilmDAO;
import com.snezana.util.ControllerUtils;
import com.snezana.util.ControllerUtils.CheckUser;
import com.snezana.models.Film;
import com.snezana.models.User;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.snezana.dao.UserDAO;

/**
 * Controller class for the {@link User} object.
 */
@Controller
public class UserController {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private FilmDAO filmDao;

    public static final String ATTR_USERNAME = "username";

    /**
     * Login page.
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login1(ModelMap model) {
        return "login";
    }

    /**
     * Processing of login data, supplied by the User through this request with POST method.
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login2(ModelMap model, HttpSession session, @RequestParam(value = "username", required = true) String username, @RequestParam(value = "password", required = true) String password) {
        User k = userDao.getUser(username);
        if ((k != null) && (k.getPassword().equals(password))) {
            boolean admin = userDao.isAdmin(username);
            model.addAttribute("user", k);
            session.setAttribute(ATTR_USERNAME, k.getUsername());
            if (admin) {
                return "redirect:/adminHome";
            } else {
                return "redirect:/userHome";
            }
        } else {
            model.addAttribute("message", "Invalid username or pasword! Please, try again.");
            return "login";
        }
    }

    /**
     * Admin home page.
     */
    @RequestMapping(value = "/adminHome", method = RequestMethod.GET)
    public String gotoAdmin(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("user", cu.user);
        return "adminHome";
    }

    /**
     * 'Access Denied' page.
     */
    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public String gotoAccessDenied(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotUser(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("user", cu.user);
        return "accessDenied";
    }

     /**
     * Home page for the given User.
     */
    @RequestMapping(value = "/userHome", method = RequestMethod.GET)
    public String gotoUser(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotUser(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("user", cu.user);
        return "userHome";
    }

     /**
     * Logout page.
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(ModelMap model, HttpSession session) {
        String username = (String) session.getAttribute(ATTR_USERNAME);
        User ks = userDao.getUser(username);
        model.addAttribute("userout", ks);
        session.setAttribute(ATTR_USERNAME, "");
        return "logout";
    }

    /**
     * 'Add (new) User' page, with no supplied user data.
     */
    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser1(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        return "addUser";
    }

    /**
     * 'Add (new) User' page, with supplied user data.
     */
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser2(ModelMap model, HttpSession session, @RequestParam(value = "first", required = true) String first, @RequestParam(value = "last", required = true) String last, @RequestParam(value = "jmbg", required = true) Long jmbg, @RequestParam(value = "phone", required = true) String phone, @RequestParam(value = "username", required = true) String username, @RequestParam(value = "password", required = true) String password, @RequestParam(value = "name", required = true) String name) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        String message = "";
        User k = userDao.getUser(username);
        if (k == null) {
            k = new User(first, last, jmbg, phone, username, password);
            userDao.addUser(k);
            userDao.addRoleToUser(username, name);
            message = "User '" + username + "' as '" + name + "' is successfully added in db.";
        } else {
            message = "The user with username= '" + username + "' already exist in db and not added.";
        }
        model.addAttribute("addmess", message);
        System.out.println("first= " +first+ ", last= " +last);
        return "addUser";
    }

    /**
     * Show all Users.
     */
    @RequestMapping(value = "allUsers", method = RequestMethod.GET)
    public String allUsers(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("userList", userDao.usersList());
        model.addAttribute("numUsers", userDao.totalNoOfUsers());
        return "allUsers";
    }

    /**
     * Show list of all the Users that currently have no rented films.
     */
    @RequestMapping(value = "usersNoRent", method = RequestMethod.GET)
    public String usersNoRent(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("usersNoRentList", userDao.userListNoRent());
        return "usersNoRent";
    }

    /**
     * Delete User, but first check if (s)he has no rented films.
     */
    @RequestMapping(value = "deleteUser/{username}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable(value = "username") String username, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        String message = "";
        boolean hasGotRentedFilms = userDao.hasGotRentedFilms(username);
        if (hasGotRentedFilms) {
            message = "The user '" + username + "' is not deleted because it has got rented films!!!";
        } else {
            message = "";
            userDao.deleteUser(username);
        }
        model.addAttribute("message", message);
        return "redirect:/usersNoRent";
    }

    /**
     * Edit user data for User with supplied username.
     */
    @RequestMapping(value = "editUser/{username}", method = RequestMethod.GET)
    public String editUser1(@PathVariable(value = "username") String username, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("user1", userDao.getUser(username));
        return "editUser";
    }

    /**
     * Edit user data with supplied {@link User} object.
     */
    @RequestMapping(value = "editUser", method = RequestMethod.POST)
    public String editUser2(@ModelAttribute(value = "edtUser") User k, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        userDao.editUser(k);
        return "redirect:/allUsers";
    }

    /**
     * Show information about User with supplied username.
     */
    @RequestMapping(value = "infoUser/{username}", method = RequestMethod.GET)
    public String infoUser(@PathVariable(value = "username") String username, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("infoUser", userDao.getUser(username));
        return "infoUser";
    }

    /**
     * List of all Users that _do_ have some rented film(s).
     */ 
    @RequestMapping(value = "usersWithRent", method = RequestMethod.GET)
    public String usersWithRent(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("usersWithRentList", userDao.userListWithRent());
        return "usersWithRent";
    }

    /**
     * List of all films that are currently rented.
     */
    @RequestMapping(value = "userRentedFilms", method = RequestMethod.GET)
    public String userRentedFilms(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotUser(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("userRentedFilms", userDao.filmsRentedByUser(cu.user.getUsername()));
        int i = userDao.filmsRentedByUser(cu.user.getUsername()).size();
        model.addAttribute("userNumFilms", i);
        return "userRentedFilms";
    }

    /**
     * Page for User that wants to rent a new film.
     */
    @RequestMapping(value = "userRentNewFilm", method = RequestMethod.GET)
    public String userRentNewFilm(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotUser(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("availableFilms", filmDao.availableFilms());
        model.addAttribute("korU", cu.user);
        return "userRentNewFilm";
    }

    /**
     * Show if given film is rented, and if so by which User.
     */
    @RequestMapping(value = "userChoiceFilm/{title}", method = RequestMethod.GET)
    public String userChoiceFilm1(@PathVariable(value = "title") String title, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotUser(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        Film f = filmDao.getFilm(title);
        model.addAttribute("isRented", filmDao.isRented(title));
        model.addAttribute("user", cu.user);
        model.addAttribute("flm", f);
        return "userChoiceFilm";
    }

    /**
     * Mark the film with supplied title as rented by active User.
     */
    @RequestMapping(value = "userChoiceInfo/{title}", method = RequestMethod.GET)
    public String userChoiceInfo1(@PathVariable(value = "title") String title, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotUser(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        Film f = filmDao.getFilm(title);
        model.addAttribute("user", cu.user);
        model.addAttribute("film", f);
        filmDao.rentFilm(title, cu.user.getUsername());
        return "userChoiceInfo";
    }

    /**
     * Show various User and Film statistics.
     */
    @RequestMapping(value = "statistics", method = RequestMethod.GET)
    public String statisticsView(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("usersList", userDao.usersList());
        model.addAttribute("numUsers", userDao.totalNoOfUsers());
        model.addAttribute("statsAvgFilmsPerUser", userDao.statsAvgFilmsPerUser());
        model.addAttribute("filmsList", filmDao.listOfFilms());
        model.addAttribute("filmsCount", filmDao.filmsCount());
        model.addAttribute("avgRentsPerFilm", filmDao.avgRentsPerFilm());
        return "statistics";
    }
    
    /**
     * Page redirect(s) for non-Admin Users.
     */
    @RequestMapping(value = {"infoUser", "editUser", "deleteUser"}, method = RequestMethod.GET)
    public String redirect1(ModelMap model, HttpSession session) {
        String jspPage = "index";
        CheckUser cna = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cna.needRedirect()) {
            jspPage = cna.redirect;
        }
        return jspPage;
    }

    /**
     * Page redirect(s) for requested pages that are available for current User only.
     */
    @RequestMapping(value = {"userChoiceInfo", "userChoiceFilm"}, method = RequestMethod.GET)
    public String redirect2(ModelMap model, HttpSession session) {
        String jspPage = "index";
        CheckUser cnu = ControllerUtils.redirectIfNotUser(userDao, session);
        if (cnu.needRedirect()) {
            jspPage = cnu.redirect;
        }
        return jspPage;
    }

}
