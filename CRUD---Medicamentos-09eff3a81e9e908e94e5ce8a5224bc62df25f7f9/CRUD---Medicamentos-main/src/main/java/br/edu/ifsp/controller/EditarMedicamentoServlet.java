package br.edu.ifsp.controller;

import br.edu.ifsp.dao.MedicamentoDAO;
import br.edu.ifsp.model.Medicamentos;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

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

        response.sendRedirect("index.jsp");
    }
}
