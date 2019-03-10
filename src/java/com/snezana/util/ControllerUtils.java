package com.snezana.util;

import static com.snezana.controllers.UserController.ATTR_USERNAME;
import com.snezana.dao.UserDAO;
import com.snezana.models.User;
import javax.servlet.http.HttpSession;

/**
 * Various utilities for Controller classes.
 */
public class ControllerUtils {
    
     public static class CheckUser {

        public String redirect;
        public User user;

        public boolean needRedirect() {
            return (!redirect.isEmpty());
        }
    }
    
    /**
     * Checks if User has 'Admin' role, and redirects to 'Access Denied' page if not.
     * @param userDao
     *          DAO object linked to the Hibernate infrastructure.
     * @param session 
     *          {@link HttpSession} containing data for user that is to be checked.
     * @return 
     *          a {@link CheckUser} object containing full user information as well as
     * redirect location, if user is non-existent or has no valid role.
     */ 
    public static CheckUser redirectIfNotAdmin(UserDAO userDao, HttpSession session) {
        CheckUser result = new CheckUser();
        result.redirect = "";
        String username = (String) session.getAttribute(ATTR_USERNAME);
        User ks = userDao.getUser(username);
        if (ks == null) {
            result.redirect = "redirect:/login";
        } else {
            boolean admin = userDao.isAdmin(username);
            if (!admin) {
                result.redirect = "redirect:/accessDenied";
            }
            result.user = ks;
        }
        return result;
    }

    /**
     * Checks if a given User exists on server.
     * @see #redirectIfNotAdmin(UserDAO userDao, HttpSession session)
     */
    public static CheckUser redirectIfNotUser(UserDAO userDao, HttpSession session) {
        CheckUser result = new CheckUser();
        result.redirect = "";
        String username = (String) session.getAttribute(ATTR_USERNAME);
        User ks = userDao.getUser(username);
        if (ks == null) {
            result.redirect = "redirect:/login";
        } else {
            result.user = ks;
        }
        return result;
    }
}
