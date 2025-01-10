/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pruebatecnica2.gestorturnos.persistencia;

import com.pruebatecnica2.gestorturnos.logica.Ciudadano;
import com.pruebatecnica2.gestorturnos.logica.Turno;
import com.pruebatecnica2.gestorturnos.persistencia.exceptions.NonexistentEntityException;
import com.pruebatecnica2.gestorturnos.persistencia.exceptions.PreexistingEntityException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Skadh
 */
public class ControladoraPersistencia {
    
    CiudadanoJpaController ciudadanoJpa = new CiudadanoJpaController();
    TurnoJpaController turnoJpa = new TurnoJpaController();
    
    //CIUDADANO -----------------------------------------------------------
    public void createCiudadano(Ciudadano ciudadano) throws PreexistingEntityException, Exception  {
        ciudadanoJpa.create(ciudadano);
    }
    public void deleteCiudadano(String id){
        try {
            ciudadanoJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Ciudadano> getCiudadanos(){
        return ciudadanoJpa.findCiudadanoEntities();
    }
    
    public Ciudadano getCiudadanoByDni(String dni){
        return ciudadanoJpa.findCiudadano(dni);
    }
    
    public void updateCiudadano(Ciudadano ciudadano){
        try {
            ciudadanoJpa.edit(ciudadano);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<String> getListDni(){
        List<String> dnis = new ArrayList<>();
        for(Ciudadano c : ciudadanoJpa.findCiudadanoEntities()){
            dnis.add(c.getDni());
        }
        return dnis;
    }
    
    
    //TURNO ----------------------------------------------------------------------
    
    public void createTurno(Turno turno){
        turnoJpa.create(turno);
    }
    
    public void deleteTurno(int id) throws NonexistentEntityException{
        turnoJpa.destroy(id);
    }
    
    public List<Turno> getTurnos(){
        return turnoJpa.findTurnoEntities();
    }
    
    public Turno getTurnoById(int id){
        return turnoJpa.findTurno(id);
    }
    
    public List<Turno> getTurnosByFecha(LocalDate fecha){
        List<Turno> turnos = turnoJpa.findTurnoEntities();
        List<Turno> turnosFiltrados = new ArrayList<>();
        for(Turno turno : turnos){
            if(turno.getFecha().isEqual(fecha)){
                turnosFiltrados.add(turno);
            }
        }
        return turnosFiltrados;
    }
    
    public void updateTurno(Turno turno){
        try {
            turnoJpa.edit(turno);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   

}
