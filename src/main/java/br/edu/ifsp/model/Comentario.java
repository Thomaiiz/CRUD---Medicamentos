package br.edu.ifsp.model;

public class Comentario {
	
	private String nomeMedicamento;
	private String nomeAvaliador;
	private String comentario;
	private int nota;
	
	public Comentario() {
		super();
	}

	public Comentario(String nomeMedicamento, String nomeAvaliador, String comentario, int nota) {
		super();
		this.nomeMedicamento = nomeMedicamento;
		this.nomeAvaliador = nomeAvaliador;
		this.comentario = comentario;
		this.nota = nota;
	}
	
	public String getNomeMedicamento() {
		return nomeMedicamento;
	}
	public void setNomeMedicamento(String nomeMedicamento) {
		this.nomeMedicamento = nomeMedicamento;
	}
	public String getNomeAvaliador() {
		return nomeAvaliador;
	}
	public void setNomeAvaliador(String nomeAvaliador) {
		this.nomeAvaliador = nomeAvaliador;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public int getNota() {
		return nota;
	}
	public void setNota(int nota) {
		this.nota = nota;
	}

}
