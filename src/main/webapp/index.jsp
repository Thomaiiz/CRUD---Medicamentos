<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String usuario = (String) session.getAttribute("usuarioLogado");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>FarmControl</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1db954, #1abc9c);
            color: white;
        }
        header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: white;
            color: #1db954;
            padding: 1rem 2rem;
        }
        .logo {
            font-weight: bold;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
        }
        .logo::before {
            content: "💊";
            margin-right: 0.5rem;
        }
        nav a {
            margin: 0 15px;
            color: black;
            text-decoration: none;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .hero {
            text-align: center;
            padding: 100px 20px;
        }
        .hero h1 {
            font-size: 2.5rem;
            font-weight: bold;
        }
        .hero p {
            font-size: 1.1rem;
            margin: 20px 0;
        }
        .search-box {
            margin-top: 20px;
        }
        .search-box input {
            padding: 10px;
            width: 300px;
            border-radius: 5px;
            border: none;
        }
        .buttons {
            margin-top: 20px;
        }
        .buttons button {
            margin: 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background: white;
            color: #1db954;
            cursor: pointer;
            font-weight: bold;
        }
        .destaque {
            background: #f9f9f9;
            color: black;
            text-align: center;
            padding: 40px 20px;
        }
        .destaque h2 {
            font-size: 1.8rem;
        }
        .ver-todos {
            margin-top: 10px;
        }
        .ver-todos a {
            text-decoration: none;
            padding: 10px 15px;
            border: 2px solid #1db954;
            color: #1db954;
            border-radius: 5px;
        }
        
        .login {
        	text-decoration: none;
        }
        
    </style>
</head>
<body>
    <header>
        <div class="logo">FarmControl</div>
        <nav>
            <a href="#">Home</a>
            <a href="#">Medicamentos</a>
            <a href="sobre.html">Sobre o Sistema</a>
            <a href="#">Contato</a>
        </nav>
        <div>
            🔍
        <%
            if (usuario == null) {
        %>
            <a class="login" href="login.jsp"
               style="background:#1db954; color:white; border:none; padding:5px 10px; border-radius:5px;">Entrar</a>
        <%
            } else {
        %>
            <a href="cadastromedicamentos.jsp"
               style="background:#007BFF; color:white; padding:5px 10px; border-radius:5px; text-decoration:none; margin-right:10px;">Cadastrar Medicamento</a>
            <a href="SaidaServlet"
               style="background:#dc3545; color:white; padding:5px 10px; border-radius:5px; text-decoration:none;">Sair</a>
        <%
            }
        %>
        </div>
    </header>

    <div class="hero">
        <h1>FarmControl: Sua Saúde, Nosso Cuidado</h1>
        <p>Encontre os melhores medicamentos, promoções imperdíveis e lançamentos exclusivos. Qualidade e confiança para o seu bem-estar.</p>
        <div class="search-box">
            <input type="text" placeholder="O que você procura hoje?">
        </div>
        <div class="buttons">
            <button>⚡ Ver Lançamentos</button>
            <button>Promoções</button>
        </div>
    </div>

       <div class="destaque">
        <h2>Medicamentos em Destaque</h2>
        <p>Conheça nossos produtos mais vendidos</p>
        <div class="ver-todos">
            <a href="#">Ver todos →</a>
        </div>
    </div>
    <footer class="footer">
      <div class="footer-container">
        <div class="footer-col">
          <div class="footer-logo">
            <i class="fas fa-capsules"></i>
            <span><strong>FarmControl</strong></span>
          </div>
          <p>Sua saúde é nossa prioridade. Oferecemos os melhores medicamentos com preços acessíveis.</p>
          <div class="footer-social">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-instagram"></i>
            <i class="fab fa-twitter"></i>
          </div>
        </div>

        <div class="footer-col">
          <h4>Links Rápidos</h4>
          <ul>
            <li><a href="index.jsp">Início</a></li>
            <li><a href="lista-medicamentos.jsp">Medicamentos</a></li>
            <li><a href="sobre.html">Sobre Nós</a></li>
            <li><a href="#">Contato</a></li>
          </ul>
        </div>

        <div class="footer-col">
          <h4>Categorias</h4>
          <ul>
            <li><a href="#">Analgésicos</a></li>
            <li><a href="#">Anti-inflamatórios</a></li>
            <li><a href="#">Antibióticos</a></li>
            <li><a href="#">Vitaminas</a></li>
            <li><a href="#">Suplementos</a></li>
          </ul>
        </div>

        <div class="footer-col">
          <h4>Contato</h4>
          <ul class="footer-contact">
            <li><i class="fas fa-map-marker-alt"></i> Av. Paulista, 1000, São Paulo - SP</li>
            <li><i class="fas fa-phone-alt"></i> (11) 9999-9999</li>
            <li><i class="fas fa-envelope"></i> contato@farmcontrol.com</li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        © 2025 FarmControl. Todos os direitos reservados.
      </div>
    </footer>

</body>
</html>
