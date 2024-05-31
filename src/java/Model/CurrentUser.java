/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Dao.UsersAct;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author phoan
 */
public class CurrentUser{
    private static User current = null;
    private static CurrentUser CU = null;

    private CurrentUser(HttpSession sesison) {
        UsersAct act = new UsersAct();
        this.current = act.getUserByUsername((String) sesison.getAttribute("username"));
    }

    public static User getCurrent(HttpSession session) {
        if(CU == null)
            CU = new CurrentUser(session);
        return current;
    }
}
