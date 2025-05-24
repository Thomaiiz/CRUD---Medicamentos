<form action="MedicamentosServlet" method="post" enctype="multipart/form-data">
    <input type="text" name="nomeComercial" placeholder="Nome Comercial" />
    <input type="text" name="principioAtivo" placeholder="Princípio Ativo" />
    <input type="text" name="fabricante" placeholder="Fabricante" />
    <input type="date" name="dataValidade" />
    <input type="text" name="lote" placeholder="Lote" />
    <input type="text" name="dosagem" placeholder="Dosagem" />
    <input type="text" name="formaFarmaceutica" placeholder="Forma Farmacêutica" />
    <input type="file" name="imagem" />
    <button type="submit">Cadastrar</button>
</form>
