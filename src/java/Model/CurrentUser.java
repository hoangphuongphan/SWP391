/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author phoan
 */
public class CurrentUser{
    private static User current = null;

    public static User getCurrent() {
        return current;
    }
    
    public static void initialize(User current){
        CurrentUser.current = current;
    }
    
    public static void delete(){
        CurrentUser.current = null;
    }
}
