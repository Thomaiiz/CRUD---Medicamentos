	package br.edu.ifsp.controller;
	
	import java.io.IOException;
	
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import com.google.gson.Gson;
	
	import br.edu.ifsp.model.Usuario;
	
	/**
	 * Servlet implementation class SessionServlet
	 */
	@WebServlet("/SessionServlet")
	public class SessionServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	
		/**
		 * @see HttpServlet#HttpServlet()
		 */
		public SessionServlet() {
			super();
			// TODO Auto-generated constructor stub
		}
	
		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
		 *      response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
	
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
	
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
	
			Gson gson = new Gson();
			if (usuario != null) {
				String json = gson.toJson(usuario);
				response.getWriter().write(json);
			} else {
				response.getWriter().write("{}");
			}
	
		}
	
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
		 *      response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}
	
	}
