package br.edu.ifsp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsp.dao.DAO;
import br.edu.ifsp.model.Usuario;

@WebServlet("/UsuarioLogin")
public class UsuarioLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UsuarioLoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if (DAO.validar(email, senha)) {
            Usuario usuario = DAO.buscarPorEmail(email); // pega o objeto Usuario completo
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario); // salva o objeto na sessão
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp?erro=1");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
