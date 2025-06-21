// RegistrarUsuarioServlet.java
package br.edu.ifsp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.dao.UsuarioDAO;
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
        
        UsuarioDAO dao = new UsuarioDAO();
        
        if(dao.buscarPorEmail(email) == true) {
            response.sendRedirect("registro.jsp?erro=2"); 
            return;
        }
        
        Usuario u = new Usuario(email,senha,nome);
        boolean sucesso = dao.adicionarUsuario(u);
        
        if(sucesso != false) {
        	response.sendRedirect("login.jsp?sucesso=1");
        }else {
        	response.sendRedirect("registro.jsp?erro=2");
        }
    }
}