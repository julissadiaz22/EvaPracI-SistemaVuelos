package clases;

import java.util.ArrayList;

public class ClienteRegister {
    private String nombre;
    private String usuario;
    private String correo;
    private String clave;

    // Constructor
    public ClienteRegister(String nombre, String usuario, String correo, String clave) {
        this.nombre = nombre;
        this.usuario = usuario;
        this.correo = correo;
        this.clave = clave;
    }

    // Getters
    public String getNombre() {
        return nombre;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public String getClave() {
        return clave;
    }

    // Setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    @Override
    public String toString() {
        return "ClienteRegister{" +
                "nombre='" + nombre + '\'' +
                ", usuario='" + usuario + '\'' +
                ", correo='" + correo + '\'' +
                ", clave='" + clave + '\'' +
                '}';
    }
}