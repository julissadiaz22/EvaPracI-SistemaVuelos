<%@ page import="java.util.ArrayList"%>
<%@ page import="clases.Vuelos"%>
<%@ page import="clases.ComprarVuelo"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Procesar Compra de Vuelo</title>
</head>
<body>
<%
    // Obtener los parámetros del formulario
    String numeroVuelo = request.getParameter("numeroVuelo");
    String nombre = request.getParameter("nombre");
    String genero = request.getParameter("genero");
    String correo = request.getParameter("correo");
    String telefono = request.getParameter("telefono");
    String numeroTarjeta = request.getParameter("numeroTarjeta");
    String cvv = request.getParameter("cvv");
    String fechaExpiracion = request.getParameter("fechaExpiracion");

    // Verificar si el vuelo existe en la lista de vuelos de la sesión
    ArrayList<Vuelos> vueloList = (ArrayList<Vuelos>) session.getAttribute("vueloList");
    Vuelos vueloSeleccionado = null;

    if (vueloList != null && !vueloList.isEmpty()) {
        for (Vuelos vuelo : vueloList) {
            if (vuelo.getNumeroVuelo().equals(numeroVuelo)) {
                vueloSeleccionado = vuelo;
                break;
            }
        }
    }

    if (vueloSeleccionado != null) {
        // Obtener la fecha de compra (se puede usar la fecha actual)
        String fechaCompra = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

        // Crear una instancia de ComprarVuelo con la información proporcionada
        ComprarVuelo compra = new ComprarVuelo(
            numeroVuelo,
            vueloSeleccionado.getAerolinea(),  // Obtener aerolínea del vuelo seleccionado
            vueloSeleccionado.getDestino(),    // Obtener destino del vuelo seleccionado
            vueloSeleccionado.getPrecioVuelo(),// Obtener precio del vuelo seleccionado
            nombre,
            genero,
            correo,
            telefono,
            numeroTarjeta,
            cvv,
            fechaExpiracion,
            fechaCompra  // Pasar la fecha de compra
        );

        // Agregar la compra a la sesión (o guardar en una base de datos según el caso)
        if (session.getAttribute("comprasList") == null) {
            session.setAttribute("comprasList", new ArrayList<ComprarVuelo>());
        }

        ArrayList<ComprarVuelo> comprasList = (ArrayList<ComprarVuelo>) session.getAttribute("comprasList");
        comprasList.add(compra);
        session.setAttribute("comprasList", comprasList);

        // Redirigir a la página de confirmación
        response.sendRedirect("reporteCompraCliente.jsp");
    } else {
        // Mostrar un mensaje de error si el vuelo no se encuentra
        out.println("<p>Error: El vuelo no se encontró o ya no está disponible.</p>");
    }
%>
</body>
</html>
