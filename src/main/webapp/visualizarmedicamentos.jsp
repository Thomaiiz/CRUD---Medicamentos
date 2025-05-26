<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="br.edu.ifsp.model.Medicamentos"%>

<%
String usuario = (String) session.getAttribute("usuarioLogado");
if (usuario == null) {
	response.sendRedirect("erro.jsp");
	return;
}

ArrayList<Medicamentos> lista = (ArrayList<Medicamentos>) application.getAttribute("lista");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Medicamentos Cadastrados</title>
<link rel="stylesheet" href="styleindex.css">
</head>
<body>

	<header>
		<div class="logo">
			<img src="img/LogoFarmControl.png" alt="Logo FarmControl"
				style="height: 70px; margin-right: 20px;"> FarmControl
		</div>

		<div class="menu-toggle" onclick="toggleMenu()">☰</div>
		<nav>
			<a href="index.jsp">Home</a> <a href="sobre.html">Sobre o Sistema</a>

			<%
			if (usuario != null) {
			%>
			<a href="config.jsp">Configurações </a>
			<%
			}
			%>

			<%
			if (usuario != null) {
			%>
			<a href="visualizarmedicamentos.jsp">Medicamentos Cadastrados</a>
			<%
			}
			%>

		</nav>

		<div class="header-actions">
			<div class="search-box" style="display: inline-block;">
				<input type="text" placeholder="Pesquisar...">
			</div>

			<%
			if (usuario == null) {
			%>
			<a class="login" href="login.jsp"
				style="background: #1db954; color: white; border: none; padding: 5px 10px; border-radius: 5px; margin-left: 10px;">Entrar</a>
			<%
			} else {
			%>
			<a href="cadastromedicamentos.jsp"
				style="background: #007BFF; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; margin-left: 10px;">Cadastrar
				Medicamento</a> <a href="logout.jsp"
				style="background: #dc3545; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; margin-left: 10px;">Sair</a>
			<%
			}
			%>
		</div>
	</header>

	<main style="padding: 40px;">
		<h1 style="text-align:center; color:white; font-size: 2.5rem; margin-bottom: 10px;">Lista de Medicamentos Cadastrados</h1>
    <hr style="width: 60%; margin: 0 auto 30px auto; border: 1px solid rgba(255,255,255,0.2);">
		<div
			style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; margin-top: 30px;">
			<%
			if (lista != null && !lista.isEmpty()) {
				for (Medicamentos m : lista) {
			%>
			
			<div class="card">
			 <a href="detalhes.jsp?nome=<%=java.net.URLEncoder.encode(m.getNomeComercial(), "UTF-8")%>" style="text-decoration: none; color: inherit;">
				<img class="card-img-top" src="img/<%=m.getImagem()%>"
					alt="<%=m.getNomeComercial()%>">
				<h3><%=m.getNomeComercial()%></h3>
				<p class="descricao"><%=m.getDescricao()%></p>
				<p class="preco">
					R$
					<%=String.format("%.2f", m.getPreco())%></p>
				<div class="botoes-acao">
					<form action="editar.jsp" method="get">
						<input type="hidden" name="nome" value="<%=m.getNomeComercial()%>">
						<button type="submit" class="botao editar">Editar</button>
					</form>
					<form action="RemoverMedicamentoServlet" method="post">
						<input type="hidden" name="nomeComercial"
							value="<%=m.getNomeComercial()%>">
						<button type="submit" class="botao excluir">Excluir</button>
					</form>
				</div>
			</div>
			<%
			}
			} else {
			%>
			<p style="text-align: center;">Nenhum medicamento cadastrado.</p>
			<%
			}
			%>
		</div>
	</main>

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
