package br.edu.ifsp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsp.dao.MedicamentoDAO;
import br.edu.ifsp.model.Medicamentos;

@WebServlet("/EditarMedicamentoServlet")
public class EditarMedicamentoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);
    	if (session == null || session.getAttribute("usuarioLogado") == null) {
    	    response.sendRedirect("erro.jsp");
    	    return;
    	}

        String nomeOriginal = request.getParameter("originalNome"); 

        MedicamentoDAO dao = new MedicamentoDAO();
        Medicamentos original = null;

        for (Medicamentos m : dao.getMedicamentos()) {
            if (m.getNomeComercial().equalsIgnoreCase(nomeOriginal)) {
                original = m;
                break;
            }
        }

        if (original == null) {
            response.sendRedirect("erro.jsp"); 
            return;
        }

        Medicamentos atualizado = new Medicamentos();
        atualizado.setNomeComercial(original.getNomeComercial()); 

        atualizado.setPrincipioAtivo(request.getParameter("principioAtivo"));
        atualizado.setFabricante(request.getParameter("fabricante"));
        atualizado.setDataValidade(request.getParameter("dataValidade"));
        atualizado.setLote(request.getParameter("lote"));
        atualizado.setDosagem(request.getParameter("dosagem"));
        atualizado.setFormaFarmaceutica(request.getParameter("formaFarmaceutica"));

        atualizado.setImagem(original.getImagem());
        atualizado.setDescricao(original.getDescricao());
        atualizado.setPreco(original.getPreco());

        dao.atualizarMedicamento(nomeOriginal, atualizado);
        
        List<Medicamentos> novaLista = dao.getMedicamentos();
        getServletContext().setAttribute("lista", novaLista);

        response.sendRedirect("index.jsp");
    }
}
