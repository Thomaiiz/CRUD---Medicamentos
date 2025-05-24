<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - FarmControl</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #00b56e, #1abc9c);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .login-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 420px;
        }

        .login-container h2 {
            color: #00b56e;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-label {
            font-weight: 600;
            color: #333;
        }

        .form-control {
            border-radius: 12px;
        }

        .btn-primary {
            background-color: #00b56e;
            border: none;
            border-radius: 12px;
            padding: 10px 0;
            font-weight: 600;
        }

        .btn-primary:hover {
            background-color: #01935d;
        }

        .alert {
            border-radius: 12px;
        }

        a {
            color: #00b56e;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        p.mt-3 {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>

        <%-- Mensagens de erro/sucesso --%>
        <% if(request.getParameter("erro") != null) { %>
            <div class="alert alert-danger">
                E-mail ou senha incorretos!
            </div>
        <% } %>

        <% if(request.getParameter("sucesso") != null) { %>
            <div class="alert alert-success">
                Registro realizado com sucesso! Faça login para continuar.
            </div>
        <% } %>

        <form action="UsuarioLogin" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">E-mail:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="senha" class="form-label">Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Entrar</button>
        </form>

        <p class="mt-3">Não tem uma conta? <a href="registro.jsp">Registre-se</a></p>
    </div>
</body>
</html>
