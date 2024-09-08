 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Vuelos</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Enlace a Font Awesome para los íconos -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .form-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-header {
            background-color: #007bff;
            color: #ffffff;
            padding: 15px;
            border-radius: 8px 8px 0 0;
        }
        .form-subtitle {
            font-size: 12px;
        }
        .form-group i {
            position: absolute;
            right: 10px;
            top: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="container">
        <div class="form-container">
            <div class="form-header text-center">
                <h4>Información de vuelos</h4>
                <p class="form-subtitle">Datos necesarios para la creación de vuelos</p>
            </div>
            <form method="post" action="procesarVuelo.jsp">
                <div class="form-group">
                    <label for="numeroVuelo">Número de Vuelo</label>
                    <input type="text" class="form-control" id="numeroVuelo" name="numeroVuelo" placeholder="Ingrese el número de vuelo">
                </div>
                <div class="form-group">
                    <label for="aerolinea">Aerolínea</label>
                    <input type="text" class="form-control" id="aerolinea" name="aerolinea" placeholder="Ingrese el nombre de la aerolínea">
                </div>
                <div class="form-group">
                    <label for="origen">Origen</label>
                    <input type="text" class="form-control" id="origen" name="origen" placeholder="Ingrese el origen del vuelo">
                </div>
                <div class="form-group">
                    <label for="destino">Destino</label>
                    <input type="text" class="form-control" id="destino" name="destino" placeholder="Ingrese el destino del vuelo">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6 position-relative">
                        <label for="fechaSalida">Fecha y Hora de Salida</label>
                        <input type="date" class="form-control" id="fechaSalida" name="fechaSalida">
                        <input type="time" class="form-control mt-2" id="horaSalida" name="horaSalida">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="form-group col-md-6 position-relative">
                        <label for="fechaLlegada">Fecha y Hora de Llegada</label>
                        <input type="date" class="form-control" id="fechaLlegada" name="fechaLlegada">
                        <input type="time" class="form-control mt-2" id="horaLlegada" name="horaLlegada">
                        <i class="fas fa-clock"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label for="duracionVuelo">Duración del Vuelo</label>
                    <input type="text" class="form-control" id="duracionVuelo" name="duracionVuelo" placeholder="Ingrese la duración del vuelo (e.g. 3 horas, 2 horas 30 minutos)">
                </div>
                <!-- Nuevo campo para el precio -->
                <div class="form-group">
                    <label for="precioVuelo">Precio del Vuelo</label>
                    <input type="number" class="form-control" id="precioVuelo" name="precioVuelo" placeholder="Ingrese el precio del vuelo">
                </div>
                <button type="submit" class="btn btn-primary">Agregar Vuelo</button>
            </form>
        </div>
    </div>
</body>
</html>
