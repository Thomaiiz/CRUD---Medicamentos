<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - FarmControl</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="stylelr.css">
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>

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
