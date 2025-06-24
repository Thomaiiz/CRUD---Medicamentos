<%@page import="br.edu.ifsp.dao.MedicamentoDAO"%>
<%@page import="br.edu.ifsp.model.Medicamentos"%>

<%
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("erro.jsp");
        return;
    }

    String nome = request.getParameter("nome");
    Medicamentos selecionado = new MedicamentoDAO().buscarPorNome(nome);
%>


<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Editar Medicamento</title>
<link rel="stylesheet" href="styleeditar.css">

</head>
<body>
	<%
	if (selecionado != null) {
	%>
	<div class="container">
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
	 </div>
</body>
</html>
