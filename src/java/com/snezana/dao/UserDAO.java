package com.snezana.dao;

import com.snezana.models.Film;
import com.snezana.models.Role;
import com.snezana.models.User;
import java.util.List;

/**
 * DAO Interface for {@link User} class.
 */
public interface UserDAO {

    /**
     * Adds user to database.
     * @param user {@link User} with data (except id) that will be added to
     * database.
     */
    void addUser(User user);

    /**
     * Deletes user from database.
     * @param username {@link User}'s unique username.
     */
    void deleteUser(String username);

    /**
     * Returns list of all users.
     * @return 
     */
    List<User> usersList ();

    /**
     * Retrieves {@link User} from database.
     * @param username unique username.
     * @return 
     */
    User getUser(String username);

    /**
     * Adds new {@link Role} to particular {@link User}.
     * @param username (unique) username.
     * @param rolename (unique) rolename.
     */
    void addRoleToUser(String username, String rolename);

    /**
     * Edit data for the {@link User}.
     * <p>
     * This method affects only 'primary' User data, and not 'secondary', 
     * such as Roles.
     * <p>
     * User is identified by his/her unique username, and that cannot ever
     * be altered.
     * @param user {@link User} whose data is to be edited.
     */
    void editUser (User user);
    
    /**
     * Checks if given {@code User} has the 'Administrator' Role.
     * @param username (unique) username serving as User's id.
     * @return {@code true} if given User is an Administrator, 
     * {@code false} otherwise.
     */
    boolean isAdmin(String username);
    
    /**
     * Returns list of {@link User}s that currently have no rented {@link Film}s.
     * @return 
     */
    List<User> userListNoRent();
    
    /**
     * Returns list of {@link User}s that currently do have one or more 
     * rented {@link Film}s.
     * @return 
     */
    List<User> userListWithRent ();
    
    /**
     * Returns {@code List} of {@code Film}s currently rented by specific User.
     * @param username (unique) User identifier.
     * @return 
     */
    List<Film> filmsRentedByUser(String username);
    
    /**
     * Returns number of rented Films per User, for all Users in the system.
     * <p>
     * This method does not tie each number to a concrete User. Instead, 
     * numbers from this list are only used for the total number of currently
     * rented Films, for the 'Statistics' page.
     * @return 
     */
    List<Integer> listNumRentsPerUser();
    
    /**
     * Statistics: Average number of rented Films per User.
     * @return 
     */
    Double statsAvgFilmsPerUser();
    
    /**
     * Checks if a particular {@link User} has got some rented Films.
     * @param username (unique) User identifier.
     * @return {@code true} if this {@code User} does have rented Film(s),
     * {@code false} otherwise.
     */
    boolean hasGotRentedFilms(String username);
    
    /**
     * Returns total number of {@link User}s currently in the system.
     * @return 
     */
    long totalNoOfUsers();

}
