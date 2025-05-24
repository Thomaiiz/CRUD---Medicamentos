<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registro - FarmControl</title>
    <!-- Incluir CSS do Bootstrap -->
</head>
<body>
    <div class="container">
        <h2>Registrar nova conta</h2>
        
        <%-- Mensagens de erro --%>
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
            <div class="form-group">
                <label for="nome">Nome completo:</label>
                <input type="text" class="form-control" id="nome" name="nome" required>
            </div>
            <div class="form-group">
                <label for="email">E-mail:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" required>
            </div>
            <button type="submit" class="btn btn-primary">Registrar</button>
        </form>
        
        <p class="mt-3">Já tem uma conta? <a href="login.jsp">Faça login</a></p>
    </div>
</body>
</html>