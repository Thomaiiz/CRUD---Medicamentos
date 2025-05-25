<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
String usuario = (String) session.getAttribute("usuarioLogado");
if (usuario == null) {
	response.sendRedirect("erro.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Medicamento - FarmControl</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="stylelr.css">
<!-- mesmo CSS das telas de login/registro -->
</head>
<body>
	<div class="register-container">
		<h2>Cadastrar Medicamento</h2>

		<%
		if (application.getAttribute("mensagem") != null) {
		%>
		<div class="alert alert-danger">
			<%=application.getAttribute("mensagem")%>
			<%
			application.removeAttribute("mensagem");
			%>
		</div>
		<%
		}
		%>

		<form action="MedicamentosServlet" method="post"
			enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-6 mb-3">
					<label class="form-label">Nome Comercial:</label> <input
						type="text" class="form-control" name="nomeComercial" required>
				</div>
				<div class="col-md-6 mb-3">
					<label class="form-label">Princípio Ativo:</label> <input
						type="text" class="form-control" name="principioAtivo" required>
				</div>

				<div class="col-md-6 mb-3">
					<label class="form-label">Fabricante:</label> <input type="text"
						class="form-control" name="fabricante" required>
				</div>
				<div class="col-md-6 mb-3">
					<label class="form-label">Data de Validade:</label> <input
						type="date" class="form-control" name="dataValidade" required>
				</div>

				<div class="col-md-6 mb-3">
					<label class="form-label">Lote:</label> <input type="text"
						class="form-control" name="lote" required>
				</div>
				<div class="col-md-6 mb-3">
					<label class="form-label">Dosagem:</label> <input type="text"
						class="form-control" name="dosagem" required>
				</div>

				<div class="col-md-6 mb-3">
					<label class="form-label">Forma Farmacêutica:</label> <input
						type="text" class="form-control" name="formaFarmaceutica" required>
				</div>
				<div class="col-md-6 mb-3">
					<label class="form-label">Imagem:</label> <input type="file"
						class="form-control" name="imagem" style="min-width: 190px;"
						accept="image/*" required>
				</div>

				<div class="col-md-12 mb-3">
					<label class="form-label">Descrição:</label>
					<textarea class="form-control" name="descricao" rows="3" required></textarea>
				</div>

				<div class="col-md-6 mb-3">
					<label class="form-label">Preço (R$):</label> <input type="number"
						step="0.01" class="form-control" name="preco" required>
				</div>

			</div>

			<button type="submit" class="btn btn-success w-100">Cadastrar</button>
		</form>


		<p class="mt-3 text-center">
			<a href="index.jsp">← Voltar para página inicial</a>
		</p>
	</div>
</body>
</html>
