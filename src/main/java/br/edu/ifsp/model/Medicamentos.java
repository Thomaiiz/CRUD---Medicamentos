package br.edu.ifsp.model;

import java.io.Serializable;

public class Medicamentos implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String nomeComercial;
	private String principioAtivo;
	private String fabricante;
	private String dataValidade;
	private String lote;
	private String dosagem;
	private String formaFarmaceutica;
	private String imagem;
	private String categoria;
	
	public Medicamentos() {
		
	}
	
	public Medicamentos(String nomeComercial, String principioAtivo, String fabricante, String dataValidade,
			String lote, String dosagem, String formaFarmaceutica,String imagem,String categoria) {
		super();
		this.nomeComercial = nomeComercial;
		this.principioAtivo = principioAtivo;
		this.fabricante = fabricante;
		this.dataValidade = dataValidade;
		this.lote = lote;
		this.dosagem = dosagem;
		this.formaFarmaceutica = formaFarmaceutica;
		this.imagem = imagem;
		this.categoria = categoria;
	}
	
	public Medicamentos(String nomeComercial, String principioAtivo, String fabricante, String dataValidade,
			String lote, String dosagem, String formaFarmaceutica) {
		super();
		this.nomeComercial = nomeComercial;
		this.principioAtivo = principioAtivo;
		this.fabricante = fabricante;
		this.dataValidade = dataValidade.toString();
		this.lote = lote;
		this.dosagem = dosagem;
		this.formaFarmaceutica = formaFarmaceutica;

	}

	public String getNomeComercial() {
		return nomeComercial;
	}

	public void setNomeComercial(String nomeComercial) {
		this.nomeComercial = nomeComercial;
	}

	public String getPrincipioAtivo() {
		return principioAtivo;
	}

	public void setPrincipioAtivo(String principioAtivo) {
		this.principioAtivo = principioAtivo;
	}

	public String getFabricante() {
		return fabricante;
	}

	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public String getDataValidade() {
		return dataValidade;
	}

	public void setDataValidade(String dataValidade) {
		this.dataValidade = dataValidade;
	}

	public String getLote() {
		return lote;
	}

	public void setLote(String lote) {
		this.lote = lote;
	}

	public String getDosagem() {
		return dosagem;
	}

	public void setDosagem(String dosagem) {
		this.dosagem = dosagem;
	}

	public String getFormaFarmaceutica() {
		return formaFarmaceutica;
	}

	public void setFormaFarmaceutica(String formaFarmaceutica) {
		this.formaFarmaceutica = formaFarmaceutica;
	}
	

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
}