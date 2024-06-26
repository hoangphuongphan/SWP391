/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Control.Generator;
import java.net.*;
import java.util.Base64;
import java.io.*;
/**
 *
 * @author phoan
 */
public class Phone {
    
    public static void main(String[] args) {
        Phone phone = new Phone();
        phone.sendSMS("0914020508", "checking SMS");
    }
    
    public void sendSMS(String phone, String content){
        String myURI = "https://api.bulksms.com/v1/messages";
        // change these values to match your own account
        String myUsername = "sunheophp";
        String myPassword = "3092004sS";
        phone = Generator.getInstance().phoneTrans(phone);

        // the details of the message we want to send
//        String myData = "{to: \""+phone+"\", encoding: \"UNICODE\", body: \"Dobrá práce! Jak se máš?\"}";

        // if your message does not contain unicode, the "encoding" is not required:
         String myData = "{to: \""+phone+"\", body: \""+content+"\"}";

        // build the request based on the supplied settings
        try{
            URL url = new URL(myURI);
            HttpURLConnection request = (HttpURLConnection) url.openConnection();
            request.setDoOutput(true);

            // supply the credentials
            String authStr = myUsername + ":" + myPassword;
            String authEncoded = Base64.getEncoder().encodeToString(authStr.getBytes());
            request.setRequestProperty("Authorization", "Basic " + authEncoded);

            // we want to use HTTP POST
            request.setRequestMethod("POST");
            request.setRequestProperty( "Content-Type", "application/json");

            // write the data to the request
            OutputStreamWriter out = new OutputStreamWriter(request.getOutputStream());
            out.write(myData);
            out.close();
            try {
                // make the call to the API
                InputStream response = request.getInputStream();
                BufferedReader in = new BufferedReader(new InputStreamReader(response));
                String replyText;
                while ((replyText = in.readLine()) != null) {
                  System.out.println(replyText);
                }
                in.close();
            } catch (IOException ex) {
                System.out.println("An error occurred:" + ex.getMessage());
                BufferedReader in = new BufferedReader(new InputStreamReader(request.getErrorStream()));
                // print the detail that comes with the error
                String replyText;
                while ((replyText = in.readLine()) != null) {
                  System.out.println(replyText);
                }
                in.close();
            }
            request.disconnect();
        }catch(Exception ex){ }
    }
}
