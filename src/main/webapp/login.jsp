<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - FarmControl</title>
    <!-- Incluir CSS do Bootstrap -->
</head>
<body>
    <div class="container">
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
            <div class="form-group">
                <label for="email">E-mail:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" required>
            </div>
            <button type="submit" class="btn btn-primary">Entrar</button>
        </form>
        
        <p class="mt-3">Não tem uma conta? <a href="registro.jsp">Registre-se</a></p>
    </div>
</body>
</html>