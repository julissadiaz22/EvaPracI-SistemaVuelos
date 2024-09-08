<%@page import="clases.Cliente"%>
<%@page import="clases.ClienteManager"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f9fc;
            font-family: 'Helvetica', sans-serif;
        }
        .register-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .register-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .register-header h1 {
            font-size: 24px;
            color: #333333;
        }
        .form-group input {
            border-radius: 5px;
        }
        .btn-register, .btn-cancel {
            width: 48%;
            border-radius: 5px;
        }
        .btn-cancel {
            background-color: #f44336;
            color: white;
        }
        .btn-cancel:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <h1>Crear Cuenta</h1>
        </div>
        <form action="procesarRegistro.jsp" method="post">
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese su nombre" required>
            </div>
            <div class="form-group">
                <label for="usuario">Usuario</label>
                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingrese su usuario" required>
            </div>
            <div class="form-group">
                <label for="correo">Correo Electrónico</label>
                <input type="email" class="form-control" id="correo" name="correo" placeholder="Ingrese su correo" required>
            </div>
            <div class="form-group">
                <label for="clave">Contraseña</label>
                <input type="password" class="form-control" id="clave" name="clave" placeholder="Ingrese su contraseña" required>
            </div>
            <div class="form-group">
                <label for="repetirClave">Repetir Contraseña</label>
                <input type="password" class="form-control" id="repetirClave" name="repetirClave" placeholder="Repita su contraseña" required>
            </div>
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary btn-register">Crear Cuenta</button>
                <button type="reset" class="btn btn-cancel">Cancelar</button>
            </div>
        </form>
    </div>
</body>
</html>