/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Dao.UserDao;

/**
 *
 * @author phoan
 */
public class Ticket {
    private int TicketID;
    private User user;
    private String subject, content;

    public Ticket(int TicketID, int UserID, String subject, String content) {
        this.TicketID = TicketID;
        this.user = new UserDao().getUserByID(UserID);
        this.subject = subject;
        this.content = content;
    }
    
    public Ticket( int UserID, String subject, String content) {
        this.user = new UserDao().getUserByID(UserID);
        this.subject = subject;
        this.content = content;
    }

    public int getTicketID() {
        return TicketID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
}
