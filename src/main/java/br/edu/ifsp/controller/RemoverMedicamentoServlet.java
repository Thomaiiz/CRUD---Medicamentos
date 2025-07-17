package br.edu.ifsp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.dao.MedicamentoDAO;

/**
 * Servlet implementation class RemoverMedicamento
 */
@WebServlet("/RemoverMedicamentoServlet")
public class RemoverMedicamentoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoverMedicamentoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String acao = request.getParameter("acao");

	    if ("remover".equalsIgnoreCase(acao)) {
	        String nomeComercial = request.getParameter("nomeComercial");

	        MedicamentoDAO dao = new MedicamentoDAO();
	        boolean sucesso = dao.removerMedicamento(nomeComercial); 

	        if (sucesso) {
	            response.setStatus(HttpServletResponse.SC_OK);
	            response.getWriter().write("Removido com sucesso.");
	        } else {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Medicamento não encontrado.");
	        }
	    } else {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação inválida.");
	    }
	}


}
