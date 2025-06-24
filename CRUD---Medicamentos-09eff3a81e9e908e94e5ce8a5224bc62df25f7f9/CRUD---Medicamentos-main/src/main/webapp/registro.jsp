<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registro - FarmControl</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="stylelr.css">
</head>
<body>
    <div class="register-container">
        <h2>Registrar nova conta</h2>

        <% if(request.getParameter("erro") != null) { %>
            <div class="alert alert-danger">
                <% if(request.getParameter("erro").equals("1")) { %>
                    Preencha todos os campos!
                <% } else if(request.getParameter("erro").equals("2")) { %>
                    Este e-mail já está cadastrado!
                <% } %>
            </div>
        <% } %>

        <form action="RegistrarUsuarioServlet" method="post">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome completo:</label>
                <input type="text" class="form-control" id="nome" name="nome" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">E-mail:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="senha" class="form-label">Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Registrar</button>
        </form>

        <p class="mt-3">Já tem uma conta? <a href="login.jsp">Faça login</a></p>
    </div>
</body>
</html>
