package clases;

public class ComprarVuelo {
    private String numeroVuelo;
    private String aerolinea;
    private String destino;
    private double precioVuelo;
    private String nombre;
    private String genero;
    private String correo;
    private String telefono;
    private String numeroTarjeta;
    private String cvv;
    private String fechaExpiracion;
    private String fechaCompra; // Nuevo atributo

    public ComprarVuelo(String numeroVuelo, String aerolinea, String destino, double precioVuelo, 
                        String nombre, String genero, String correo, String telefono, 
                        String numeroTarjeta, String cvv, String fechaExpiracion, String fechaCompra) { // Constructor actualizado
        this.numeroVuelo = numeroVuelo;
        this.aerolinea = aerolinea;
        this.destino = destino;
        this.precioVuelo = precioVuelo;
        this.nombre = nombre;
        this.genero = genero;
        this.correo = correo;
        this.telefono = telefono;
        this.numeroTarjeta = numeroTarjeta;
        this.cvv = cvv;
        this.fechaExpiracion = fechaExpiracion;
        this.fechaCompra = fechaCompra; // Asignación de fechaCompra
    }

    // Getters y setters para todos los campos
    public String getNumeroVuelo() { return numeroVuelo; }
    public void setNumeroVuelo(String numeroVuelo) { this.numeroVuelo = numeroVuelo; }

    public String getAerolinea() { return aerolinea; }
    public void setAerolinea(String aerolinea) { this.aerolinea = aerolinea; }

    public String getDestino() { return destino; }
    public void setDestino(String destino) { this.destino = destino; }

    public double getPrecioVuelo() { return precioVuelo; }
    public void setPrecioVuelo(double precioVuelo) { this.precioVuelo = precioVuelo; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getGenero() { return genero; }
    public void setGenero(String genero) { this.genero = genero; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public String getNumeroTarjeta() { return numeroTarjeta; }
    public void setNumeroTarjeta(String numeroTarjeta) { this.numeroTarjeta = numeroTarjeta; }

    public String getCvv() { return cvv; }
    public void setCvv(String cvv) { this.cvv = cvv; }

    public String getFechaExpiracion() { return fechaExpiracion; }
    public void setFechaExpiracion(String fechaExpiracion) { this.fechaExpiracion = fechaExpiracion; }

    public String getFechaCompra() { return fechaCompra; } // Nuevo método getter
    public void setFechaCompra(String fechaCompra) { this.fechaCompra = fechaCompra; } // Nuevo método setter
}
