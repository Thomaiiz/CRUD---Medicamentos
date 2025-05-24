<%@page import="br.edu.ifsp.model.Medicamentos"%>
<%@page import="java.util.ArrayList"%>
<%@ page session="true" contentType="text/html;charset=UTF-8"
	language="java"%>

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
<title>Editar Medicamento</title>
</head>
<body>
	<%
	if (selecionado != null) {
	%>
	<h1>
		Editar Medicamento:
		<%=selecionado.getNomeComercial()%></h1>
	<form action="EditarMedicamentoServlet" method="post">
		<input type="hidden" name="originalNome"
			value="<%=selecionado.getNomeComercial()%>" /> Nome Comercial: <input
			type="text" name="nomeComercial"
			value="<%=selecionado.getNomeComercial()%>" /><br /> Princípio
		Ativo: <input type="text" name="principioAtivo"
			value="<%=selecionado.getPrincipioAtivo()%>" /><br /> Fabricante: <input
			type="text" name="fabricante"
			value="<%=selecionado.getFabricante()%>" /><br /> Data Validade: <input
			type="date" name="dataValidade"
			value="<%=selecionado.getDataValidade()%>" /><br /> Lote: <input
			type="text" name="lote" value="<%=selecionado.getLote()%>" /><br />
		Dosagem: <input type="text" name="dosagem"
			value="<%=selecionado.getDosagem()%>" /><br /> Forma Farmacêutica:
		<input type="text" name="formaFarmaceutica"
			value="<%=selecionado.getFormaFarmaceutica()%>" /><br />
		<button type="submit">Atualizar</button>
	</form>
	<%
	} else {
	%>
	<p>Medicamento não encontrado para edição.</p>
	<%
	}
	%>
</body>
</html>
