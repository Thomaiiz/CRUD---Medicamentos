package br.edu.ifsp.model;

public class Usuario {
	
	public static final String Usuario = "Usuario";
	public static final String Avaliador = "Avaliador";
	
	private String email;
	private String senha;
	private String nome;
	private String perfil;
	
	public Usuario() {
		super();
	}

	public Usuario(String nome, String perfil) {
		this.nome = nome;
		this.perfil = perfil;
	}

	public Usuario(String email, String senha,String nome,String perfil) {
		super();
		this.email = email;
		this.senha = senha;
		this.nome = nome;
		this.perfil = perfil;
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	
}
