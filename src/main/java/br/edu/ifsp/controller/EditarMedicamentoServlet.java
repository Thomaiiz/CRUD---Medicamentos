package br.edu.ifsp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.dao.MedicamentoDAO;
import br.edu.ifsp.model.Medicamentos;

@MultipartConfig
@WebServlet("/EditarMedicamentoServlet")

public class EditarMedicamentoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	

        String acao = request.getParameter("acao");
        if (!"editar".equalsIgnoreCase(acao)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação inválida.");
            return;
        }

        String originalNome = request.getParameter("nomeComercial"); 

        MedicamentoDAO dao = new MedicamentoDAO();
        Medicamentos existente = dao.buscarPorNome(originalNome);
        if (existente == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Medicamento não encontrado.");
            return;
        }

        String principioAtivo = request.getParameter("principioAtivo");
        String fabricante = request.getParameter("fabricante");
        String dataValidade = request.getParameter("dataValidade");
        String lote = request.getParameter("lote");
        String dosagem = request.getParameter("dosagem");
        String formaFarmaceutica = request.getParameter("formaFarmaceutica");

        Medicamentos atualizado = new Medicamentos(
            originalNome,
            principioAtivo,
            fabricante,
            dataValidade,
            lote,
            dosagem,
            formaFarmaceutica
        );

        dao.atualizarMedicamento(originalNome, atualizado);

        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write("Medicamento atualizado com sucesso!");
    }
}


