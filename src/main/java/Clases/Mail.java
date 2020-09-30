package Clases;

import java.util.Properties;
import javax.mail.*;
//import javax.mail.MessagingException;
//import javax.mail.Session;
//import javax.mail.Transport;
import javax.mail.internet.*;
//import javax.mail.internet.MimeMessage;

public class Mail {
    
    private final String correo;
    private final String code;
       
       public Mail(String correo,String code){
       this.correo = correo;
       this.code = code;
       }
       
    public void EnviarMail() throws MessagingException{
        //Envio de correo de verificacion de cuenta
            try{
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.user", "proyectocoffoclock@yahoo.com");
            props.setProperty("mail.smtp.auth", "true");
            // Preparamos la sesion
            Session session = Session.getDefaultInstance(props);
            // Contenido del mensaje
            MimeMessage message = new MimeMessage(session);
            // la persona k tiene k verificar
            
            message.setFrom(new InternetAddress("proyectocoffoclock@yahoo.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.correo)); //acá
            message.addHeader("Disposition-Notification-To", "proyectocoffoclock@yahoo.com");
            message.setSubject("Correo de verificación, por favor no responder");
            message.setText(
                    " Este es un correo de verificación \n"
                    + "Gracias por inscribirse a COFFOCLOCK.COM \n"
                    + "Por favor haga click en el siguiente enlace\n"
                    + "para seguir con la verificación de sus datos \n"
                    + "  <a href='http://localhost:8080/Proyecto/ActivacionCuenta?usuario=" + this.correo + "&code=" + this.code
                    + "'>Enlace</a>  ", "ISO-8859-1", "html");
        // Envio de correo
            Transport t = session.getTransport("smtp");
            t.connect("smtp.gmail.com","proyectocoffoclock@yahoo.com", "Proyecto#2020");
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            }catch(MessagingException e){System.out.println("Error al enviar email por: "+e);
        }
    }
    
}
