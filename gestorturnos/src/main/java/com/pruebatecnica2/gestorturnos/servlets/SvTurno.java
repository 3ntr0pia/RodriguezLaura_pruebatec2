/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pruebatecnica2.gestorturnos.servlets;

import com.pruebatecnica2.gestorturnos.logica.Ciudadano;
import com.pruebatecnica2.gestorturnos.logica.Turno;
import com.pruebatecnica2.gestorturnos.persistencia.ControladoraPersistencia;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvTurno", urlPatterns = {"/SvTurno/*"})
public class SvTurno extends HttpServlet {

    ControladoraPersistencia cp = new ControladoraPersistencia();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       HttpSession session = request.getSession();
       String pathInfo = request.getPathInfo(); 
       DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy-MM-dd");
       System.out.println(request);
       List<Turno> turnos = new ArrayList<>();
       turnos.clear();
       System.out.println("pathInfo: " + pathInfo);

       if (pathInfo == null || pathInfo.equals("/")) {
           List<String> dniCiudadanos = cp.getListDni();
           session.setAttribute("listDni", dniCiudadanos);
           
       } else if (pathInfo.equals("/BuscarPorFecha")) {
           LocalDate fecha = LocalDate.parse(request.getParameter("fecha"), formato);
           session.setAttribute("fechaFormulario", fecha);
           turnos = cp.getTurnosByFecha(fecha);
           session.setAttribute("turnos", turnos);
           response.sendRedirect(request.getContextPath() + "/?view=turno");
       } else if (pathInfo.equals("/visualizarAtendidos")){
          
          LocalDate fecha = (LocalDate) session.getAttribute("fechaFormulario");
          if(fecha != null){
           turnos = cp.getTurnosByFecha(fecha);
          turnos = turnos.stream().filter(t -> !t.isEstado()).toList();
          session.setAttribute("turnos", turnos);
          response.sendRedirect(request.getContextPath() + "/?view=turno");
          } 
          
           
       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       String pathInfo = request.getPathInfo(); 
       
       if(pathInfo.equals("/formularioTurno")){
            String numero = request.getParameter("numero");
        boolean estado = false; // Por que cuando creo el turno por defecto esta pendiente
        String descripcion = request.getParameter("descripcion");

        DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate fecha = LocalDate.parse(request.getParameter("fecha"), formato);

        String dni = request.getParameter("dni");
            Optional<Ciudadano> ciudadanoBuscado = Optional.ofNullable(cp.getCiudadanoByDni(dni));
            ciudadanoBuscado.ifPresent(ciudadano -> {
                Turno turno = new Turno(numero, estado, descripcion, fecha, ciudadano);
                cp.createTurno(turno);
        });
        response.sendRedirect(request.getContextPath() + "/?view=turno");
        
       } else if (pathInfo.equals("/finalizarTurno")){
           HttpSession session = request.getSession();
           int idTurno = Integer.parseInt(request.getParameter("idTurno"));
           Turno turnoAFinalizar = cp.getTurnoById(idTurno);
           turnoAFinalizar.setEstado(true);
           cp.updateTurno(turnoAFinalizar);
           
           LocalDate fecha = (LocalDate) session.getAttribute("fechaFormulario");
           if(fecha != null){
                List<Turno> turnos = cp.getTurnosByFecha(fecha).stream()
                .filter(t -> !t.isEstado())
                .toList();
                 session.setAttribute("turnos", turnos);
           }
           
           response.sendRedirect(request.getContextPath() + "/?view=turno");
       } 

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
