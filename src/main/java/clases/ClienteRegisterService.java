package clases;

import java.util.ArrayList;

public class ClienteRegisterService {
    private ArrayList<ClienteRegister> listaClientes = new ArrayList<>();

    // Método para registrar un nuevo cliente
    public boolean registrarCliente(String nombre, String usuario, String correo, String clave) {
        // Verifica si el usuario o correo ya existen
        for (ClienteRegister cliente : listaClientes) {
            if (cliente.getUsuario().equals(usuario) || cliente.getCorreo().equals(correo)) {
                return false; // Retorna false si ya existe el usuario o correo
            }
        }

        // Crea un nuevo cliente y lo agrega a la lista
        ClienteRegister nuevoCliente = new ClienteRegister(nombre, usuario, correo, clave);
        listaClientes.add(nuevoCliente);
        return true; // Retorna true si el cliente fue registrado exitosamente
    }

    // Método para obtener la lista de todos los clientes registrados
    public ArrayList<ClienteRegister> obtenerClientes() {
        return listaClientes;
    }

    // Método para validar el inicio de sesión
    public boolean validarLogin(String usuario, String clave) {
        for (ClienteRegister cliente : listaClientes) {
            if (cliente.getUsuario().equals(usuario) && cliente.getClave().equals(clave)) {
                return true; // Usuario y clave coinciden
            }
        }
        return false; // Usuario o clave incorrectos
    }
}