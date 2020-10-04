/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

//import Clases.Mail;
import Clases.Usuario;
import ClasesDAO.UsuariosDAO;
import java.io.IOException;
//import java.util.Properties;
//import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
import javax.mail.Message;
import javax.mail.MessagingException;
//import javax.mail.PasswordAuthentication;
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
public class ControllerUser extends HttpServlet {

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
        response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server  
        /* TODO output your page here. You may use following sample code. */
        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();
        UsuariosDAO Udao = new UsuariosDAO();
        switch (accion) {
            case "Registrar":
                            try {
                int resultadoCorreo = 0;
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String tipoDocumento = request.getParameter("tipoDoc");
                String documento = request.getParameter("documento");
                String correo = request.getParameter("correo");
                String password = request.getParameter("password");
                int rol = Integer.parseInt(request.getParameter("rol"));
                String code = getCadenaAlfanumAleatoria(8);
                boolean estado = false;
                Usuario usuario = new Usuario(rol, nombre, apellido, tipoDocumento, documento, correo, password, estado, code);
                resultadoCorreo = Udao.buscarCorreo(usuario);
                if (resultadoCorreo == 1) {
                    request.setAttribute("CorreoRegistrado", "1");
                } else {
                    Udao.insertarUsuario(usuario);
                    request.setAttribute("CorreoRegistrado", "2");
                    //Mail email = new Mail(correo, code);
                    //Inicio correo
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
                        message.setSubject("Correo de verificación CoffoClock");
                        message.setText(
                                " Este es un correo de verificación \n"
                                + "Gracias por inscribirse a COFFOCLOCK.COM \n"
                                + "Por favor haga click en el siguiente enlace\n"
                                + "para seguir con la verificación de sus datos \n"
                                + "  <a href='http://localhost:8080/CoffOclock/ActivarCuenta?usuario=" + correo + "&code=" + code
                                + "'>Enlace</a>  ", "ISO-8859-1", "html");
                        // Envio de correo
                        Transport t = session.getTransport("smtp");
                        t.connect("smtp.gmail.com", "Coffoclock@gmail.com", "Pry#2006"); //correo/contraseña de quien manda el correo.
                        t.sendMessage(message, message.getAllRecipients());
                        t.close();
                    } catch (MessagingException e) {
                        System.out.println("Error al enviar email por: " + e);
                    }
                    //fin correo
                }
            } catch (NumberFormatException e) {
                System.out.println("Error en servlet por: " + e);
            }
            request.getRequestDispatcher("index.jsp").forward(request, response);
            break;
            case "Login":
                String correo = request.getParameter("correoL");
                String pass = request.getParameter("passL");
                int encontrado = 0;
                int id = 0;
                Usuario usuario = new Usuario();
                usuario.setCorreoElectronico_Usuario(correo);
                usuario.setContrasena_Usuario(pass);
                encontrado = Udao.Login(usuario);
                if (encontrado == 2) {
//                    sesion.setAttribute("logAdmin", "2");
//                    response.sendRedirect("admon.jsp");
                    //Código de prueba
                    id = Udao.idUsuario(usuario);
                    sesion.setAttribute("IdUsuario", id);
                    sesion.setAttribute("log", "2");
                    response.sendRedirect("admon.jsp");
//                    request.getRequestDispatcher("admon.jsp").forward(request, response);
                } else if (encontrado == 1) {
//                    sesion.setAttribute("logUser", "1");
//                    response.sendRedirect("UsuarioLog.jsp");
                    //código de prueba
                    id = Udao.idUsuario(usuario);
                    sesion.setAttribute("IdUsuario", id);
                    sesion.setAttribute("log", "1");
                    response.sendRedirect("UsuarioLog.jsp");
                } else if (encontrado == 3) {
                    sesion.setAttribute("log", "3");
                    response.sendRedirect("index.jsp");
                } else {
                    sesion.setAttribute("NoLog", "0");
                    response.sendRedirect("index.jsp");
                }
                break;
            case "CerrarSesion":
                String user = request.getParameter("user");
                response.sendRedirect("index.jsp");
//                switch (user) {
//                    case "admin":
//                        sesion.invalidate();
//                        response.sendRedirect("admon.jsp");
//                        break;
//                    case "usuario":
//                        sesion.invalidate();
//                        response.sendRedirect("UsuarioLog.jsp");
//                        break;
//                    case "adminInv":
//                        sesion.invalidate();
//                        response.sendRedirect("inventario.jsp");
//                        break;
//                    case "adminPrd":
//                        sesion.invalidate();
//                        response.sendRedirect("productos.jsp");
//                        break;
//                    case "productosUs":
//                        sesion.invalidate();
//                        response.sendRedirect("productosUsLog.jsp");
//                        break;
//                }

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
