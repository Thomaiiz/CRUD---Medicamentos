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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getSession().getAttribute("usuarioLogado") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
	 
		String nomeComercial = request.getParameter("nomeComercial");
		MedicamentoDAO dao = new MedicamentoDAO();
		dao.removerMedicamento(nomeComercial);
		response.sendRedirect("CarregarMedicamentos");

	}

}
