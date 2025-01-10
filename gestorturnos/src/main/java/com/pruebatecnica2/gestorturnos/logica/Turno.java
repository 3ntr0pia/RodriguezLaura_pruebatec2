
package com.pruebatecnica2.gestorturnos.logica;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class Turno implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String numero ;
    private boolean estado; // SI ES TRUE ES ATENDIDO SI ES FALSE ES PENDIENTE
    private String descripcion;
    private LocalDate fecha;
    @ManyToOne
    @JoinColumn(name="ciudadano_dni")
    private Ciudadano ciudadano;

    public Turno() {
    }

    public Turno(String numero, boolean estado, String descripcion, LocalDate fecha, Ciudadano ciudadano) {
        this.numero = numero;
        this.estado = estado;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.ciudadano = ciudadano;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public Ciudadano getCiudadano() {
        return ciudadano;
    }

    public void setCiudadano(Ciudadano ciudadano) {
        this.ciudadano = ciudadano;
    }

    @Override
    public String toString() {
        return "Turno{" + "id=" + id + ", numero=" + numero + ", estado=" + estado + ", descripcion=" + descripcion + ", fecha=" + fecha + ", ciudadano=" + ciudadano + '}';
    }
    
}