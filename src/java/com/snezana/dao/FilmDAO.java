package com.snezana.dao;

import com.snezana.models.Film;
import com.snezana.models.User;
import java.util.List;

/**
 * DAO interface for operations on the {@link Film} object.
 */
public interface FilmDAO {

    /**
     * Adds new Film to db.
     * @param film {@link Film} object to be inserted into database.
     */
    void addFilm(Film film);

    /**
     * Searches for Film by its (unique) name and deletes it from database.
     * @param title (unique) title of the film.
     */
    void deleteFilm(String title);

    /**
     * Returns all available {@link Film}s in a list.
     * @return
     */
    List<Film> listOfFilms ();

    /**
     * Searches for a {@link Film} with given name.
     * @param title (unique) Film title.
     * @return {@link Film} with given filmName, or null if it does not exist.
     */
    Film getFilm(String title);

    /**
     * Applies changes for a Film.
     * <p>
     * Film is matched by its {@link Film#name} which is to be unique, and
     * cannot be altered for a single Film; i.e. {@link Film#name} is treated
     * the same way as {@link Film#id}.
     * @param film {@link Film} object that contains some altered data.
     */
    void editFilm (Film film);

    /**
     * Marks the {@link Film} {@code filmName} as rented by the user {@code username}.
     * @param title title of the Film that is rented.
     * @param username username of the User that rented this Film.
     */
    void rentFilm(String title, String username);

    /**
     * Checks if a Film is rented
     * @param title a {@link Film} with given title.
     * @return {@code true} if a Film is rented, {@code false} otherwise.
     */
    boolean isRented(String title);

    /**
     * "Returns" a {@link Film} to Video Club, marking it no longer rented.
     * @param title (unique) name of the Film.
     * @return Last {@link User} that rented the Film.
     */
    User returnFilm(String title);

    /**
     * Returns all (currently) rented {@link Film}s in a List.
     * @return
     */
    List<Film> rentedFilms();

    /**
     * Returns list of all "available", i.e. not rented {@link Film}s.
     * @return
     */
    List<Film> availableFilms();

    /**
     * Counts all available films currently in database.
     * @return
     */
    long filmsCount();

    /**
     * Statistics: number of rents per {@link Film}.
     * <p>
     * These numbers are not tied to particular {@link Film}s and are used
     * only to summarize the total number of rents, or calculate statistical
     * average rents per film.
     * @return
     */
    List<Integer> rentsPerFilms();

    /**
     * Statistics: average number of rents per Film.
     * @return Statistical average value, rents-per-film.
     */
    Double avgRentsPerFilm();
}
