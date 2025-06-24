package br.edu.ifsp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.dao.MedicamentoDAO;
import br.edu.ifsp.model.Medicamentos;

@WebServlet("/CarregarMedicamentos")
public class CarregarMedicamentosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MedicamentoDAO dao = new MedicamentoDAO();
		List<Medicamentos> lista = dao.getMedicamentos();

		getServletContext().setAttribute("lista", lista);

		response.sendRedirect("index.jsp");
	}
}
