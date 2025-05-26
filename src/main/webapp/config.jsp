<%@ page session="true" %>
<%
    String usuarioLogado = (String) session.getAttribute("usuarioLogado");
    if (usuarioLogado == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Configurações Pessoais - FarmControl</title>
    <link rel="stylesheet" href="styleindex.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="img/LogoFarmControl.png" alt="Logo FarmControl" style="height: 70px; margin-right: 20px;">
            FarmControl
        </div>

        <nav>
            <a href="index.jsp">Home</a>
            <a href="#">Medicamentos</a>
            <a href="sobre.html">Sobre o Sistema</a>
            <a href="config.jsp">Configurações Pessoais</a>
        </nav>

        <div class="header-actions">
            <a class="login" href="logout.jsp"
               style="background: #dc3545; color: white; border: none; padding: 5px 10px; border-radius: 5px; margin-left: 10px;">Sair</a>
        </div>
    </header>

    <main style="padding: 40px; text-align: center;">
        <h2>Configurações Pessoais</h2>
        <p>Você está logado como: <strong><%= usuarioLogado %></strong></p>

    </main>
</body>
</html>
