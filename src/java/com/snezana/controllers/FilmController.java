package com.snezana.controllers;

import com.snezana.dao.FilmDAO;
import com.snezana.util.ControllerUtils;
import com.snezana.util.ControllerUtils.CheckUser;
import com.snezana.models.Film;
import com.snezana.models.User;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.snezana.dao.UserDAO;

/**
 * Controller class for the {@link Film} object.
 */
@Controller
@RequestMapping(value = "/")
public class FilmController {

    @Autowired
    private FilmDAO filmDao;

    @Autowired
    private UserDAO userDao;

    /**
     * Welcome page.
     */
    @RequestMapping(method = RequestMethod.GET)
    public String welcome(Model model) {
        return "index";
    }

     /**
     * Add film to database.
     */
    @RequestMapping(value = "addFilm", method = RequestMethod.GET)
    public String addFilm1(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        return "addFilm";
    }

    /**
     * Add film to database, with pre-populated data.
     */
    @RequestMapping(value = "addFilm", method = RequestMethod.POST)
    public String addFilm2(ModelMap model, @RequestParam(value = "title", required = true) String title, @RequestParam(value = "genre", required = true) String genre, @RequestParam(value = "year", required = true) Integer year, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        String message = "";
        Film f = filmDao.getFilm(title);
        if (f == null) {
            Film fn = new Film(title, genre, year);
            filmDao.addFilm(fn);
            message = "Film '" + title + "' is successfully added in db.";
        } else {
            message = "Film with title '" + title + "' already exist in db and not added.";
        }
        System.out.println(message);
        model.addAttribute("addmess", message);
        return "addFilm";
    }
    
    /** 
     * List of all films currently in database.
     */
    @RequestMapping(value = "allFilms", method = RequestMethod.GET)
    public String allFilms(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("filmList", filmDao.listOfFilms());
        return "allFilms";
    }

     /**
     * List of (all) currently rented films.
     */
    @RequestMapping(value = "rentedFilms", method = RequestMethod.GET)
    public String rentedFilms(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("currTime", Film.currentTime());
        model.addAttribute("rentedFilmsList", filmDao.rentedFilms());
        return "rentedFilms";
    }

    /**
     * List of all films that are currently available, i.e. they are free, not rented.
     */
    @RequestMapping(value = "availableFilms", method = RequestMethod.GET)
    public String availableFilms(ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("availableFilmsList", filmDao.availableFilms());
        return "availableFilms";
    }

     /**
     * Delete a film from database.
     */
    @RequestMapping(value = "deleteFilm/{title}", method = RequestMethod.GET)
    public String deleteFilm(@PathVariable(value = "title") String title, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        String message = "";
        Film f = filmDao.getFilm(title);
        boolean isRented = filmDao.isRented(title);
        if (isRented) {
            message = "The film '" + title + "' is not deleted because it is rented!!!";
        } else {
            message = "";
            filmDao.deleteFilm(title);
        }
        model.addAttribute("message", message);
        return "redirect:/availableFilms";
    }

    /**
     * Edit film of given title.
     */
    @RequestMapping(value = "editFilm/{title}", method = RequestMethod.GET)
    public String editFilm1(@PathVariable(value = "title") String title, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        model.addAttribute("film1", filmDao.getFilm(title));
        return "editFilm";
    }

     /**
     * Edit film with entire Film object supplied.
     */
    @RequestMapping(value = "editFilm", method = RequestMethod.POST)
    public String editFilm2(@ModelAttribute(value = "edtFilm") Film f, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        filmDao.editFilm(f);
        return "redirect:/allFilms";
    }

    /**
     * Rent a film with given title to active User.
     */
    @RequestMapping(value = "rentFilm/{title}", method = RequestMethod.GET)
    public String rentFilm(@PathVariable(value = "title") String title, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        Film f = filmDao.getFilm(title);
        List<User> userList = userDao.usersList();
        model.addAttribute("userList2", userList);
        model.addAttribute("film2", f);
        return "rentFilm";
    }

    /**
     * Rent a film with given title to given User.
     */
    @RequestMapping(value = "choiceInfo/{title}/{username}", method = RequestMethod.GET)
    public String choiceInfo(@PathVariable(value = "title") String title, @PathVariable(value = "username") String username, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        Film f = filmDao.getFilm(title);
        User k = userDao.getUser(username);
        model.addAttribute("user3", k);
        model.addAttribute("film3", f);
        filmDao.rentFilm(title, username);
        return "choiceInfo";
    }

     /**
     * Return info (status) about a Film with given title.
     */
    @RequestMapping(value = "returnInfo/{title}", method = RequestMethod.GET)
    public String returnInfo(@PathVariable(value = "title") String title, ModelMap model, HttpSession session) {
        CheckUser cu = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cu.needRedirect()) {
            return cu.redirect;
        }
        Film f = filmDao.getFilm(title);
        User k = filmDao.returnFilm(title);
        model.addAttribute("user4", k);
        model.addAttribute("film4", f);
        return "returnInfo";
    }

     /**
     * Redirect from all Admin pages, for all non-admin users. 
     */
    @RequestMapping(value = {"choiceInfo", "returnInfo", "editFilm", "rentFilm", "deleteFilm"}, method = RequestMethod.GET)
    public String redirectf(ModelMap model, HttpSession session) {
        String jspPage = "index";
        CheckUser cna = ControllerUtils.redirectIfNotAdmin(userDao, session);
        if (cna.needRedirect()) {
            jspPage = cna.redirect;
        }
        return jspPage;
    }

}
