package br.edu.ifsp.controller;

import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.edu.ifsp.model.Medicamentos;

/**
 * Servlet implementation class MedicamentosServlet
 */

@MultipartConfig
@WebServlet("/MedicamentosServlet")
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 if (request.getSession().getAttribute("usuarioLogado") == null) {
             response.sendRedirect("login.jsp");
             return;
         }
			
		 String nomeComercial = request.getParameter("nomeComercial");
		 String principioAtivo = request.getParameter("principioAtivo");
		 String fabricante = request.getParameter("fabricante");
		 String dataStr = request.getParameter("dataValidade");
		 String lote = request.getParameter("lote");
		 String dosagem = request.getParameter("dosagem");
		 String formaFarmaceutica = request.getParameter("formaFarmaceutica");	
		 LocalDate dataValidade = LocalDate.parse(dataStr);
		 Part imagemPart = request.getPart("imagem");
	     String nomeImagem = Paths.get(imagemPart.getSubmittedFileName()).getFileName().toString();
	     
	     String caminhoUpload = getServletContext().getRealPath("/img");
	     imagemPart.write(caminhoUpload + "/" + nomeImagem);
		 
		 if (nomeComercial.isEmpty() || principioAtivo.isEmpty() || dataStr.isEmpty() || fabricante.isEmpty() || lote.isEmpty() || dosagem.isEmpty() || formaFarmaceutica.isEmpty() || nomeImagem.isEmpty()) {
				String msg = "Nenhum campo pode ser vazio";	
				getServletContext().setAttribute("mensagem", msg);
				getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			
			} else {
				
				ArrayList<Medicamentos> lista = (ArrayList<Medicamentos>) getServletContext().getAttribute("lista");
				
				if(lista == null) {
					lista = new ArrayList<Medicamentos>();
				}
				
				Medicamentos medicamento = new Medicamentos(nomeComercial,principioAtivo,fabricante,dataValidade,lote,dosagem,formaFarmaceutica,nomeImagem);

				lista.add(medicamento);
				
				getServletContext().setAttribute("lista", lista);

				getServletContext().getRequestDispatcher("/resposta.jsp").forward(request, response);
			}
	}
}
