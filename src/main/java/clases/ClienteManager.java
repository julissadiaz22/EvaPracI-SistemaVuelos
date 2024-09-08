package clases;

import java.util.ArrayList;
import java.util.List;

public class ClienteManager {
    // Static list to store clients
    private static List<Cliente> clientes = new ArrayList<>();

    // Method to add a new client
    public static boolean agregarCliente(String nombre, String usuario, String correo, String clave) {
        // Check if the username or email already exists
        for (Cliente cliente : clientes) {
            if (cliente.getUsuario().equals(usuario) || cliente.getCorreo().equals(correo)) {
                return false; // Return false if the user or email already exists
            }
        }

        // Create a new client and add it to the list
        Cliente nuevoCliente = new Cliente(nombre, usuario, correo, clave);
        clientes.add(nuevoCliente);
        return true; // Return true if the client was successfully registered
    }

    // Method to authenticate a client
    public static boolean autenticarCliente(String usuario, String clave) {
        for (Cliente cliente : clientes) {
            if (cliente.getUsuario().equals(usuario) && cliente.getClave().equals(clave)) {
                return true; // Return true if the credentials are valid
            }
        }
        return false; // Return false if the credentials are not valid
    }

    // Method to get a client by username
    public static Cliente obtenerCliente(String usuario) {
        for (Cliente cliente : clientes) {
            if (cliente.getUsuario().equals(usuario)) {
                return cliente; // Return the client if found
            }
        }
        return null; // Return null if the client is not found
    }

    // New method to get all clients
    public static List<Cliente> getClientes() {
        return clientes; // Return the list of clients
    }
}
