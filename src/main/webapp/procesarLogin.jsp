<%@page import="clases.ClienteManager"%>
<%@page import="clases.ClienteRegister"%>
<%@page import="clases.ClienteRegisterService"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Login</title>
</head>
<body>
<%
    // Obtener parámetros de la solicitud
    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");

    // Validar credenciales para usuarios normales
    boolean esUsuarioNormal = false;
    if (usuario != null && contrasena != null) {
        esUsuarioNormal = ClienteManager.autenticarCliente(usuario, contrasena);
    }

    // Validar credenciales para la cuenta de administrador
    boolean esAdmin = "julissa".equals(usuario) && "1234".equals(contrasena);

    if (esUsuarioNormal) {
        // Crear una nueva sesión para usuarios normales
        session.setAttribute("usuario", usuario);
        response.sendRedirect("listaVuelosDisponibles.jsp");
    } else if (esAdmin) {
        // Crear una nueva sesión para el administrador
        session.setAttribute("usuario", usuario);
        response.sendRedirect("vuelos.jsp");
    } else {
        // Si las credenciales son incorrectas, redirigir al usuario de vuelta a la página de login con un mensaje de error
        session.setAttribute("error", "Usuario o contraseña incorrectos.");
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>
