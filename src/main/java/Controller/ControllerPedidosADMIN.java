/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Clases.Pedido;
import Clases.PedidosADMON;
import Clases.Ventas;
import ClasesDAO.PedidosADMONDAO;
import ClasesDAO.VentasDAO;
import java.io.IOException;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author santi
 */
public class ControllerPedidosADMIN extends HttpServlet {

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
        PedidosADMONDAO PadminDAO = new PedidosADMONDAO();
        switch (accion) {
            case "verPedidos":
                List<PedidosADMON> listaPadmin = new ArrayList<>();
                listaPadmin = PadminDAO.retornarTodo();
                //Primer listado para posiciones
//        List<List> listaPadminResultado = new ArrayList<>();
//        listaPadminResultado = PadminDAO.retornarPedidos(listaPadmin);
                //Listado para resultado
                sesion.setAttribute("ListaPADMON", listaPadmin);
                request.getRequestDispatcher("pedidos.jsp").forward(request, response);
                //response.sendRedirect("pedidos.jsp");
                break;
            case "verCliente":
               int identificador = Integer.parseInt(request.getParameter("identificador"));
               List<PedidosADMON> Padmin = new ArrayList<>();
               Padmin = PadminDAO.retornarCliente(identificador);
               
                System.out.println("Tamaño de la lista que trae: "+Padmin.size());
               
               request.setAttribute("Usuario", Padmin);
               request.getRequestDispatcher("UsuarioPedido.jsp").forward(request, response);
               break;
            case "RealizarVenta":
                int identificadorVenta = Integer.parseInt(request.getParameter("identificadorVenta"));
                int resultado = 0;
                Ventas venta;
                List<Pedido> lista;
                //Empezamos proceso
                VentasDAO vDAO = new VentasDAO();
                venta = vDAO.venta(identificadorVenta);
                lista = vDAO.Listarventa(identificadorVenta);
                resultado = vDAO.RelizarVenta(venta, lista);
                System.out.println("Lisa que trae : "+lista.size());
                out.println("Resultado de vDao.realizarVENTA es : "+resultado);
                if(resultado>0){
                    request.setAttribute("ResultadoVenta", resultado);
                }else{
                    request.setAttribute("ResultadoVenta", resultado);
                }
                request.getRequestDispatcher("UsuarioPedido.jsp").forward(request, response);
                break;
        }

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
