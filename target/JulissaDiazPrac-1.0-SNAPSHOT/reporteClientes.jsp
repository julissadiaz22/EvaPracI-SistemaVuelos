<%@ page import="java.util.ArrayList"%>
<%@ page import="clases.Cliente"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Clientes</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
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
            overflow-x: auto; /* Permite el desbordamiento horizontal */
        }
        .table {
            margin-bottom: 0; /* Elimina el margen inferior para ajustar el tamaño */
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
        .action-icons a {
            color: #007bff;
            text-decoration: none;
        }
        .action-icons a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="container mt-4">
        <h2 class="text-center mb-4">Reporte de Clientes</h2>
        <div class="table-container">
            <table id="TablaClientes" class="table table-striped table-bordered" style="width:100%">
                <thead class="thead-dark">
                    <tr>
                        <th>Nombre</th>
                        <th>Usuario</th>
                        <th>Correo</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Cliente> clientesList = (ArrayList<Cliente>) session.getAttribute("clientesList");

                        if (clientesList != null && !clientesList.isEmpty()) {
                            for (Cliente cliente : clientesList) {
                                out.println("<tr>");
                                out.println("<td>" + cliente.getNombre() + "</td>");
                                out.println("<td>" + cliente.getUsuario() + "</td>");
                                out.println("<td>" + cliente.getCorreo() + "</td>");
                                out.println("</tr>");
                            }
                        } else {
                            out.println("<tr><td colspan='3' class='text-center'>No hay clientes registrados.</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#TablaClientes').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "language": {
                    "url": "https://cdn.datatables.net/plug-ins/1.13.4/i18n/Spanish.json"
                }
            });
        });
    </script>
</body>
</html>
