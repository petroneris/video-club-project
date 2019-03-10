package com.snezana.daoImpl;

import com.snezana.dao.FilmDAO;
import com.snezana.models.Film;
import com.snezana.models.User;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;
import static com.snezana.models.Film.NOT_RENTED;

/**
 * @see FilmDAO
 */
@Transactional
public class FilmDAOImpl implements FilmDAO {

    private SessionFactory sessionFactory;

    public FilmDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addFilm(Film f) {
        Session session = sessionFactory.getCurrentSession();
        session.save(f);
    }

    @Override
    public void deleteFilm(String title) {
        Session session = sessionFactory.getCurrentSession();
        String query = "DELETE FROM Film WHERE title = '" + title + "'";
        Query q = session.createQuery(query);
        q.executeUpdate();
    }

    @Override
    public List<Film> listOfFilms() {
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM Film";
        Query q = session.createQuery(query);
        List<Film> films = q.list();
        return films;
    }

    @Override
    public Film getFilm(String title) {
        int i = 0;
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM Film WHERE title='" + title + "'";
        Query q = session.createQuery(query);
        Film f = (Film) q.uniqueResult();
        if (f != null && f.getUsers().size() > 0) {
            i++;
        }
        return f;
    }

    @Override
    public void editFilm(Film film) {
        Session session = sessionFactory.getCurrentSession();
        String query = "UPDATE Film SET genre='" + film.getGenre() + "',year='" 
                + film.getYear() + "' WHERE title='" + film.getTitle() + "'";
        Query q = session.createQuery(query);
        q.executeUpdate();
    }

    @Override
    public void rentFilm(String title, String username) {
        Calendar cal = Calendar.getInstance();
        long timestamp = cal.getTimeInMillis();
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM Film WHERE title='" + title + "'";
        Query q = session.createQuery(query);
        Film f = (Film) q.uniqueResult();
        String query1 = "FROM User WHERE username='" + username + "'";
        Query q1 = session.createQuery(query1);
        User k = (User) q1.uniqueResult();
        Set<User> e = new HashSet<>();
        e.add(k);
        f.setUsers(e);
        f.setRentTime(timestamp);
        f.setNumRents(f.getNumRents() + 1);
        k.setRentedFilms(k.getRentedFilms() + 1);
        session.update(f);
        session.update(k);
    }

    @Override
    public boolean isRented(String title) {
        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM Film WHERE title='" + title + "'";
//        System.out.println("is rented query: " + query);
        Query q = session.createQuery(query);
        Film f = (Film) q.uniqueResult();
        result = !f.getUsers().isEmpty();
        session.update(f);
        return result;
    }

    @Override
    public User returnFilm(String title) {
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM Film WHERE title='" + title + "'";
        Query q = session.createQuery(query);
        Film f = (Film) q.uniqueResult();
        String username = "";
        for (User k : f.getUsers()) {
            username = k.getUsername();
            break;
        }
        String query1 = "FROM User WHERE username='" + username + "'";
        Query q1 = session.createQuery(query1);
        User k = (User) q1.uniqueResult();
        Set<User> e = new HashSet<>(0);
        f.setUsers(e);
        f.setRentTime(NOT_RENTED);
        session.update(f);
        return k;
    }

    @Override
    public List<Film> rentedFilms() {
        List<Film> rntdFilms = new ArrayList<>();
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM Film";
        Query q = session.createQuery(query);
        List<Film> films = q.list();
        for (Film f : films) {
            if (!f.getUsers().isEmpty()) {
                rntdFilms.add(f);
            }
        }
        return rntdFilms;
    }

    @Override
    public List<Film> availableFilms() {
        List<Film> freeFilms = new ArrayList<>();
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM Film";
        Query q = session.createQuery(query);
        List<Film> films = q.list();
        for (Film f : films) {
            if (f.getUsers().isEmpty()) {
                freeFilms.add(f);
            }
        }
        return freeFilms;
    }

    @Override
    public long filmsCount() {
        long n = 0;
        Session session = sessionFactory.getCurrentSession();
        String query = "SELECT COUNT(*) FROM Film";
        Query q = session.createQuery(query);
        n = (long) q.uniqueResult();
        return n;
    }

    @Override
    public List<Integer> rentsPerFilms() {
        Session session = sessionFactory.getCurrentSession();
        String query = "SELECT numRents FROM Film";
        Query q = session.createQuery(query);
        List<Integer> numRentsList = q.list();
        return numRentsList;
    }

    @Override
    public Double avgRentsPerFilm() {
        Double result = 0.0;
        for (int i = 0; i < rentsPerFilms().size(); i++) {
            result = result + rentsPerFilms().get(i);
        }
        if (filmsCount() == 0) {
            result = 0d;
            return result;
        }
        result = result / filmsCount();
        return result;
    }

}
