<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.jsp">FarmControl</a>
    
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="sobre.jsp">Sobre</a></li>
            
            <%-- Mostrar opções apenas para usuários logados --%>
            <% if(session.getAttribute("usuarioLogado") != null) { %>
                <li class="nav-item"><a class="nav-link" href="cadastro-medicamento.jsp">Cadastrar Medicamento</a></li>
                <li class="nav-item"><a class="nav-link" href="lista-medicamentos.jsp">Meus Medicamentos</a></li>
            <% } %>
        </ul>
        
        <%-- Parte direita do menu --%>
        <div class="navbar-nav">
            <% if(session.getAttribute("usuarioLogado") != null) { %>
                <span class="navbar-text mr-3">Olá, <%= session.getAttribute("nomeUsuario") %></span>
                <a class="btn btn-outline-danger" href="SaidaServlet">Sair</a>
            <% } else { %>
                <a class="btn btn-outline-primary" href="login.jsp">Login</a>
                <a class="btn btn-primary ml-2" href="registro.jsp">Registrar</a>
            <% } %>
        </div>
    </div>
</nav>