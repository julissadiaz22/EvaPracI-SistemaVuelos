<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Cliente</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Enlace a SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background-color: #f4f4f4;
            font-family: 'Roboto', sans-serif;
        }
        .navbar {
            background-color: #3f51b5; /* Azul más moderno */
            height: 70px;
        }
        .navbar-brand {
            font-size: 28px;
            color: #fff;
            font-weight: bold;
        }
        .navbar-nav .nav-link {
            color: #fff !important;
            padding-left: 20px;
            padding-right: 20px;
            font-size: 16px;
        }
        .navbar-nav .nav-link:hover {
            background-color: #303f9f; /* Azul más oscuro para el hover */
            border-radius: 5px;
            color: #fff !important;
        }
        .navbar-toggler {
            border-color: transparent;
        }
        .navbar-toggler-icon {
            background-color: #fff;
        }
        .container {
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">Bienvenido</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="listaVuelosDisponibles.jsp">Vuelos Disponibles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reporteCompraCliente.jsp">Compras Realizadas</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" id="cerrarSesion">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Enlace a Bootstrap JS y jQuery (opcional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Enlace a SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        document.getElementById('cerrarSesion').addEventListener('click', function(event) {
            event.preventDefault(); // Evitar la acción por defecto del enlace
            Swal.fire({
                title: '¿Estás seguro?',
                text: "¿Quieres cerrar sesión?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, salir',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'login.jsp'; // Redirigir a login.jsp si se confirma
                }
            });
        });
    </script>
</body>
</html>
