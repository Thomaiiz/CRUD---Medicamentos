package br.edu.ifsp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import br.edu.ifsp.dao.MedicamentoDAO;
import br.edu.ifsp.model.Medicamentos;
import br.edu.ifsp.model.Usuario;

/**
 * Servlet implementation class MedicamentosServlet
 */


@WebServlet("/MedicamentosServlet")
@MultipartConfig

public class MedicamentosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MedicamentosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MedicamentoDAO dao = new MedicamentoDAO();
		
		
	    List<Medicamentos> lista = dao.getMedicamentos();
	    
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    PrintWriter out = response.getWriter();
	    Gson gson = new Gson(); 
	    out.print(gson.toJson(lista));
	    out.flush();	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Usuario u = (Usuario) request.getSession().getAttribute("usuarioLogado");

		if (u == null || Usuario.Avaliador.equals(u.getPerfil())) {
		    response.sendRedirect("acessoNegado.html");
		    return;
		}

		String nomeComercial = request.getParameter("nomeComercial");
		String principioAtivo = request.getParameter("principioAtivo");
		String fabricante = request.getParameter("fabricante");
		String dataStr = request.getParameter("dataValidade");
		String lote = request.getParameter("lote");
		String dosagem = request.getParameter("dosagem");
		String formaFarmaceutica = request.getParameter("formaFarmaceutica");
		String categoria = request.getParameter("categoria");
		String dataValidade = request.getParameter("dataValidade");
		Part imagemPart = request.getPart("imagem");
		String nomeImagem = "";

		if (imagemPart != null && imagemPart.getSize() > 0) {
		    nomeImagem = Paths.get(imagemPart.getSubmittedFileName()).getFileName().toString();
		    String caminhoUpload = getServletContext().getRealPath("/img");
		    imagemPart.write(caminhoUpload + "/" + nomeImagem);
		}

		if (nomeComercial.isEmpty() || principioAtivo.isEmpty() || dataStr.isEmpty() || fabricante.isEmpty()
				|| lote.isEmpty() || dosagem.isEmpty() || formaFarmaceutica.isEmpty()
				|| nomeImagem.isEmpty() || categoria.isEmpty() ) {

			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Nenhum campo pode ser vazio");
			return;
		}

		Medicamentos medicamento = new Medicamentos(nomeComercial, principioAtivo, fabricante, dataValidade, lote, dosagem, formaFarmaceutica, nomeImagem,	categoria);
		MedicamentoDAO dao = new MedicamentoDAO();
		boolean sucesso = dao.adicionarMedicamento(medicamento);
		
		if(sucesso != false) {
			System.out.println("Medicamento ja cadastrado.");
		}
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("Medicamento cadastrado com sucesso!");
	}
}
