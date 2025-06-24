package br.edu.ifsp.model;

import java.io.Serializable;
import java.time.LocalDate;

public class Medicamentos implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String nomeComercial;
	private String principioAtivo;
	private String fabricante;
	private LocalDate dataValidade;
	private String lote;
	private String dosagem;
	private String formaFarmaceutica;
	private String imagem;
	private String descricao;
	private double preco;

	
	public Medicamentos(String nomeComercial, String principioAtivo, String fabricante, LocalDate dataValidade,
			String lote, String dosagem, String formaFarmaceutica,String imagem,String descricao,double preco) {
		super();
		this.nomeComercial = nomeComercial;
		this.principioAtivo = principioAtivo;
		this.fabricante = fabricante;
		this.dataValidade = dataValidade;
		this.lote = lote;
		this.dosagem = dosagem;
		this.formaFarmaceutica = formaFarmaceutica;
		this.imagem = imagem;
		this.descricao = descricao;
		this.preco = preco;
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

	public LocalDate getDataValidade() {
		return dataValidade;
	}

	public void setDataValidade(LocalDate dataValidade) {
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
	
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
