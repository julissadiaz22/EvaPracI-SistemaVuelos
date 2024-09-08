<%@ page import="java.util.ArrayList" %>
<%@ page import="clases.Vuelos" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Obtener el ArrayList de la sesión
    ArrayList<Vuelos> vueloList = (ArrayList<Vuelos>) session.getAttribute("vueloList");

    // Verificar que la lista de vuelos no sea nula
    if (vueloList == null) {
        out.println("<p class='text-danger'>Error: No se encontró la lista de vuelos en la sesión.</p>");
        return; // Detener la ejecución si la lista no está presente
    }

    // Obtener los datos enviados desde el formulario del modal
    String numeroVuelo = request.getParameter("numeroVuelo");
    String aerolinea = request.getParameter("aerolinea");
    String origen = request.getParameter("origen");
    String destino = request.getParameter("destino");
    String fechaSalida = request.getParameter("fechaSalida");
    String horaSalida = request.getParameter("horaSalida");
    String fechaLlegada = request.getParameter("fechaLlegada");
    String horaLlegada = request.getParameter("horaLlegada");
    String duracion = request.getParameter("duracionVuelo"); // Asegúrate que el nombre sea el correcto
    String precioString = request.getParameter("precioVuelo"); // Asegúrate que el nombre sea el correcto

    // Verificar que todos los parámetros necesarios se hayan recibido
    if (numeroVuelo == null || aerolinea == null || origen == null || destino == null || 
        fechaSalida == null || horaSalida == null || fechaLlegada == null || 
        horaLlegada == null || duracion == null || precioString == null) {
        
        out.println("<p class='text-danger'>Error: Faltan datos para la actualización del vuelo.</p>");
        return; // Detener la ejecución si falta algún parámetro
    }

    // Convertir el precio a un número de punto flotante
    double precio = 0.0;
    try {
        precio = Double.parseDouble(precioString);
    } catch (NumberFormatException e) {
        out.println("<p class='text-danger'>Error: El precio ingresado no es válido.</p>");
        return; // Detener la ejecución si el precio no es un número válido
    }

    // Variable para verificar si se encontró y actualizó el vuelo
    boolean vueloActualizado = false;

    // Buscar el vuelo a actualizar por el número de vuelo
    for (Vuelos vuelo : vueloList) {
        if (vuelo.getNumeroVuelo().equals(numeroVuelo)) {
            // Actualizar los datos del vuelo
            vuelo.setAerolinea(aerolinea);
            vuelo.setOrigen(origen);
            vuelo.setDestino(destino);
            vuelo.setFechaSalida(fechaSalida);
            vuelo.setHoraSalida(horaSalida);
            vuelo.setFechaLlegada(fechaLlegada);
            vuelo.setHoraLlegada(horaLlegada);
            vuelo.setDuracionVuelo(duracion);
            vuelo.setPrecioVuelo(precio); // Actualizar el precio
            vueloActualizado = true; // Marcar como encontrado y actualizado
            break; // Salir del bucle una vez encontrado y actualizado
        }
    }

    if (vueloActualizado) {
        // Guardar la lista actualizada en la sesión
        session.setAttribute("vueloList", vueloList);
        // Redirigir a reporteVuelos.jsp después de la actualización
        response.sendRedirect("reporteVuelos.jsp");
    } else {
        // Manejar el caso cuando no se encuentra el vuelo
        out.println("<p class='text-danger'>Error: No se encontró el vuelo con el número " + numeroVuelo + ".</p>");
    }
%>
