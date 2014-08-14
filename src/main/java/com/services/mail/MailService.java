package com.services.mail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Calendar;
import java.util.Properties;

public class MailService implements Runnable{

    private String username;
    private String password;
    private Properties props;
    private String fromEmail;
    private String title;
    private String text;
    private String toEmail;


    public MailService(String username, String password, String fromEmail, String title, String text) {
        this.username = username;
        this.password = password;
        this.fromEmail = fromEmail;
        this.title = title;
        this.text = text;

        props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
    }

    private void send() {
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        if (toEmail != null && !toEmail.equals("")) {
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(fromEmail));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
                message.setSubject(title);
                message.setText(text);

                Transport.send(message);
            } catch (MessagingException ignored) {

            }
        }
    }

    public void setEmail(String email){
        this.toEmail = email;
    }

    @Override
    public void run() {
        send();
    }
}