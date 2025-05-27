// RegistrarUsuarioServlet.java
package br.edu.ifsp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.dao.DAO;
import br.edu.ifsp.model.Usuario;

@WebServlet("/RegistrarUsuarioServlet")
public class CadastroUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String nome = request.getParameter("nome");
        
        if(email == null || email.isEmpty() || senha == null || senha.isEmpty() || nome.isEmpty() || nome == null ){
            response.sendRedirect("registro.jsp?erro=1"); 
            return;
        }
        
        if(DAO.existeUsuario(email)) {
            response.sendRedirect("registro.jsp?erro=2"); 
            return;
        }
        
        Usuario novoUsuario = new Usuario(email, senha, nome);
        DAO.adicionarUsuario(novoUsuario);
        
        response.sendRedirect("login.jsp?sucesso=1");
    }
}