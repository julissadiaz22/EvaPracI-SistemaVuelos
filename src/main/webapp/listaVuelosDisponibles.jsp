<%@page import="java.util.ArrayList"%>
<%@page import="clases.Vuelos"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Vuelos</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Georgia', serif;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
            font-size: 36px;
            color: #333333;
        }
        .table-container {
            width: 1200px;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table thead th {
            border-top: none;
        }
        .table td, .table th {
            border-color: #dee2e6;
        }
        .action-icons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        .action-icons a, .action-icons button {
            color: #007bff;
            text-decoration: none;
        }
        .action-icons a:hover, .action-icons button:hover {
            color: #0056b3;
        }
        
        
    </style>
</head>
<body>
    <jsp:include page="menuCliente.jsp"/>
    <div class="container mt-4">
        <h1 class="mb-4">Vuelos Disponibles</h1>
        <div class="table-container">
            <div class="d-flex justify-content-end mb-3">
                
            </div>
            <table id="TablaVuelos" class="table table-striped table-bordered" style="width:100%">
                <thead class="thead-dark">
                    <tr>
                        <th>Número de Vuelo</th>
                        <th>Aerolínea</th>
                        <th>Origen</th>
                        <th>Destino</th>
                        <th>Fecha de Salida</th>
                        <th>Hora de Salida</th>
                        <th>Fecha de Llegada</th>
                        <th>Hora de Llegada</th>
                        <th>Duración</th>
                        <th>Precio</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    ArrayList<Vuelos> vueloList = (ArrayList<Vuelos>) session.getAttribute("vueloList");

                    if (vueloList != null && !vueloList.isEmpty()) {
                        for (Vuelos vuelo : vueloList) {
                    %>
                            <tr>
                                <td><%= vuelo.getNumeroVuelo() %></td>
                                <td><%= vuelo.getAerolinea() %></td>
                                <td><%= vuelo.getOrigen() %></td>
                                <td><%= vuelo.getDestino() %></td>
                                <td><%= vuelo.getFechaSalida() %></td>
                                <td><%= vuelo.getHoraSalida() %></td>
                                <td><%= vuelo.getFechaLlegada() %></td>
                                <td><%= vuelo.getHoraLlegada() %></td>
                                <td><%= vuelo.getDuracionVuelo() %></td>
                                <td><%=vuelo.getPrecioVuelo()%></td>
                                <td class="action-icons">
                                    <!-- Botón para comprar vuelo -->
                                    <a href="comprarVueloP1.jsp?id=<%= vuelo.getNumeroVuelo() %>" class="btn btn-warning btn-sm">
                                        <i class="fas fa-shopping-cart"></i> Comprar
                                    </a>
                                </td>
                            </tr>
                    <%
                        }
                    } else {
                    %>
                        <tr>
                            <td colspan="10">No hay vuelos registrados.</td>
                        </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Scripts necesarios -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

    <!-- Script para inicializar DataTables -->
    <script>
        $(document).ready(function() {
            $('#TablaVuelos').DataTable();
        });
    </script>
</body>
</html>
