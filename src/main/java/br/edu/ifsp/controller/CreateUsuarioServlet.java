package br.edu.ifsp.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.dao.UsuarioDAO;
import br.edu.ifsp.model.Usuario;

@WebServlet("/RegistrarUsuarioServlet")
public class CreateUsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome   = request.getParameter("nome");
        String email  = request.getParameter("email");
        String senha  = request.getParameter("senha");
        String perfil = request.getParameter("perfil");

        if (nome == null || email == null || senha == null || perfil == null ||
            nome.isBlank() || email.isBlank() || senha.isBlank() || perfil.isBlank()) {

            String msg = URLEncoder.encode("Preencha todos os campos.", StandardCharsets.UTF_8);
            response.sendRedirect("registro.html?erro=" + msg);
            return;
        }

        if (dao.buscarPorEmail(email)) {
            String msg = URLEncoder.encode("Este e‑mail já está cadastrado.", StandardCharsets.UTF_8);
            response.sendRedirect("registro.html?erro=" + msg);
            return;
        }

        Usuario u = new Usuario(email, senha, nome, perfil);
        boolean ok = dao.adicionarUsuario(u);

        if (ok) {
            response.sendRedirect("login.html");
        } else {
            String msg = URLEncoder.encode("Erro interno. Tente novamente.", StandardCharsets.UTF_8);
            response.sendRedirect("registro.html?erro=" + msg);
        }
    }
}
