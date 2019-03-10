package com.snezana.models;
// Generated Aug 24, 2016 5:53:20 PM by Hibernate Tools 4.3.1

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * Film generated by hbm2java Hibernate.
 */
@Entity
@Table(name = "film", catalog = "dbvideo_club"
)
public class Film implements java.io.Serializable {

    public static final long NOT_RENTED = -1;
    private Integer id;
    private String title;
    private String genre;
    private Integer year;
    private Long rentTime = NOT_RENTED;
    private Integer numRents = 0;
    private Set<User> users = new HashSet<User>(0);

    public Film() {
    }

    public Film(String title, String genre, Integer year) {
        this.title = title;
        this.genre = genre;
        this.year = year;
    }

    public Film(String title, String genre, Integer year, Long rentTime,
            Integer numRents, Long totalRentTime, Set<User> users) {
        this.title = title;
        this.genre = genre;
        this.year = year;
        this.rentTime = rentTime;
        this.numRents = numRents;
        this.users = users;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "id", unique = true, nullable = false)
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "title", length = 45)
    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "genre", length = 45)
    public String getGenre() {
        return this.genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    @Column(name = "year")
    public Integer getYear() {
        return this.year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    @Column(name = "time_filmrent")
    public Long getRentTime() {
        return this.rentTime;
    }

    public void setRentTime(Long rentTime) {
        this.rentTime = rentTime;
    }

    @Column(name = "n_rentperfilm")
    public Integer getNumRents() {
        return this.numRents;
    }

    public void setNumRents(Integer numRents) {
        this.numRents = numRents;
    }

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_film", catalog = "dbvideo_club", joinColumns = {
        @JoinColumn(name = "film_id", nullable = false, updatable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "user_id", nullable = false, updatable = false)})
    public Set<User> getUsers() {
        return this.users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 83 * hash + Objects.hashCode(this.id);
        hash = 83 * hash + Objects.hashCode(this.title);
        hash = 83 * hash + Objects.hashCode(this.genre);
        hash = 83 * hash + Objects.hashCode(this.year);
        hash = 83 * hash + Objects.hashCode(this.rentTime);
        hash = 83 * hash + Objects.hashCode(this.numRents);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Film other = (Film) obj;
        if (!Objects.equals(this.title, other.title)) {
            return false;
        }
        if (!Objects.equals(this.genre, other.genre)) {
            return false;
        }
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.year, other.year)) {
            return false;
        }
        if (!Objects.equals(this.rentTime, other.rentTime)) {
            return false;
        }
        if (!Objects.equals(this.numRents, other.numRents)) {
            return false;
        }
        if (!Objects.equals(this.users, other.users)) {
            return false;
        }
        return true;
    }

    /**
     * Utility: Returns String representation of given time
     * @param time epoch time in millis.
     * @return
     */
    public static String convertTime(long time) {
        Date date = new Date(time);
        Format format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        return format.format(date);
    }

    /**
     * Utility: Calculates remaining rental time.
     * @param time1 epoch time in milliseconds when rental started.
     * @param time2 epoch time in milliseconds to which rental overflow is
     * observed, notably the present moment.
     * @return Human readable information about remaining rental time.
     */
    public static String remainingTime(long time1, long time2) {
        // Max rental period - 10 hours.
        long rentTime = 10 * 60 * 60 * 1000;
        String note = "";

        long diff = time1 + rentTime - time2;
        long diffSeconds = diff / 1000 % 60;
        long diffMinutes = diff / (60 * 1000) % 60;
        long diffHours = diff / (60 * 60 * 1000) % 24;
        long diffDays = diff / (24 * 60 * 60 * 1000);

        note = " " + diffDays + "d/" + diffHours + "h/" + diffMinutes + "min";
        return note;
    }

    /**
     * Utility: returns current (epoch) time in millis.
     * @return
     */
    public static long currentTime() {
        Calendar cal = Calendar.getInstance();
        long currTime = cal.getTimeInMillis();
        return currTime;
    }

    /**
     * Utility: Checks if rental time has been exceeded.
     * @param time1 epoch time in milliseconds when rental started.
     * @param time2 epoch time in milliseconds to which rental overflow is
     * observed.
     * @return {@code true} if rental time has exceeded maximum allowed value.
     */
    public static boolean isRentalTimeExpired(long time1, long time2) {
        long rentalPeriod = 10 * 60 * 60 * 1000; //rental period for film - 10h ( for testing )
        long diff = time1 + rentalPeriod - time2;
        if (diff > 0) {
            return true;
        }
        return false;
    }

}