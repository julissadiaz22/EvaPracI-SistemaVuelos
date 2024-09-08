<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesión</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f9fc;
            font-family: 'Helvetica', sans-serif;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .login-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-header h1 {
            font-size: 24px;
            color: #333333;
        }
        .form-group input {
            border-radius: 5px;
        }
        .btn-login {
            width: 100%;
            border-radius: 5px;
        }
        .form-footer {
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>Inicio de Sesión</h1>
        </div>
        <form action="procesarLogin.jsp" method="post">
            <div class="form-group">
                <label for="usuario">Usuario</label>
                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingrese su usuario" required>
            </div>
            <div class="form-group">
                <label for="contrasena">Contraseña</label>
                <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Ingrese su contraseña" required>
            </div>
            <button type="submit" class="btn btn-primary btn-login">Iniciar Sesión</button>

            <% 
                String error = (String) session.getAttribute("error");
                if (error != null) {
            %>
                <div class="alert alert-danger mt-3" role="alert">
                    <%= error %>
                </div>
                <% 
                    session.removeAttribute("error");
                } 
            %>
        </form>
        <div class="form-footer">
            <p>¿No tienes una cuenta? <a href="loginRegister.jsp">Regístrate</a></p>
        </div>
    </div>
</body>
</html>