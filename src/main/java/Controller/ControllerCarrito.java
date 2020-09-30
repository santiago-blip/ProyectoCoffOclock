/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Clases.Carrito;
import Clases.Fecha;
import Clases.Pedido;
import Clases.Productos;
import ClasesDAO.CarritoDAO;
import ClasesDAO.PedidoDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author santi
 */
public class ControllerCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    double totalPagar = 0.0;
    int item;
    static int identificador;
    int cantidad = 1;
    int id;
    Carrito car;
    Productos p;
    List<Carrito> listaCarro = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CarritoDAO cDAO = new CarritoDAO();
        HttpSession sesion = request.getSession();
        switch (request.getParameter("accion")) {

            case "verProductos":
                List<Productos> listado = new ArrayList<>();
                listado = cDAO.listarProductos();
                sesion.setAttribute("Listado", listado);
                sesion.setAttribute("Contador", cDAO.listarCarrito((int) sesion.getAttribute("IdUsuario")).size());
//                request.getRequestDispatcher("productosUsLog.jsp").forward(request, response);
                response.sendRedirect("productosUsLog.jsp");
                break;
            case "agregarCarro":
                cantidad = 1;
                id = Integer.parseInt(request.getParameter("id"));
                p = cDAO.ProductoAgregar(id);
                if(p.getCantidad_Producto()==0){
                    System.out.println("No se puede agregar el producto porque no hay");
                }else{
                item = item + 1;
                car = new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getIdProducto());
                car.setIdUsuario((int) sesion.getAttribute("IdUsuario"));
                car.setNombre_Producto(p.getNombre_Producto());
                car.setDescripcion_Producto(p.getDescripcion_Producto());
                car.setPrecio_producto(p.getPrecio_Producto());
                car.setRutaImg_Producto(p.getRutaImg_Producto());
                car.setCantidad_Producto(cantidad);
                car.setPrecioPagar(cantidad * p.getPrecio_Producto());
                //Agregar al carrito.
                cDAO.agregarCarroBD(car);
                listaCarro = cDAO.listarCarrito((int) sesion.getAttribute("IdUsuario"));
                }
                sesion.setAttribute("Contador", cDAO.listarCarrito((int) sesion.getAttribute("IdUsuario")).size());
                request.getRequestDispatcher("ControllerCarrito?accion=verProductos").forward(request, response);
//                request.getRequestDispatcher("ControllerCarrito?accion=EnviarAproductos").forward(request, response);
                break;
            case "ActualizarCantidad":
                int idPCamb = Integer.parseInt(request.getParameter("idCAMB"));
                int cantidadCamb = Integer.parseInt(request.getParameter("cantidadCamb"));
                int idUser = (Integer) sesion.getAttribute("IdUsuario");
                for (int i = 0; i < listaCarro.size(); i++) {
                    if (listaCarro.get(i).getIdProducto() == idPCamb) {
                        double pagar = listaCarro.get(i).getPrecio_producto();
                        pagar = pagar * cantidadCamb;
                        cDAO.ActualizarCantidadCC(cantidadCamb, pagar, idPCamb,idUser);
                    }
                }
                break;
            case "MostrarCarro":
                totalPagar = 0.0;
                listaCarro = cDAO.listarCarrito((int) sesion.getAttribute("IdUsuario"));
                sesion.setAttribute("ListadoCarro", listaCarro);
                for (int i = 0; i < listaCarro.size(); i++) {
                    totalPagar = totalPagar + listaCarro.get(i).getPrecioPagar();
                }
                System.out.println("Listado" + listaCarro);
                System.out.println("TotalPagar = " + totalPagar);
                sesion.setAttribute("TotalPagar", totalPagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
            case "EliminarCarrito":
                int idC = Integer.parseInt(request.getParameter("idC"));
                int idUserE = (Integer) sesion.getAttribute("IdUsuario");
                cDAO.EliminarCarro(idC,idUserE);
                sesion.setAttribute("Contador",  cDAO.listarCarrito((int) sesion.getAttribute("IdUsuario")).size());
//                request.getRequestDispatcher("ControllerCarrito?accion=MostrarCarro").forward(request, response);
                break;
            case "GenerarCompra":
                int idCliente = (int) sesion.getAttribute("IdUsuario");
                List<Carrito> listarCarroP = new ArrayList<>();
                PedidoDAO Pdao = new PedidoDAO();
                listarCarroP = Pdao.SeleccionarCarro(idCliente);
                System.out.println("Tamaño mi lista: "+listarCarroP.size());
                if(listarCarroP.size()>0){
//                identificador +=1;
                identificador = Pdao.ident();
                    System.out.println("Identicador que trae: "+identificador);
                identificador ++;
                 System.out.println("Identicador que aumenta: "+identificador);
                String codigo = this.getCodigoPedido(10);
                String fecha = Fecha.Fecha();
//                   String fecha = new Date().toString();
                boolean estado = false;
                for(int i=0;i<listarCarroP.size();i++){
                    Pedido pedido = new Pedido(identificador, listarCarroP.get(i).getIdUsuario(),codigo, listarCarroP.get(i).getNombre_Producto(), listarCarroP.get(i).getPrecio_producto(), listarCarroP.get(i).getCantidad_Producto(), listarCarroP.get(i).getPrecioPagar(), estado, fecha, totalPagar);
                    Pdao.generarPedido(pedido);
                }
                sesion.setAttribute("Pedido", "si");
                sesion.setAttribute("codigoPedido",codigo);
                }else{
                    sesion.setAttribute("Pedido", "no");
                }
                response.sendRedirect("ControllerCarrito?accion=MostrarCarro");
                break;
        }
    }

    public String getCodigoPedido(int longitud) {
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