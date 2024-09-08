package clases;

import java.io.Serializable;

public class Cliente implements Serializable {
    private String nombre;
    private String usuario;
    private String correo;
    private String clave;

    public Cliente(String nombre, String usuario, String correo, String clave) {
        this.nombre = nombre;
        this.usuario = usuario;
        this.correo = correo;
        this.clave = clave;
    }

    // Getters y setters
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getUsuario() { return usuario; }
    public void setUsuario(String usuario) { this.usuario = usuario; }
    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }
    public String getClave() { return clave; }
    public void setClave(String clave) { this.clave = clave; }
}