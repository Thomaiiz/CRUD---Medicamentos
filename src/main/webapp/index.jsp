<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifsp.model.Medicamentos"%>

<%
String usuario = (String) session.getAttribute("usuarioLogado");
ArrayList<Medicamentos> lista = (ArrayList<Medicamentos>) application.getAttribute("lista");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>FarmControl</title>
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
			<a href="#">Home</a> <a href="sobre.html">Sobre o Sistema</a>

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

	<div class="hero">
		<h1>FarmControl: Sua Saúde, Nosso Cuidado</h1>
		<p>Encontre os melhores medicamentos, promoções imperdíveis e
			lançamentos exclusivos. Qualidade e confiança para o seu bem-estar.</p>

		<div class="search-box">
			<input type="text" placeholder="O que você procura hoje?">
		</div>

		<div class="buttons">
			<a href="#lancamentos">
				<button>💸 Ver Lançamentos</button>
			</a> <a href="#promocoes">
				<button>🚨 Promoções</button>
			</a>
		</div>

	</div>

	<section id="lancamentos"
		style="background-color: #f3fbf6; padding: 60px 20px;">
		<h2 style="text-align: center; color: #1db954; font-size: 2rem;">💸
			Lançamentos</h2>
		<p style="text-align: center; color: #666; margin-bottom: 40px;">Confira
			as maiores novidades da FarmControl!</p>

		<div
			style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px;">

			<div
				style="background: white; width: 200px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); position: relative; padding: 10px 15px; text-align: center;">
				<div
					style="position: absolute; top: 10px; left: 10px; background: #ffcc00; color: #333; padding: 3px 8px; font-weight: bold; border-radius: 4px; font-size: 0.8rem;">NOVO</div>
				<img src="img/foto6.png" alt="Produto 1"
					style="height: 100px; margin: 30px auto 10px; display: block;">
				<h4 style="font-size: 0.95rem;">Protetor Labial Carmed Glitter
					3 Em 1 Tutti-frutti 10gr.</h4>
				<p style="color: #999; text-decoration: line-through;"></p>
				<p style="color: #e60000; font-weight: bold; font-size: 1.1rem;">
					R$ 24,99 <span style="font-size: 0.8rem;">no pix</span>
				</p>
				<p style="color: #666; font-size: 0.8rem;">ou 2x de R$ 12,99 no
					cartão</p>
				<button
					style="margin-top: 10px; background: #1db954; border: none; color: white; padding: 8px 0; width: 100%; border-radius: 8px; font-weight: bold;">ADICIONAR</button>
			</div>

			<div
				style="background: white; width: 200px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); position: relative; padding: 10px 15px; text-align: center;">
				<div
					style="position: absolute; top: 10px; left: 10px; background: #ffcc00; color: #333; padding: 3px 8px; font-weight: bold; border-radius: 4px; font-size: 0.8rem;">NOVO</div>
				<img src="img/foto7.png" alt="Produto 2"
					style="height: 100px; margin: 30px auto 10px; display: block;">
				<h4 style="font-size: 0.95rem;">Teste De Gravidez Confirme Com
					1 Unidade</h4>
				<p style="color: #999; text-decoration: line-through;"></p>
				<p style="color: #e60000; font-weight: bold; font-size: 1.1rem;">
					R$ 5,99 <span style="font-size: 0.8rem;">no pix</span>
				</p>
				<p style="color: #666; font-size: 0.8rem;">1 unidade</p>
				<button
					style="margin-top: 10px; background: #1db954; border: none; color: white; padding: 8px 0; width: 100%; border-radius: 8px; font-weight: bold;">ADICIONAR</button>
			</div>

			<div
				style="background: white; width: 200px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); position: relative; padding: 10px 15px; text-align: center;">
				<div
					style="position: absolute; top: 10px; left: 10px; background: #ffcc00; color: #333; padding: 3px 8px; font-weight: bold; border-radius: 4px; font-size: 0.8rem;">NOVO</div>
				<img src="img/foto8.png" alt="Produto 3"
					style="height: 100px; margin: 30px auto 10px; display: block;">
				<h4 style="font-size: 0.95rem;">Tadalafila</h4>
				<p style="color: #999; text-decoration: line-through;">R$ 99,22</p>
				<p style="color: #e60000; font-weight: bold; font-size: 1.1rem;">
					R$ 19,90 <span style="font-size: 0.8rem;">no pix</span>
				</p>
				<p style="color: #666; font-size: 0.8rem;">Ultimos estoques!</p>
				<button
					style="margin-top: 10px; background: #1db954; border: none; color: white; padding: 8px 0; width: 100%; border-radius: 8px; font-weight: bold;">ADICIONAR</button>
			</div>

			<div
				style="background: white; width: 200px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); position: relative; padding: 10px 15px; text-align: center;">
				<div
					style="position: absolute; top: 10px; left: 10px; background: #ffcc00; color: #333; padding: 3px 8px; font-weight: bold; border-radius: 4px; font-size: 0.8rem;">NOVO</div>
				<img src="img/foto9.png" alt="Produto 3"
					style="height: 100px; margin: 30px auto 10px; display: block;">
				<h4 style="font-size: 0.95rem;">Solucao Fisiologica Cloreto De
					Sodio A 0,9% Lunis 500ml</h4>
				<p style="color: #999; text-decoration: line-through;"></p>
				<p style="color: #e60000; font-weight: bold; font-size: 1.1rem;">
					R$ 7,90 <span style="font-size: 0.8rem;">no pix</span>
				</p>
				<p style="color: #666; font-size: 0.8rem;">Leve 3 pague 2</p>
				<button
					style="margin-top: 10px; background: #1db954; border: none; color: white; padding: 8px 0; width: 100%; border-radius: 8px; font-weight: bold;">ADICIONAR</button>
			</div>

			<div
				style="background: white; width: 200px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); position: relative; padding: 10px 15px; text-align: center;">
				<div
					style="position: absolute; top: 10px; left: 10px; background: #ffcc00; color: #333; padding: 3px 8px; font-weight: bold; border-radius: 4px; font-size: 0.8rem;">NOVO</div>
				<img src="img/foto10.png" alt="Produto 3"
					style="height: 100px; margin: 30px auto 10px; display: block;">
				<h4 style="font-size: 0.95rem;">Shampoo Anticaspa Cetoconazol
					Prevent Pharma 100ml</h4>
				<p style="color: #999; text-decoration: line-through;">R$ 17,90</p>
				<p style="color: #e60000; font-weight: bold; font-size: 1.1rem;">
					R$ 15,59 <span style="font-size: 0.8rem;">no pix</span>
				</p>
				<p style="color: #666; font-size: 0.8rem;">Ultimos estoques!</p>
				<button
					style="margin-top: 10px; background: #1db954; border: none; color: white; padding: 8px 0; width: 100%; border-radius: 8px; font-weight: bold;">ADICIONAR</button>
			</div>
	</section>


	<section id="promocoes"
		style="background-color: #f3fbf6; padding: 60px 20px;">
		<h2 style="text-align: center; color: #1db954; font-size: 2rem;">🚨
			Ofertas Especiais</h2>
		<p style="text-align: center; color: #666; margin-bottom: 40px;">Aproveite
			os melhores preços da semana!</p>

		<div
			style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px;">

			<div
				style="background: white; width: 200px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); position: relative; padding: 10px 15px; text-align: center;">
				<div
					style="position: absolute; top: 10px; left: 10px; background: #ffcc00; color: #333; padding: 3px 8px; font-weight: bold; border-radius: 4px; font-size: 0.8rem;">40%</div>
				<img src="img/foto1.png" alt="Produto 1"
					style="height: 100px; margin: 30px auto 10px; display: block;">
				<h4 style="font-size: 0.95rem;">Toalha Umedecida Bimbi 100 un.</h4>
				<p style="color: #999; text-decoration: line-through;">R$ 16,69</p>
				<p style="color: #e60000; font-weight: bold; font-size: 1.1rem;">
					R$ 9,79 <span style="font-size: 0.8rem;">no pix</span>
				</p>
				<p style="color: #666; font-size: 0.8rem;">ou 1x de R$ 9,99 no
					cartão</p>
				<button
					style="margin-top: 10px; background: #1db954; border: none; color: white; padding: 8px 0; width: 100%; border-radius: 8px; font-weight: bold;">ADICIONAR</button>
			</div>

			<div
				style="background: white; width: 200px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); position: relative; padding: 10px 15px; text-align: center;">
				<div
					style="position: absolute; top: 10px; left: 10px; background: #ffcc00; color: #333; padding: 3px 8px; font-weight: bold; border-radius: 4px; font-size: 0.8rem;">11%</div>
				<img src="img/foto2.png" alt="Produto 2"
					style="height: 100px; margin: 30px auto 10px; display: block;">
				<h4 style="font-size: 0.95rem;">Fralda Huggies Supreme Care
					Hiper Xxg 54 Unidades</h4>
				<p style="color: #999; text-decoration: line-through;">R$ 89,99</p>
				<p style="color: #e60000; font-weight: bold; font-size: 1.1rem;">
					R$ 79,90 <span style="font-size: 0.8rem;">no pix</span>
				</p>
				<p style="color: #666; font-size: 0.8rem;">ou 2x de R$ 39,95 sem
					juros</p>
				<button
					style="margin-top: 10px; background: #1db954; border: none; color: white; padding: 8px 0; width: 100%; border-radius: 8px; font-weight: bold;">ADICIONAR</button>
			</div>

			<div
				style="background: white; width: 200px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); position: relative; padding: 10px 15px; text-align: center;">
				<div
					style="position: absolute; top: 10px; left: 10px; background: #ffcc00; color: #333; padding: 3px 8px; font-weight: bold; border-radius: 4px; font-size: 0.8rem;">80%</div>
				<img src="img/foto3.png" alt="Produto 3"
					style="height: 100px; margin: 30px auto 10px; display: block;">
				<h4 style="font-size: 0.95rem;">Tadalafila</h4>
				<p style="color: #999; text-decoration: line-through;">R$ 99,22</p>
				<p style="color: #e60000; font-weight: bold; font-size: 1.1rem;">
					R$ 19,90 <span style="font-size: 0.8rem;">no pix</span>
				</p>
				<p style="color: #666; font-size: 0.8rem;">Ultimos estoques!</p>
				<button
					style="margin-top: 10px; background: #1db954; border: none; color: white; padding: 8px 0; width: 100%; border-radius: 8px; font-weight: bold;">ADICIONAR</button>
			</div>

			<div
				style="background: white; width: 200px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); position: relative; padding: 10px 15px; text-align: center;">
				<div
					style="position: absolute; top: 10px; left: 10px; background: #ffcc00; color: #333; padding: 3px 8px; font-weight: bold; border-radius: 4px; font-size: 0.8rem;">21%</div>
				<img src="img/foto4.png" alt="Produto 3"
					style="height: 100px; margin: 30px auto 10px; display: block;">
				<h4 style="font-size: 0.95rem;">Formula Infantil Nestonutri
					Lata 800g</h4>
				<p style="color: #999; text-decoration: line-through;">R$ 68,99</p>
				<p style="color: #e60000; font-weight: bold; font-size: 1.1rem;">
					R$ 58,90 <span style="font-size: 0.8rem;">no pix</span>
				</p>
				<p style="color: #666; font-size: 0.8rem;">ou 1x de R$ 55,00 no
					cartão</p>
				<button
					style="margin-top: 10px; background: #1db954; border: none; color: white; padding: 8px 0; width: 100%; border-radius: 8px; font-weight: bold;">ADICIONAR</button>
			</div>

			<div
				style="background: white; width: 200px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); position: relative; padding: 10px 15px; text-align: center;">
				<div
					style="position: absolute; top: 10px; left: 10px; background: #ffcc00; color: #333; padding: 3px 8px; font-weight: bold; border-radius: 4px; font-size: 0.8rem;">33%</div>
				<img src="img/foto5.png" alt="Produto 3"
					style="height: 100px; margin: 30px auto 10px; display: block;">
				<h4 style="font-size: 0.95rem;">Actine Gel Para Limpeza 140gr
					Oleosa E Acneica Pump</h4>
				<p style="color: #999; text-decoration: line-through;">R$ 59,90</p>
				<p style="color: #e60000; font-weight: bold; font-size: 1.1rem;">
					R$ 39,90 <span style="font-size: 0.8rem;">no pix</span>
				</p>
				<p style="color: #666; font-size: 0.8rem;">Ultimos estoques!</p>
				<button
					style="margin-top: 10px; background: #1db954; border: none; color: white; padding: 8px 0; width: 100%; border-radius: 8px; font-weight: bold;">ADICIONAR</button>
			</div>
	</section>
	<div class="destaque">
		<h2>Medicamentos em Destaque</h2>
		<p>Conheça nossos produtos mais vendidos</p>
		<div class="ver-todos">
			<a href="#">Ver todos →</a>
		</div>
	</div>

	<main style="padding: 40px; background: #fff; color: #333;">
		<h2 style="text-align: center;">Medicamentos Cadastrados</h2>
		<div
			style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; margin-top: 20px;">
			<%
			if (lista != null && !lista.isEmpty()) {
				for (Medicamentos m : lista) {
			%>
			<a
				href="detalhes.jsp?nome=<%=java.net.URLEncoder.encode(m.getNomeComercial(), "UTF-8")%>"
				style="text-decoration: none; color: inherit;">
				<div class="card">
					<img class="card-img-top" src="img/<%=m.getImagem()%>"
						alt="<%=m.getNomeComercial()%>">

					<h3 class="card-title"><%=m.getNomeComercial()%></h3>
					<p class="descricao"><%=m.getDescricao()%></p>
					<p class="preco">
						R$
						<%=String.format("%.2f", m.getPreco())%>
					</p>

					<%
					if (usuario != null) {
					%>
					<p style="font-size: 0.9rem;"><%=m.getPrincipioAtivo()%></p>
					<div class="botoes-acao">
						<form action="editar.jsp" method="get">
							<input type="hidden" name="nome"
								value="<%=m.getNomeComercial()%>">
							<button type="submit" class="botao editar">Editar</button>
						</form>

						<form action="RemoverMedicamentoServlet" method="post">
							<input type="hidden" name="nomeComercial"
								value="<%=m.getNomeComercial()%>">
							<button type="submit" class="botao excluir">Excluir</button>
						</form>
					</div>
			</a>

			<%
			}
			%>


		</div>
		<%
		}
		} else {
		%>
		<p style="text-align: center;">Nenhum medicamento cadastrado
			ainda.</p>
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

	<script src="script.js"></script>
</body>
</html>