/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import ClasesDAO.ActivarCuentaDAO;
import ClasesDAO.RecuperarDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author santi
 */
public class RecuperarPass extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        String accion = request.getParameter("accion");
        RecuperarDAO rDAO = new RecuperarDAO();
        switch (accion) {
            case "GenerarCodigo":
                String correo = request.getParameter("RecuperarMail");
                String code = this.getCadenaAlfanumAleatoria(8);
                int resultado = 0;
                resultado = rDAO.generarCodigo(correo, code);
                //Inicio envio de correo
                Properties props = new Properties();
                props.setProperty("mail.smtp.host", "smtp.gmail.com");
                props.setProperty("mail.smtp.starttls.enable", "true");
                props.setProperty("mail.smtp.port", "587");
                props.setProperty("mail.smtp.user", "Coffoclock@gmail.com");//correo de quien manda el correo.
                props.setProperty("mail.smtp.auth", "true");
                // Preparamos la sesion
                Session session = Session.getDefaultInstance(props);
                // Contenido del mensaje
                MimeMessage message = new MimeMessage(session);
                // la persona k tiene k verificar
                try {
                    message.setFrom(new InternetAddress("Coffoclock@gmail.com"));//correo de quien manda el correo.
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo)); //acá
                    // message.addHeader("Disposition-Notification-To", "Coffoclock@gmail.com");
                    message.setSubject("Correo de recuperación de contraseña CoffoClock");
                    message.setText(
                            " Pulse el link para recuperar la contraseña \n"
                            + "  <a href='http://localhost:8080/CoffOclock/RecuperarPass?accion=FormularioRecuperar&usuario=" + correo + "&code=" + code
                            + "'>Enlace</a>  ", "ISO-8859-1", "html");
                    // Envio de correo
                    Transport t = session.getTransport("smtp");
                    t.connect("smtp.gmail.com", "Coffoclock@gmail.com", "Pry#2006"); //correo/contraseña de quien manda el correo.
                    t.sendMessage(message, message.getAllRecipients());
                    t.close();
                } catch (MessagingException e) {
                    System.out.println("Error al enviar email por: " + e);
                }
                //Fin envio de correo
                if (resultado > 0) {
                    request.setAttribute("RecuperoContrasena", 1);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("RecuperoContrasena", 0);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
            case "FormularioRecuperar":
                
                String correoR = request.getParameter("usuario");
                String codeR = request.getParameter("code");
                int resultadoR = 0;
                ActivarCuentaDAO cDAO = new ActivarCuentaDAO();

                resultadoR = cDAO.RecuperarCuenta(correoR, codeR);

                if (resultadoR >0) {
                    sesion.setAttribute("NoIngresar", "false");
                    sesion.setAttribute("CorreoCambio", correoR);
                    sesion.setAttribute("EntrarRecuperar", 1);
                    response.sendRedirect("RecuperarContrasena.jsp");
                } else {
                    request.setAttribute("RecuperoContrasena", 0);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
            case "cambiar":
                String pass = request.getParameter("pass");
                String correoF = request.getParameter("CorreoCam");
                rDAO.cambiarPass(correoF, pass);
                break;
        }

    }

    public String getCadenaAlfanumAleatoria(int longitud) {
        String cadenaAleatoria = "";
        long milis = new java.util.GregorianCalendar().getTimeInMillis();
        Random r = new Random(milis);
        int i = 0;
        while (i < longitud) {
            char c = (char) r.nextInt(255);
            // System.out.println("char:"+c);
            if ((c >= '0' && c <= 9) || (c >= 'A' && c <= 'Z')) {
                cadenaAleatoria += c;
                i++;
            }
        }
        return cadenaAleatoria;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
