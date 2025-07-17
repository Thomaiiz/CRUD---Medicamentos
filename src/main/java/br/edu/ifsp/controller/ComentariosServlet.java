	package br.edu.ifsp.controller;
	
	import java.io.IOException;
	import java.util.List;
	
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import com.google.gson.Gson;
	
	import br.edu.ifsp.dao.ComentarioDAO;
	import br.edu.ifsp.model.Comentario;
	
	/**
	 * Servlet implementation class ComentarioServlet
	 */
	@WebServlet("/ComentariosServlet")
	public class ComentariosServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;
	  private final ComentarioDAO dao = new ComentarioDAO();
	  private final Gson gson = new Gson();
	
	  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	                        throws ServletException, IOException {
	        String nomeMedicamento = req.getParameter("nome");
	        
	        ComentarioDAO dao = new ComentarioDAO();
	        List<Comentario> lista = dao.getComentarios(nomeMedicamento);
	        
	        String json = gson.toJson(lista);
	        resp.setContentType("application/json;charset=UTF-8");
	        resp.getWriter().write(json);
	    }
	
	
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}
	
	}
