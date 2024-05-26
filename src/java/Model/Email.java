package Model;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Email {
    final String from = "thegamebookstore@gmail.com";
    final String pass = "ujsg anlw lwud pjzn";
    String to;
    String content;
    String subject;
    Properties prop = null;
    Authenticator auth = null;
    Session session = null;
    MimeMessage msg;
    
    public Email(String address, String content, String subject) {
        to = address;
        this.content = content;
        this.subject = subject;
    }
    
    public void run() {
        setProperties();
        authenticate();
        draftEmail();
        sendEmail();
    }
    
    private void setProperties(){
        prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
    }
    
    private void authenticate(){
        auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from,pass);
            }
            
        };
        session = Session.getInstance(prop,auth);
    }
    
    private void draftEmail(){
        msg = new MimeMessage(session);
        try {
            msg.addHeader("content-type", "text/HTML; charset = UTF-8"); // keiu noi dung
            msg.setFrom(from); // nguoi goi
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false)); // nguoi nhan
            msg.setSubject(subject); // chu de
            msg.setText(content,"UTF-8");
        } catch (MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void sendEmail(){
        try {
            Transport.send(msg);
        } catch (MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
