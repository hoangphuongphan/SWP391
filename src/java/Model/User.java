/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Control.Generator;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author phoan
 */
public class User {
    private String userID, username, password, email, displayName, bio, profilePicture;
    private boolean isPublisher = false,isAdmin = false;
    private java.sql.Date createdAt;

    public User( String username, String password, String email) {
        this.userID = null;
        this.username = username;
        this.password = password;
        this.email = email;
        this.displayName = Generator.getInstance().getNewDisplayName();
        this.bio = null;
        this.isAdmin = false;
        this.isPublisher = false;
        this.createdAt = java.sql.Date.valueOf(LocalDate.now());
        this.profilePicture = null;
    }
    
    public User(String userID, String username, String password, String email, String displayName, Date createdAt, String bio, boolean isPublisher, boolean isAdmin, String profilePicture) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.displayName = displayName;
        this.bio = bio;
        this.isPublisher = isPublisher;
        this.isAdmin = isAdmin;
        this.createdAt = createdAt;
        this.profilePicture = profilePicture;
    }

    public String getUserID() {
        return userID;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getDisplayName() {
        return displayName;
    }

    public String getBio() {
        return bio;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public boolean isIsPublisher() {
        return isPublisher;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public Date getCreatedAt() {
        return createdAt;
    }
}
