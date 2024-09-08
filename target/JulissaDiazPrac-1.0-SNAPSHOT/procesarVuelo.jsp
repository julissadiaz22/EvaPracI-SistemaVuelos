<%@page import="java.util.ArrayList"%>
<%@page import="clases.Vuelos"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Procesar Vuelo</title>
</head>
<body>
    <%
    // Obtener los parámetros del formulario
    String numeroVuelo = request.getParameter("numeroVuelo");
    String aerolinea = request.getParameter("aerolinea");
    String origen = request.getParameter("origen");
    String destino = request.getParameter("destino");
    String fechaSalida = request.getParameter("fechaSalida");
    String horaSalida = request.getParameter("horaSalida");
    String fechaLlegada = request.getParameter("fechaLlegada");
    String horaLlegada = request.getParameter("horaLlegada");
    String duracionVuelo = request.getParameter("duracionVuelo");
    String precioVueloString = request.getParameter("precioVuelo"); // Cambiado a String para la conversión

    // Verificar si la sesión ya tiene la lista de vuelos
    if (session.getAttribute("vueloList") == null) {
        session.setAttribute("vueloList", new ArrayList<Vuelos>());
    }

    // Obtener la lista de vuelos desde la sesión
    ArrayList<Vuelos> vueloList = (ArrayList<Vuelos>) session.getAttribute("vueloList");

    // Inicializar la variable de precio
    double precioVuelo = 0.0;

    // Manejar la conversión de String a double
    try {
        if (precioVueloString != null && !precioVueloString.isEmpty()) {
            precioVuelo = Double.parseDouble(precioVueloString);
        }
    } catch (NumberFormatException e) {
        // Manejar el error si el precio no es un número válido
        out.println("<p>Error: El precio ingresado no es válido.</p>");
        return; // Salir del script si hay un error de conversión
    }

    // Crear un nuevo vuelo y agregarlo a la lista
    Vuelos nuevoVuelo = new Vuelos(numeroVuelo, aerolinea, origen, destino, fechaSalida, horaSalida, fechaLlegada, horaLlegada, duracionVuelo, precioVuelo); // Asegúrate de que la clase Vuelos tenga un constructor adecuado
    vueloList.add(nuevoVuelo);

    // Actualizar la lista en la sesión
    session.setAttribute("vueloList", vueloList);

    // Redirigir a la página de reporte de vuelos
    response.sendRedirect("reporteVuelos.jsp");
    %>
</body>
</html>
