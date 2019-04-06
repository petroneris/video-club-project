# video-club-project
Spring MVC demonstrator project built in NetBeans

<img src="web/resources/images/springBloss4.png" width="400">
<br/>

### THE SPRING MVC APPLICATION “VideoKlubProjekat”
<br/>
The application “VideoKlubProjekat” has film renting and tracking of various resources as a main goal. This application is dedicated both to the administrator, whose role is to control the whole application, and also to the user for film/media renting.

“VideoKlubProjekat” is the web application which demonstrates a usage of the following technologies:
- Spring MVC framework (MVC pattern) – business layer
- Hibernate (ORM)
- MySQL – RDBMS data layer
- JSP + JSTL + different TAG libraries: presentational (View) layer
- Bootstrap + Jquery: front-end framework (css + js)
A standard JavaEE Servlet container is used as server platform.
Communication protocol is “pure” HTTP without AJAX.
Every web page generated by server has its own URL (Permalink).

For application design the NetBeans IDE has been used.

Java code is jdk 1.7 – compliant.

A short description of coding technologies used in application design, application rules, configuration and design details, and also guidelines for further application improvements are presented in [documentation:](doc/VideoKlubProjekat.pdf)

Library versions of various technologies were given in figure 2 of this document. 

Prior to starting the application you need to create and populate MySQL database as described in the document and [this sql file](sql/dbvideo_club.sql). After that please update the database access credentials with your own values in [src/java/hibernate.cfg.xml](src/java/hibernate.cfg.xml).

You can start application from NetBeans: on taskbar, click the **'Run Project'** button, or hit [F6] or use the menu command **Run --> Run Project**.

There are no unit tests for the moment. Feel free to add your own :smiley:.

You can see the application demo video [here](video/Videoklub.mp4). You can download it as a separate file in a straightforward manner; however if you wish to clone it as part of the entire repository you will have to install [Git LFS Client](https://www.atlassian.com/git/tutorials/git-lfs) first.
