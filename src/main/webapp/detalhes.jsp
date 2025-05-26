<%@page import="br.edu.ifsp.model.Medicamentos"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
String nome = request.getParameter("nome");
ArrayList<Medicamentos> lista = (ArrayList<Medicamentos>) application.getAttribute("lista");
Medicamentos selecionado = null;

if (lista != null) {
	for (Medicamentos m : lista) {
		if (m.getNomeComercial().equalsIgnoreCase(nome)) {
	selecionado = m;
	break;
		}
	}
}
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Descrição do Medicamento</title>
<style>
body {
	font-family: Arial, sans-serif;
	padding: 40px;
	background: #f2f2f2;
}

.card {
	background: white;
	padding: 30px;
	max-width: 600px;
	margin: auto;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

img {
	width: 100%;
	border-radius: 10px;
}

h1 {
	color: #1db954;
}
</style>
</head>
<body>

	<div class="card">
		<%
		if (selecionado != null) {
		%>
		<img src="img/<%=selecionado.getImagem()%>"
			alt="Imagem do Medicamento">
		<h1><%=selecionado.getNomeComercial()%></h1>
		<p>
			<strong>Princípio Ativo:</strong>
			<%=selecionado.getPrincipioAtivo()%></p>
		<p>
			<strong>Fabricante:</strong>
			<%=selecionado.getFabricante()%></p>
		<p>
			<strong>Data de Validade:</strong>
			<%=selecionado.getDataValidade()%></p>
		<p>
			<strong>Lote:</strong>
			<%=selecionado.getLote()%></p>
		<p>
			<strong>Dosagem:</strong>
			<%=selecionado.getDosagem()%></p>
		<p>
			<strong>Forma Farmacêutica:</strong>
			<%=selecionado.getFormaFarmaceutica()%></p>

		<p>
			<strong>Preço:</strong> R$
			<%=String.format("%.2f", selecionado.getPreco())%>
		</p>
		
		<%
		} else {
		%>
		<p>Medicamento não encontrado.</p>
		<%
		}
		%>
	</div>

</body>
</html>
