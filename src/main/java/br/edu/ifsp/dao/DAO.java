package br.edu.ifsp.dao;

import java.util.ArrayList;
import java.util.List;

import br.edu.ifsp.model.Usuario;

public class DAO {
    private static List<Usuario> usuarios = new ArrayList<>();

    static {
        usuarios.add(new Usuario("admin@farmcontrol.com", "123456"));
        usuarios.add(new Usuario("usuario@farmcontrol.com", "senha"));
    }

    public static boolean validar(String email, String senha) {
        for (Usuario u : usuarios) {
            if (u.getLogin().equals(email) && u.getSenha().equals(senha)) {
                return true;
            }
        }
        return false;
    }
}
