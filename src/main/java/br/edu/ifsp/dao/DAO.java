package br.edu.ifsp.dao;

import java.util.ArrayList;
import java.util.List;

import br.edu.ifsp.model.Usuario;

public class DAO {
    private static List<Usuario> usuarios = new ArrayList<>();
    
    static {
        usuarios.add(new Usuario("admin@farmcontrol.com", "admin123", "Administrador"));
    }
    
    public static boolean existeUsuario(String email) {
        return usuarios.stream().anyMatch(u -> u.getEmail().equals(email));
    }
    
    public static void adicionarUsuario(Usuario usuario) {
        usuarios.add(usuario);
    }
    
    public static Usuario buscarPorEmail(String email) {
        return usuarios.stream()
            .filter(u -> u.getEmail().equals(email))
            .findFirst()
            .orElse(null);
    }

    public static boolean validar(String email, String senha) {
        for (Usuario u : usuarios) {
            if (u.getEmail().equals(email) && u.getSenha().equals(senha)) {
                return true;
            }
        }
        return false;
    }
    
}
