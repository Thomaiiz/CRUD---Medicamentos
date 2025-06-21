package br.edu.ifsp.dao;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.google.gson.Gson;

import br.edu.ifsp.model.Usuario;

public class UsuarioDAO {
	
	public boolean adicionarUsuario(Usuario u) {
		
		try {
<<<<<<< HEAD
			FileWriter fw = new FileWriter("/home/thomaz/Documentos/usuarios.json",true);
=======
			FileWriter fw = new FileWriter("E:/Downloads/usuarios.json",true);
>>>>>>> ca8d6607dc8d045c1a8606db8f800a5220c96619
			PrintWriter pw = new PrintWriter(fw);
			Gson gson = new Gson();
			String json = gson.toJson(u);
			pw.println(json);
			pw.close();
			return true;
		}
		catch(IOException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<Usuario> getUsuarios() {
<<<<<<< HEAD
		File arquivo = new File("/home/thomaz/Documentos/usuarios.json");
=======
		File arquivo = new File("E:/Downloads/usuarios.json");
>>>>>>> ca8d6607dc8d045c1a8606db8f800a5220c96619
		List<Usuario> lista = new ArrayList<>();
		Gson gson = new Gson();
		
		try(Scanner sc = new Scanner(arquivo)){
			while(sc.hasNextLine()) {
				String linha = sc.nextLine();
<<<<<<< HEAD
				Usuario u = gson.fromJson(linha, Usuario.class);
=======
				Usuario u = gson.fromJson("linha", Usuario.class);
>>>>>>> ca8d6607dc8d045c1a8606db8f800a5220c96619
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
<<<<<<< HEAD
			if(u.getEmail().equals(email) && u.getSenha().equals(senha)) {
=======
			if(u.getEmail().equals(email) && u.getSenha().equals(lista)) {
>>>>>>> ca8d6607dc8d045c1a8606db8f800a5220c96619
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
