/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Clases.Productos;
import ClasesDAO.ProductosDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author santi
 */
public class ControllerProductos extends HttpServlet {

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
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        String accion = request.getParameter("accion");
        ProductosDAO pDAO = new ProductosDAO();
        Productos productos = new Productos();
        System.out.println("Accion: " + accion);
         HttpSession sesion = request.getSession();
         //Este switch se utiliza para que este controlador haga múltiples tareas, ejecutando solamente la necesaria y no todo el servlet(Controlador).
        switch (accion) {
            //este caso inserta los productos que el administrador digite.
            case "insertar":
                File f = null;
                ArrayList<String> lista = new ArrayList();
                try {
                    //Creamos variables para leer archivos
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    //Recorre los items, que en este caso serían los inputs del formulario que envía el admin.
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if (!fileItem.isFormField()) {
                            //Si entra en esta condición, quiere decir que es un archivo, entonces le damos la ruta donde queremos que se guarde.
                            f = new File("D:\\ProgramasDevops\\NetBeans\\CoffOclock\\src\\main\\webapp\\imgProductos\\" + fileItem.getName());
                            if (!f.exists()) {
                                fileItem.write(f);
                                productos.setRutaImg_Producto("imgProductos/" + f.getName());
                            } else {
                                productos.setRutaImg_Producto("imgProductos/" + f.getName());
                            }
                        } else {
                            lista.add(fileItem.getString());
                        }
                    }
                    String nombre = lista.get(0).toLowerCase();
                    nombre = nombre.substring(0, 1).toUpperCase() + nombre.substring(1).toLowerCase(); //Primera letra en mayúscula.
                    productos.setNombre_Producto(nombre);
                    productos.setCategoria_Producto(lista.get(1));
                    productos.setPrecio_Producto(Double.parseDouble(lista.get(2)));
                    productos.setCantidad_Producto(Integer.parseInt(lista.get(3)));
                    productos.setDescripcion_Producto(lista.get(4));
                    productos.setFechaVen_Producto(lista.get(5));

                    System.out.println("Nombre con String: " + nombre);
                    System.out.println("Nombre: " + productos.getNombre_Producto());
                    System.out.println("Descripcion: " + productos.getDescripcion_Producto());
                    int resultado = 0;
                    resultado = pDAO.buscarProducto(productos);
                    //En esta condición,verificamos que el producto no haya sido ingresado anteriormente.
                    if (resultado == 2) {
                        request.setAttribute("Existe", "2");
                        File fichero = f;
                        if (fichero != null && fichero.exists()) {
                            if (fichero.delete()) {
                                System.out.println("El fichero ha sido borrado satisfactoriamente");
                            } else {
                                System.out.println("El fichero no puede ser borrado");
                            }
                        }
                    } else {
                        pDAO.insertarProducto(productos);
                        request.setAttribute("Existe", "1");
                    }
                } catch (Exception e) {
                    System.out.println("Error al insertar producto: " + e);
                }
                request.getRequestDispatcher("inventario.jsp").forward(request, response);
                break;
            //En este caso editamos el producto y manipulamos sus archivos.
            case "EditarProducto":
                if(sesion.getAttribute("log") == null){
                    response.sendRedirect("FormularioEdit.jsp");
                }else{
                File fEdit = null;
                ArrayList<String> listaEdit = new ArrayList();
                try {
                    //Se cargan todos los archivos e inputs que manda el formulario.
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    //Recorremos todos los items que serían los inputs del formulario.
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if (!fileItem.isFormField()) {
                            //Si la imagen que cambia el administrador no existía antes, la agregamos.
                            fEdit = new File("D:\\ProgramasDevops\\NetBeans\\CoffOclock\\src\\main\\webapp\\imgProductos\\" + fileItem.getName());
                            //Si la imagen ya existía, solo agregamos el nombre
                            if (!fEdit.exists()) {
                                fileItem.write(fEdit);
                                productos.setRutaImg_Producto("imgProductos/" + fEdit.getName());//prueba
                            } else {
                                productos.setRutaImg_Producto("imgProductos/" + fEdit.getName()); 
                            }
                        } else {
                            listaEdit.add(fileItem.getString());
                        }
                    }
                    listaEdit.add(request.getParameter("textareaEdit"));
                    if (fEdit == null || fEdit.length() == 0) {
                        productos.setRutaImg_Producto(listaEdit.get(7));
                    }
                    if(productos.getRutaImg_Producto().equals("imgProductos/imgProductos")){
                        productos.setRutaImg_Producto(listaEdit.get(7));
                    }
                    System.out.println("tamaño: " + listaEdit.size());
                    System.out.println("Qué estoy trayendo en i 6: " + listaEdit.get(6));
                    System.out.println("Qué estoy trayendo en i 0: " + listaEdit.get(0));
                    System.out.println("Qué estoy trayendo en i 1: " + listaEdit.get(1));
                    System.out.println("Qué estoy trayendo en i 2: " + listaEdit.get(2));
                    System.out.println("Qué estoy trayendo en i 3: " + listaEdit.get(3));
                    System.out.println("Qué estoy trayendo en i 4: " + listaEdit.get(4));
                    System.out.println("Qué estoy trayendo en i 5: " + listaEdit.get(5));
                    System.out.println("Qué estoy trayendo en i 7: " + listaEdit.get(7));
                    System.out.println("Qué estoy guardando en: " + productos.getRutaImg_Producto());
                    String nombre = listaEdit.get(0).toLowerCase();
                    nombre = nombre.substring(0, 1).toUpperCase() + nombre.substring(1).toLowerCase(); //Primera letra en mayúscula.
                    productos.setNombre_Producto(nombre);
                    productos.setCategoria_Producto(listaEdit.get(4));
                    productos.setPrecio_Producto(Double.parseDouble(listaEdit.get(2)));
                    productos.setCantidad_Producto(Integer.parseInt(listaEdit.get(3)));
                    productos.setDescripcion_Producto(listaEdit.get(1));
                    productos.setFechaVen_Producto(listaEdit.get(5));
                    productos.setIdProducto(Integer.parseInt(listaEdit.get(6)));
                    pDAO.actualizarProducto(productos);
                } catch (Exception e) {
                    System.out.println("Error al editar el producto: " + e);
                }
                //request.getRequestDispatcher("productos.jsp").forward(request, response);
                response.sendRedirect("productos.jsp");}
                break;
            //Eliminar un producto y su archivo
            case "EliminarProducto":
                int id = Integer.parseInt(request.getParameter("Id_Producto"));
                File fichero = null;
                fichero = pDAO.buscarImgDelete(id);
                
                String ruta = null;
                ruta = pDAO.TraerImagenNoBorrar(id);
                System.out.println("La ruta que trae es: "+ruta);//Verificaciones(borrable)
                int resultado = 0;
                resultado = pDAO.ImagenNoBorrar(ruta);
                System.out.println("El resultado que trae es: "+resultado); //Verificaciones(borrable)
                System.out.println("El fichero es: "+fichero);//Verificaciones(borrable)
                //En esta condición, se verifica si el fichero existe, si existe puede ser borrado, pero si existe y está siendo utilizado, no puede ser borrado.
                if (resultado ==1) {
                    if (fichero.delete()){
                        System.out.println("El fichero ha sido borrado satisfactoriamente");
                    } else {
                        System.out.println("El fichero no puede ser borrado");
                    }
                }else{
                    System.out.println("No se puede eliminar el fichero porque está siendo utilizado más de 1 vez");
                }
                pDAO.eliminarProducto(id);
                request.getRequestDispatcher("productos.jsp").forward(request, response);
                break;
            //Este caso solo funciona para redirigir a una vista, se usa para cargar peticiones que se hacen dentro del mismo controlador.
            case "IrVista":
                response.sendRedirect("productos.jsp");
//                request.getRequestDispatcher("productos.jsp").forward(request, response);
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
