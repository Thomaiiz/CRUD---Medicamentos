package br.edu.ifsp.dao;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import com.google.gson.Gson;
import br.edu.ifsp.model.Comentario;

public class ComentarioDAO {
    private static final File ARQUIVO = new File("/home/thomaz/Documentos/workspace-java/comentarios.json");
    private final Gson gson = new Gson();

    public List<Comentario> getComentarios(String nomeMedicamento) {
        List<Comentario> lista = new ArrayList<>();
        if (!ARQUIVO.exists()) return lista;

        try (BufferedReader br = new BufferedReader(
                 new InputStreamReader(
                     new FileInputStream(ARQUIVO),
                     StandardCharsets.UTF_8))) {

            String linha;
            while ((linha = br.readLine()) != null) {
                Comentario c = gson.fromJson(linha, Comentario.class);
                if (c.getNomeMedicamento().equalsIgnoreCase(nomeMedicamento)) {
                    lista.add(c);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void salvar(Comentario c) {
        try (PrintWriter pw = new PrintWriter(
                new OutputStreamWriter(
                    new FileOutputStream(ARQUIVO, true),
                    StandardCharsets.UTF_8),
                true)) {
            pw.println(gson.toJson(c));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    
}
