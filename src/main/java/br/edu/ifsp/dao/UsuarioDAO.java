package br.edu.ifsp.dao;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.google.gson.Gson;

import br.edu.ifsp.model.Usuario;

public class UsuarioDAO {
	
	public boolean adicionarUsuario(Usuario u) {
		
		Gson gson = new Gson();
		
		try {
			FileWriter fw = new FileWriter("/home/thomaz/Documentos/workspace-java/usuarios.json",StandardCharsets.UTF_8,true);
			PrintWriter pw = new PrintWriter(fw);
			String json = gson.toJson(u);
			pw.println(json);
			pw.close();
		}
		catch(IOException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public List<Usuario> getUsuarios() {
		File arquivo = new File("/home/thomaz/Documentos/workspace-java/usuarios.json");
		List<Usuario> lista = new ArrayList<>();
		Gson gson = new Gson();
		
		try(Scanner sc = new Scanner(arquivo)){
			while(sc.hasNextLine()) {
				String linha = sc.nextLine();
				Usuario u = gson.fromJson(linha, Usuario.class);
				lista.add(u);
			}
		}
		catch(FileNotFoundException e) {
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public Usuario buscarUsuario(String email, String senha) {
		List<Usuario> lista = getUsuarios();
		
		for(Usuario u: lista) {
			if(u.getEmail().equals(email) && u.getSenha().equals(senha)) {
				return u;
			}
		}
		
		return null;
		
	}
	
	public boolean buscarPorEmail(String email) {
		List<Usuario> lista = getUsuarios();
		for(Usuario u: lista) {
			if(u.getEmail().equals(email)) {
				return true;
			}
		}
		
		return false;
	}
    
}