<%@page import="java.util.List"%>
<%@page import="clases.Cliente"%>
<%@page import="clases.ClienteManager"%>
<%@page contentType="text/html; charset=UTF-8" %>

<%
    String nombre = request.getParameter("nombre");
    String usuario = request.getParameter("usuario");
    String correo = request.getParameter("correo");
    String clave = request.getParameter("clave");
    String repetirClave = request.getParameter("repetirClave");

    if (!clave.equals(repetirClave)) {
        session.setAttribute("error", "Las contraseñas no coinciden.");
        response.sendRedirect("loginRegister.jsp");
    } else {
        boolean registrado = ClienteManager.agregarCliente(nombre, usuario, correo, clave);
        
        if (registrado) {
            // Fetch the updated list of clients
            List<Cliente> clientesList = ClienteManager.getClientes();

            // Update the session attribute with the latest client list
            session.setAttribute("clientesList", clientesList);

            session.setAttribute("mensaje", "Registro exitoso. Inicie sesión.");
            response.sendRedirect("login.jsp");
        } else {
            session.setAttribute("error", "El usuario o correo ya están registrados.");
            response.sendRedirect("loginRegister.jsp");
        }
    }
%>
