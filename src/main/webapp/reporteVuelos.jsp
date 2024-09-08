<%@ page import="java.util.ArrayList" %>
<%@ page import="clases.Vuelos" %>
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
        <h1 class="mb-4">Reporte de Vuelos</h1>
        <div class="table-container">
            <div class="d-flex justify-content-end mb-3">
                <a href="vuelos.jsp" class="btn btn-warning">
                    <i class="fas fa-plus"></i> Agregar Nuevo Vuelo
                </a>
            </div>
            
            <table id="TablaVuelos" class="table table-striped table-bordered" style="width:100%">
                <thead class="thead-dark">
                    <tr>
                        <th>#Vuelo</th>
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
                                <td><%= vuelo.getPrecioVuelo() %></td>
                                <td class="action-icons">
                                    <!-- Botón para abrir el modal -->
                                    <a href="#" data-toggle="modal" data-target="#editarVueloModal" 
                                       data-id="<%= vuelo.getNumeroVuelo() %>"
                                       data-aerolinea="<%= vuelo.getAerolinea() %>"
                                       data-origen="<%= vuelo.getOrigen() %>"
                                       data-destino="<%= vuelo.getDestino() %>"
                                       data-fecha-salida="<%= vuelo.getFechaSalida() %>"
                                       data-hora-salida="<%= vuelo.getHoraSalida() %>"
                                       data-fecha-llegada="<%= vuelo.getFechaLlegada() %>"
                                       data-hora-llegada="<%= vuelo.getHoraLlegada() %>"
                                       data-duracion="<%= vuelo.getDuracionVuelo() %>"
                                       data-precio="<%= vuelo.getPrecioVuelo() %>">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                     <a href="eliminarVuelo.jsp?idVuelo=<%= vuelo.getNumeroVuelo() %>">
    <i class="fas fa-trash-alt"></i>
</a>

                                </td>
                            </tr>
                    <%
                        }
                    } else {
                    %>
                        <tr>
                            <td colspan="11">No hay vuelos registrados.</td>
                        </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal para editar vuelo -->
    <div class="modal fade" id="editarVueloModal" tabindex="-1" aria-labelledby="editarVueloModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="editarVueloForm" action="procesarActualizacion.jsp" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarVueloModalLabel">Editar Vuelo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="idVuelo" name="idVuelo">
                        <div class="form-group">
                            <label for="numeroVuelo"># Vuelo</label>
                            <input type="text" class="form-control" id="numeroVuelo" name="numeroVuelo" readonly>
                        </div>
                        <div class="form-group">
                            <label for="aerolinea">Aerolínea</label>
                            <input type="text" class="form-control" id="aerolinea" name="aerolinea" required>
                        </div>
                        <div class="form-group">
                            <label for="origen">Origen</label>
                            <input type="text" class="form-control" id="origen" name="origen" required>
                        </div>
                        <div class="form-group">
                            <label for="destino">Destino</label>
                            <input type="text" class="form-control" id="destino" name="destino" required>
                        </div>
                        <div class="form-group">
                            <label for="fechaSalida">Fecha de Salida</label>
                            <input type="date" class="form-control" id="fechaSalida" name="fechaSalida" required>
                        </div>
                        <div class="form-group">
                            <label for="horaSalida">Hora de Salida</label>
                            <input type="time" class="form-control" id="horaSalida" name="horaSalida" required>
                        </div>
                        <div class="form-group">
                            <label for="fechaLlegada">Fecha de Llegada</label>
                            <input type="date" class="form-control" id="fechaLlegada" name="fechaLlegada" required>
                        </div>
                        <div class="form-group">
                            <label for="horaLlegada">Hora de Llegada</label>
                            <input type="time" class="form-control" id="horaLlegada" name="horaLlegada" required>
                        </div>
                        <div class="form-group">
                            <label for="duracionVuelo">Duración</label>
                            <input type="text" class="form-control" id="duracionVuelo" name="duracionVuelo" required>
                        </div>
                        <div class="form-group">
                            <label for="precioVuelo">Precio</label>
                            <input type="number" class="form-control" id="precioVuelo" name="precioVuelo" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- jQuery -->
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
