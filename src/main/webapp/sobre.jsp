<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
String usuario = (String) session.getAttribute("usuarioLogado");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Sobre o Sistema FarmControl</title>
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<header>
		<div class="logo">
			<i class="fas fa-capsules"></i> FarmControl
		</div>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="sobre.jsp">Sobre o Sistema</a></li>
			</ul>
		</nav>
		
		<% if (usuario == null) { %>
    <a class="login" href="login.jsp"
       style="background: #1db954; color: white; border: none; padding: 5px 10px; border-radius: 5px; margin-left: 10px;">
       Entrar
    </a>
<% } else { %>
    <a href="logout.jsp"
       style="background: #dc3545; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; margin-left: 10px;">
       Sair
    </a>
<% } %>

	</header>

	<div class="container">
		<i class="fas fa-capsules" style="font-size: 2rem; color: #00b36b;"></i>
		<h1>Sobre o Sistema FarmControl</h1>
		<p>FarmControl é um sistema web desenvolvido para facilitar o
			gerenciamento de medicamentos de forma simples, segura e eficiente.
			Voltado principalmente para farmácias, clínicas ou profissionais da
			área da saúde, o sistema permite que usuários autenticados realizem
			as principais operações relacionadas a medicamentos.</p>

		<div class="missao">
			<img src="img/foto.png" alt="Imagem de medicamentos">
			<div class="missao-texto">
				<h2>Na pratica</h2>
				<p>As informações armazenadas incluem nome comercial, princípio
					ativo, fabricante, validade, lote, dosagem, indicação e forma
					farmacêutica (comprimido, cápsula, solução, entre outros). A página
					inicial destaca os medicamentos em promoção ou recém-lançados,
					permitindo uma navegação intuitiva para qualquer visitante. Já os
					usuários logados possuem acesso completo às funcionalidades
					administrativas do sistema.</p>
				<p>Além disso, o FarmControl conta com um controle de permissões
					que garante a segurança dos dados: apenas usuários registrados
					podem editar ou remover medicamentos. Tentativas de acesso não
					autorizado são automaticamente redirecionadas para uma página de
					erro com a devida explicação.</p>
			</div>
		</div>
	</div>

	<footer class="footer">
		<div class="footer-container">
			<div class="footer-col">
				<div class="footer-logo">
					<i class="fas fa-capsules"></i> <span><strong>FarmControl</strong></span>
				</div>
				<p>Sua saúde é nossa prioridade. Oferecemos os melhores
					medicamentos com preços acessíveis.</p>
				<div class="footer-social">
					<i class="fab fa-facebook-f"></i> <i class="fab fa-instagram"></i>
					<i class="fab fa-twitter"></i>
				</div>
			</div>



		</div>
		<div class="footer-bottom">© 2025 FarmControl. Todos os direitos
			reservados.</div>
	</footer>
</body>
</html>
