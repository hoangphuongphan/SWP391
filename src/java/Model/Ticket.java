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
    
    
}
