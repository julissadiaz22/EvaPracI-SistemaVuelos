package clases;

public class Vuelos {
    private String numeroVuelo;
    private String aerolinea;
    private String origen;
    private String destino;
    private String fechaSalida;
    private String horaSalida;
    private String fechaLlegada;
    private String horaLlegada;
    private String duracionVuelo;
    private double precioVuelo; // Nuevo campo para el precio

    public Vuelos(String numeroVuelo, String aerolinea, String origen, String destino, String fechaSalida, String horaSalida, String fechaLlegada, String horaLlegada, String duracionVuelo, double precioVuelo) {
        this.numeroVuelo = numeroVuelo;
        this.aerolinea = aerolinea;
        this.origen = origen;
        this.destino = destino;
        this.fechaSalida = fechaSalida;
        this.horaSalida = horaSalida;
        this.fechaLlegada = fechaLlegada;
        this.horaLlegada = horaLlegada;
        this.duracionVuelo = duracionVuelo;
        this.precioVuelo = precioVuelo;
    }

    // Getters y setters para todos los campos
    public String getNumeroVuelo() { return numeroVuelo; }
    public void setNumeroVuelo(String numeroVuelo) { this.numeroVuelo = numeroVuelo; }

    public String getAerolinea() { return aerolinea; }
    public void setAerolinea(String aerolinea) { this.aerolinea = aerolinea; }

    public String getOrigen() { return origen; }
    public void setOrigen(String origen) { this.origen = origen; }

    public String getDestino() { return destino; }
    public void setDestino(String destino) { this.destino = destino; }

    public String getFechaSalida() { return fechaSalida; }
    public void setFechaSalida(String fechaSalida) { this.fechaSalida = fechaSalida; }

    public String getHoraSalida() { return horaSalida; }
    public void setHoraSalida(String horaSalida) { this.horaSalida = horaSalida; }

    public String getFechaLlegada() { return fechaLlegada; }
    public void setFechaLlegada(String fechaLlegada) { this.fechaLlegada = fechaLlegada; }

    public String getHoraLlegada() { return horaLlegada; }
    public void setHoraLlegada(String horaLlegada) { this.horaLlegada = horaLlegada; }

    public String getDuracionVuelo() { return duracionVuelo; }
    public void setDuracionVuelo(String duracionVuelo) { this.duracionVuelo = duracionVuelo; }

    public double getPrecioVuelo() { return precioVuelo; }
    public void setPrecioVuelo(double precioVuelo) { this.precioVuelo = precioVuelo; }
}
