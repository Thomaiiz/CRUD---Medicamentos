package br.edu.ifsp.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import br.edu.ifsp.model.Medicamentos;

@WebServlet("/EditarMedicamentoServlet")
public class EditarMedicamento extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("usuarioLogado") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String originalNome = request.getParameter("originalNome");
        String nomeComercial = request.getParameter("nomeComercial");
        String principioAtivo = request.getParameter("principioAtivo");
        String fabricante = request.getParameter("fabricante");
        String dataStr = request.getParameter("dataValidade");
        String lote = request.getParameter("lote");
        String dosagem = request.getParameter("dosagem");
        String formaFarmaceutica = request.getParameter("formaFarmaceutica");

        LocalDate dataValidade = LocalDate.parse(dataStr);

        ArrayList<Medicamentos> lista = (ArrayList<Medicamentos>) getServletContext().getAttribute("lista");

        if (lista != null) {
            for (Medicamentos m : lista) {
                if (m.getNomeComercial().equalsIgnoreCase(originalNome)) {
                    m.setNomeComercial(nomeComercial);
                    m.setPrincipioAtivo(principioAtivo);
                    m.setFabricante(fabricante);
                    m.setDataValidade(dataValidade);
                    m.setLote(lote);
                    m.setDosagem(dosagem);
                    m.setFormaFarmaceutica(formaFarmaceutica);
                    break;
                }
            }
        }

        response.sendRedirect("index.jsp");
    }
}
