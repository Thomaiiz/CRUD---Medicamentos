document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("formEditarMedicamento");
  const msg = document.getElementById("mensagem");

  const params = new URLSearchParams(window.location.search);
  const nome = params.get("nome");

  if (!nome) {
    msg.textContent = "Medicamento não especificado.";
    form.style.display = "none";
    return;
  }

  fetch("MedicamentosServlet")
    .then(res => res.json())
    .then(lista => {
      const m = lista.find(x => x.nomeComercial === nome);
      if (!m) {
        msg.textContent = "Medicamento não encontrado.";
        form.style.display = "none";
        return;
      }

      form.nomeComercial.value = m.nomeComercial;
      form.nomeComercialTexto.value = m.nomeComercial;
      form.principioAtivo.value = m.principioAtivo;
      form.fabricante.value = m.fabricante;
      form.dataValidade.value = m.dataValidade;
      form.lote.value = m.lote;
      form.dosagem.value = m.dosagem;
      form.formaFarmaceutica.value = m.formaFarmaceutica;
      form.categoria.value = m.categoria;
    });

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    form.nomeComercial.value = form.nomeComercialTexto.value;

    const fd = new FormData(form);

    for (const [key, value] of fd.entries()) {
      console.log(`${key}: ${value}`);
    }

    fetch("EditarMedicamentoServlet", {
      method: "POST",
      body: fd
    })
      .then(res => {
        if (res.ok) return res.text();
        return res.text().then(t => { throw new Error(t); });
      })
      .then(texto => {
        msg.style.color = "green";
        msg.textContent = texto;
		setTimeout(() => {
		  window.location.href = "index.html";
		}, 1500);
      })
      .catch(err => {
        msg.style.color = "red";
        msg.textContent = "Erro: " + err.message;
      });
	  
	  
	  
	  
  });
});
