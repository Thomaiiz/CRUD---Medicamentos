package br.edu.ifsp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.dao.ComentarioDAO;
import br.edu.ifsp.model.Comentario;
import br.edu.ifsp.model.Usuario;

/**
 * Servlet implementation class SalvaComentario
 */
@WebServlet("/SalvaComentario")
public class SalvaComentario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalvaComentario() {
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
		
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
        if (usuario == null || usuario.getPerfil() == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Faça login para comentar.");
            return;
        }

        String nomeMedicamento = request.getParameter("nome");
        String texto = request.getParameter("texto");
        int nota = Integer.parseInt(request.getParameter("nota")); 

        Comentario comentario = new Comentario(
            nomeMedicamento,
            usuario.getNome(),
            texto,
            nota
        );

        ComentarioDAO dao = new ComentarioDAO();
        dao.salvar(comentario);

        response.setStatus(HttpServletResponse.SC_OK);
    }
}
