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
    <title>Configura��es Pessoais - FarmControl</title>
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
            <a href="sobre.jsp">Sobre o Sistema</a>
            <a href="config.jsp">Configura��es Pessoais</a>
        </nav>

        <div class="header-actions">
            <a class="login" href="logout.jsp"
               style="background: #dc3545; color: white; border: none; padding: 5px 10px; border-radius: 5px; margin-left: 10px;">Sair</a>
        </div>
    </header>

    <main style="padding: 40px; text-align: center;">
        <h2>Configura��es Pessoais</h2>
        <p>Voc� est� logado como: <strong><%= usuarioLogado %></strong></p>

    </main>
    
    
</body>
</html>
