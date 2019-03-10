package com.snezana.daoImpl;

import com.snezana.models.Film;
import com.snezana.models.User;
import com.snezana.models.Role;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;
import com.snezana.dao.UserDAO;

/**
 * @see UserDAO
 */
@Transactional
public class UserDAOImpl implements UserDAO {

    private SessionFactory sessionFactory;

    public UserDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User k) {
        Session session = sessionFactory.getCurrentSession();
        session.save(k);
    }

    @Override
    public void addRoleToUser(String username, String name) {
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM User WHERE username='" + username + "'";
        Query q = session.createQuery(query);
        User k = (User) q.uniqueResult();
        String query1 = "FROM Role WHERE name='" + name + "'";
        Query q1 = session.createQuery(query1);
        Role r = (Role) q1.uniqueResult();
        Set<Role> e = new HashSet<>();
        e.add(r);
        k.setRoles(e);
        session.update(k);
    }

    @Override
    public void deleteUser(String username) {
        Session session = sessionFactory.getCurrentSession();
        String query = "DELETE FROM User WHERE username = '" + username + "'";
        Query q = session.createQuery(query);
        q.executeUpdate();
    }

    @Override
    public List<User> usersList() {
        int i = 0;
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM User";
        Query q = session.createQuery(query);
        List<User> users = q.list();
        for (User u : users) {
            if (u.getFilms().size() > 0) {
                i++;
            }
        }
        return users;
    }

    @Override
    public User getUser(String username) {
        int i = 0;
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM User WHERE username='" + username + "'";
        Query q = session.createQuery(query);
        User k = (User) q.uniqueResult();
        if (k != null && k.getFilms().size() > 0) {
            i++;
        }
        return k;
    }

    @Override
    public void editUser(User k) {
        Session session = sessionFactory.getCurrentSession();
        String query = "UPDATE User SET first='" + k.getFirst() + "'" + "," + "last='" + k.getLast() + "'" + "," + "idNum=" + k.getIdNum() + "," + "phone='" + k.getPhone() + "'" + "," + "password='" + k.getPassword() + "'" + "WHERE username='" + k.getUsername() + "'";
        Query q = session.createQuery(query);
        q.executeUpdate();
    }

    @Override
    public boolean isAdmin(String username) {
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM User WHERE username='" + username + "'";
        Query q = session.createQuery(query);
        User k = (User) q.uniqueResult();
        String name = "";
        for (Role role : k.getRoles()) {
            name = role.getName();
            break;
        }
        if (name.equals("ADMIN")) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<User> userListNoRent() {
        List<User> freeUsers = new ArrayList<>();
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM User";
        Query q = session.createQuery(query);
        List<User> users = q.list();
        for (User k : users) {
            if (k.getFilms().isEmpty()) {
                freeUsers.add(k);
            }
        }
        return freeUsers;
    }

    @Override
    public List<User> userListWithRent() {
        List<User> usersWithRent = new ArrayList<>();
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM User";
        Query q = session.createQuery(query);
        List<User> users = q.list();
        for (User k : users) {
            if (!k.getFilms().isEmpty()) {
                usersWithRent.add(k);
            }
        }
        return usersWithRent;
    }

    @Override
    public List<Film> filmsRentedByUser(String username) {
        List<Film> filmListPerUser = new ArrayList<>();
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM User WHERE username='" + username + "'";
        Query q = session.createQuery(query);
        User k = (User) q.uniqueResult();
        for (Film f : k.getFilms()) {
            filmListPerUser.add(f);
        }
        return filmListPerUser;
    }

    @Override
    public long totalNoOfUsers() {
        long n = 0;
        Session session = sessionFactory.getCurrentSession();
        String query = "SELECT COUNT(*) FROM User";
        Query q = session.createQuery(query);
        n = (long) q.uniqueResult();
        return n;
    }

    @Override
    public List<Integer> listNumRentsPerUser() {
        Session session = sessionFactory.getCurrentSession();
        String query = "SELECT rentedFilms FROM User";
        Query q = session.createQuery(query);
        List<Integer> numRentsUser = q.list();
        return numRentsUser;
    }

    @Override
    public Double statsAvgFilmsPerUser() {
        Double result = 0.0;
        for (int i = 0; i < totalNoOfUsers(); i++) {
            result = result + listNumRentsPerUser().get(i);
        }
        if (totalNoOfUsers() == 0) {
            result = 0d;
            return result;
        }
        result = result / totalNoOfUsers();
        return result;
    }

    @Override
    public boolean hasGotRentedFilms(String username) {
        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        String query = "FROM User WHERE username='" + username + "'";
        Query q = session.createQuery(query);
        User k = (User) q.uniqueResult();
        result = !k.getFilms().isEmpty();
        session.update(k);
        return result;
    }

}
