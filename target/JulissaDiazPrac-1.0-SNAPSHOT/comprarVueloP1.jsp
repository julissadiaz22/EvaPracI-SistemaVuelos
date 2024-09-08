<%@page import="java.util.ArrayList"%>
<%@page import="clases.Vuelos"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Confirmar Compra de Vuelo</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Enlace a Font Awesome para los íconos -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .form-container {
            max-width: 900px;
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
        .btn-custom {
            background-color: #0056b3;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
        }
         
        .btn-cancel {
            background-color: #e0a800;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
        }
        
        .button-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <jsp:include page="menuCliente.jsp"/>
    <div class="container">
        <div class="form-container">
            <div class="form-header text-center">
                <h4>Confirmar Compra de Vuelo</h4>
                <p class="form-subtitle">Revise y confirme su información antes de completar la compra</p>
            </div>
            <!-- Aquí se asumirá que el vuelo seleccionado ha sido pasado como un parámetro en la URL -->
            <% 
                String vueloId = request.getParameter("id");
                ArrayList<Vuelos> vueloList = (ArrayList<Vuelos>) session.getAttribute("vueloList");
                Vuelos vueloSeleccionado = null;
                
                if (vueloList != null && !vueloList.isEmpty()) {
                    for (Vuelos vuelo : vueloList) {
                        if (vuelo.getNumeroVuelo().equals(vueloId)) {
                            vueloSeleccionado = vuelo;
                            break;
                        }
                    }
                }
            %>

            <form action="procesarCompraCliente.jsp" method="post">
                <input type="hidden" name="numeroVuelo" value="<%= vueloSeleccionado != null ? vueloSeleccionado.getNumeroVuelo() : "" %>">
                
                <!-- Datos del vuelo -->
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="numeroVuelo">Número de Vuelo</label>
                        <input type="text" class="form-control" id="numeroVuelo" value="<%= vueloSeleccionado != null ? vueloSeleccionado.getNumeroVuelo() : "" %>" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="aerolinea">Aerolínea</label>
                        <input type="text" class="form-control" id="aerolinea" value="<%= vueloSeleccionado != null ? vueloSeleccionado.getAerolinea() : "" %>" readonly>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="destino">Destino</label>
                        <input type="text" class="form-control" id="destino" value="<%= vueloSeleccionado != null ? vueloSeleccionado.getDestino() : "" %>" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="precioVuelo">Precio</label>
                        <input type="text" class="form-control" id="precioVuelo" value="<%= vueloSeleccionado != null ? String.format("%.2f", vueloSeleccionado.getPrecioVuelo()) : "" %>" readonly>
                    </div>
                </div>

                <!-- Datos personales -->
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese su nombre" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="genero">Género</label>
                        <select class="form-control" id="genero" name="genero" required>
                            <option value="">Seleccione</option>
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="correo">Correo Electrónico</label>
                        <input type="email" class="form-control" id="correo" name="correo" placeholder="Ingrese su correo electrónico" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="telefono">Teléfono</label>
                        <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Ingrese su teléfono" required>
                    </div>
                </div>

                <!-- Datos de tarjeta -->
                <div class="form-row">
    <div class="form-group col-md-6">
        <label for="numeroTarjeta">Número de Tarjeta</label>
        <input type="text" class="form-control" id="numeroTarjeta" name="numeroTarjeta" placeholder="Ingrese el número de tarjeta" required>
    </div>
    <div class="form-group col-md-3">
        <label for="cvv">CVV</label>
        <input type="text" class="form-control" id="cvv" name="cvv" placeholder="Ingrese el CVV" required>
    </div>
    <div class="form-group col-md-3">
        <label for="fechaExpiracion">Fecha de Expiración</label>
        <input type="month" class="form-control" id="fechaExpiracion" name="fechaExpiracion" required>
    </div>
</div>


                <!-- Botones de confirmación -->
                <div class="form-group text-center button-group">
                    <button type="submit" class="btn btn-primary">Confirmar Compra</button>
                    <a href="listaVuelosDisponibles.jsp" class="btn btn-warning">Cancelar</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Scripts necesarios -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
