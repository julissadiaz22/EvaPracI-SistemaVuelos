<%@ page import="java.util.ArrayList"%>
<%@ page import="clases.ComprarVuelo"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Compra de Vuelo</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
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
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="container mt-4">
        <h2 class="text-center mb-4">Reporte de Compras Clientes</h2>
        <div class="table-container">
        
        <table id="TablaVuelos" class="table table-striped table-bordered" style="width:100%">
            <thead class="thead-dark">
                <tr>
                    <th>Número Vuelo</th>
                    <th>Nombre Cliente</th>
                    <th>Aerolínea</th>
                    <th>Precio</th>
                    <th>Fecha de Compra</th>
                    <th>Destino</th>
                    <th>Correo</th>
                    <th>Teléfono</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Obtener la lista de compras desde la sesión
                    ArrayList<ComprarVuelo> comprasList = (ArrayList<ComprarVuelo>) session.getAttribute("comprasList");

                    if (comprasList != null && !comprasList.isEmpty()) {
                        // Iterar sobre la lista de compras y mostrar cada compra en una fila de la tabla
                        for (ComprarVuelo compra : comprasList) {
                            out.println("<tr>");
                            out.println("<td>" + compra.getNumeroVuelo() + "</td>");
                            out.println("<td>" + compra.getNombre()+ "</td>");
                            out.println("<td>" + compra.getAerolinea() + "</td>");
                            out.println("<td>" + compra.getPrecioVuelo() + "</td>");
                            out.println("<td>" + compra.getFechaCompra() + "</td>");
                            out.println("<td>" + compra.getDestino() + "</td>");
                            out.println("<td>" + compra.getCorreo() + "</td>");
                            out.println("<td>" + compra.getTelefono() + "</td>");
                            out.println("</tr>");
                        }
                    } else {
                        out.println("<tr><td colspan='7' class='text-center'>No hay compras registradas.</td></tr>");
                    }
                %>
            </tbody>
        </table>
        </div>
    </div>
     
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
    <!-- Font Awesome JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#TablaVuelos').DataTable({
                "pagingType": "full_numbers",
                "language": {
                    "search": "Buscar:",
                    "lengthMenu": "Mostrar _MENU_ registros por página",
                    "info": "Mostrando página _PAGE_ de _PAGES_",
                    "infoEmpty": "No hay registros disponibles",
                    "infoFiltered": "(filtrado de _MAX_ registros totales)",
                    "paginate": {
                        "first": "Primera",
                        "last": "Última",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }
                }
            });

            $('#editarVueloModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var id = button.data('id');
                var aerolinea = button.data('aerolinea');
                var origen = button.data('origen');
                var destino = button.data('destino');
                var fechaSalida = button.data('fecha-salida');
                var horaSalida = button.data('hora-salida');
                var fechaLlegada = button.data('fecha-llegada');
                var horaLlegada = button.data('hora-llegada');
                var duracion = button.data('duracion');
                var precio = button.data('precio');

                var modal = $(this);
                modal.find('#idVuelo').val(id);
                modal.find('#numeroVuelo').val(id);
                modal.find('#aerolinea').val(aerolinea);
                modal.find('#origen').val(origen);
                modal.find('#destino').val(destino);
                modal.find('#fechaSalida').val(fechaSalida);
                modal.find('#horaSalida').val(horaSalida);
                modal.find('#fechaLlegada').val(fechaLlegada);
                modal.find('#horaLlegada').val(horaLlegada);
                modal.find('#duracionVuelo').val(duracion);
                modal.find('#precioVuelo').val(precio);
            });
        });
    </script>
</body>
</html>
