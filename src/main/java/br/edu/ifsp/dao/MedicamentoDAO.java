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

import br.edu.ifsp.model.Medicamentos;

public class MedicamentoDAO {
	
	public boolean adicionarMedicamento(Medicamentos m) {
		Gson gson = new Gson();
		List<Medicamentos> lista = getMedicamentos();
		
		for(Medicamentos remedio: lista) {
			if(remedio.getNomeComercial() != null && remedio.getNomeComercial().equalsIgnoreCase(m.getNomeComercial())) {
				return false;
			}
		}
		
		
		try {
			FileWriter fw = new FileWriter("/home/thomaz/Documentos/workspace-java/medicamentos.json",StandardCharsets.UTF_8,true);
			PrintWriter pw = new PrintWriter(fw);
			String json = gson.toJson(m);
			pw.println(json);
			pw.close();
		}
		catch(IOException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public List<Medicamentos> getMedicamentos(){
		
		File arquivo = new File("/home/thomaz/Documentos/workspace-java/medicamentos.json");
		List<Medicamentos> lista = new ArrayList<>();
		Gson gson = new Gson();
		
		try(Scanner sc = new Scanner(arquivo)){
			while(sc.hasNextLine()) {
				String linha = sc.nextLine();
				Medicamentos m = gson.fromJson(linha, Medicamentos.class);
				lista.add(m);
				
			}
		}
		catch(FileNotFoundException e){
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public boolean buscarMedicamento(String nomeComercial) {
		List<Medicamentos> lista = getMedicamentos();
		for(Medicamentos m: lista) {
			if(m.getNomeComercial().equals(nomeComercial)) {
				return true;
			}
		}
		
		return false;
	}
	
	public void atualizarMedicamento(String originalNome,Medicamentos medicamento) {
		
		Gson gson = new Gson();
		
		try {
			File arquivo = new File("/home/thomaz/Documentos/workspace-java/medicamentos.json");
			List<Medicamentos> lista = getMedicamentos();
			
			for(Medicamentos m: lista) {
				if(m.getNomeComercial().equalsIgnoreCase(originalNome)) {
					m.setPrincipioAtivo(medicamento.getPrincipioAtivo());
					m.setFabricante(medicamento.getFabricante());
					m.setDataValidade(medicamento.getDataValidade());
					m.setLote(medicamento.getLote());
					m.setDosagem(medicamento.getDosagem());
					m.setFormaFarmaceutica(medicamento.getFormaFarmaceutica());
					break;
				}
			}
			
			PrintWriter pw = new PrintWriter("/home/thomaz/Documentos/workspace-java/medicamentos.json");
			for (Medicamentos m : lista) {
			    pw.println(gson.toJson(m));
			}
			pw.close();

		}
		catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean removerMedicamento(String nomeComercial) {
	    Gson gson = new Gson();
	    File arquivo = new File("/home/thomaz/Documentos/workspace-java/medicamentos.json");

	    try {
	        List<Medicamentos> lista = getMedicamentos();

	        lista.removeIf(m -> m.getNomeComercial().equalsIgnoreCase(nomeComercial));

	        PrintWriter pw = new PrintWriter("/home/thomaz/Documentos/workspace-java/medicamentos.json");
	        for (Medicamentos m : lista) {
	            pw.println(gson.toJson(m));
	        }
	        pw.close();
	        
	        return true;

	    } catch (IOException e) {
	        e.printStackTrace();
	    }
		return false;
	}

	
	public Medicamentos buscarPorNome(String nomeComercial) {
	    List<Medicamentos> lista = getMedicamentos();
	    for (Medicamentos m : lista) {
	        if (m.getNomeComercial() != null && m.getNomeComercial().equalsIgnoreCase(nomeComercial)) {
	            return m;
	        }
	    }
	    return null;
	}
	
	public List<Medicamentos> getMedicamentosPorCategoria(String categoria) {
	    List<Medicamentos> filtrados = new ArrayList<>();
	    if (categoria == null || categoria.isEmpty()) {
	        return getMedicamentos();
	    }
	    for (Medicamentos m : getMedicamentos()) {
	        if (m.getCategoria() != null 
	            && m.getCategoria().equalsIgnoreCase(categoria)) {
	            filtrados.add(m);
	        }
	    }
	    return filtrados;
	}


}