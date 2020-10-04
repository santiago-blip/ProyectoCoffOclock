/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Clases.Grafica;
import Clases.Ventas;
import ClasesDAO.GraficasDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ControllerGraficas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        String accion = request.getParameter("accion");
        switch (accion) {
            case "VerGrafica":
                int year = 2020;
                //Establecer meses
                String listaFecha[] = new String[12];
                listaFecha[0] = "ENERO";
                listaFecha[1] = "FEBRERO";
                listaFecha[2] = "MARZO";
                listaFecha[3] = "ABRIL";
                listaFecha[4] = "MAYO";
                listaFecha[5] = "JUNIO";
                listaFecha[6] = "JULIO";
                listaFecha[7] = "AGOSTO";
                listaFecha[8] = "SEPTIEMBRE";
                listaFecha[9] = "OCTUBRE";
                listaFecha[10] = "NOVIEMBRE";
                listaFecha[11] = "DICIEMBRE";

                //TRAIGO LOS VALORES DEL MES
                List<Grafica> listaVenta = new ArrayList<>();
                //LLamamos el método
                GraficasDAO gDAO = new GraficasDAO();
                listaVenta = gDAO.graficarVenta(year);
                //FOREACH PARA MOSTRAR VALORES

                int k = 0;
                for (Grafica f : listaVenta) {
                    System.out.println("Esto trae en el mes " + (k + 1) + " " + f.getMes());
                    System.out.println("Esto trae en el año " + (k + 1) + " " + f.getYear());
                    System.out.println("Esto trae en el resultado " + (k + 1) + " " + f.getTotalGrafica());
                    k++;
                }
                sesion.setAttribute("year", year);
                sesion.setAttribute("Venta", listaVenta);
                response.sendRedirect("ventas.jsp");
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
