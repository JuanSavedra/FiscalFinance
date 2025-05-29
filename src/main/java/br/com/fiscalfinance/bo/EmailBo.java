package br.com.fiscalfinance.bo;

import br.com.fiscalfinance.exception.EmailException;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class EmailBo {
    private static final String APP_EMAIL = "[email@gmail.com]";
    private static final String APP_PASSWORD = "[senha-de-app]";

    public void sendEmail(String receiver, String subject, String content) throws EmailException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(APP_EMAIL, APP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress());
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver));
            message.setSubject(subject);
            message.setText(content);
            Transport.send(message);
        } catch (MessagingException error) {
            throw new EmailException("Erro ao enviar o e-mail: " + error.getMessage());
        }
    }
}
