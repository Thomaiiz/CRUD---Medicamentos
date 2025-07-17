let nomeMedicamento = "";

document.addEventListener("DOMContentLoaded", () => {
  const params = new URLSearchParams(window.location.search);
  nomeMedicamento = params.get("nome");
  if (!nomeMedicamento) {
    alert("Nome do medicamento não informado.");
    return;
  }
  carregarDetalhes();
  carregarComentarios();
  verificarPermissaoComentario();
});

function carregarDetalhes() {
  fetch("MedicamentosServlet")
    .then(r => r.json())
    .then(lista => {
      const med = lista.find(m => m.nomeComercial === nomeMedicamento);
      if (!med) throw new Error("Medicamento não encontrado");

      document.getElementById("med-img").src = `img/${med.imagem}`;
      document.getElementById("med-img").alt = med.nomeComercial;
      document.getElementById("med-nome").textContent = med.nomeComercial;

      const ul = document.getElementById("med-detalhes");
      ul.innerHTML = `
        <li><span>Princípio Ativo:</span><span>${med.principioAtivo}</span></li>
        <li><span>Fabricante:</span><span>${med.fabricante}</span></li>
        <li><span>Categoria:</span><span>${med.categoria}</span></li>
        <li><span>Dosagem:</span><span>${med.dosagem}</span></li>
        <li><span>Forma Farmacêutica:</span><span>${med.formaFarmaceutica}</span></li>
        <li><span>Validade:</span><span>${med.dataValidade}</span></li>
        <li><span>Lote:</span><span>${med.lote}</span></li>
      `;
    })
    .catch(err => {
      console.error(err);
      document.querySelector(".product-info").innerHTML =
        `<p style="color:red;">${err.message}</p>`;
    });
}

function carregarComentarios() {
  fetch(`ComentariosServlet?nome=${encodeURIComponent(nomeMedicamento)}`, {
    credentials: "same-origin"
  })
    .then(r => {
      if (!r.ok) throw new Error("falha ao carregar comentários");
      return r.json();
    })
    .then(coments => {
      const ul = document.getElementById("lista-comentarios");
      ul.innerHTML = "";                       

      if (coments.length === 0) {
        ul.innerHTML = "<li>Nenhum comentário até agora.</li>";
        return;
      }

      coments.forEach(c => {
        const li = document.createElement("li");
        li.innerHTML = `
          <strong>${c.nomeAvaliador}</strong>
          <span> (${c.nota}/5)</span>
          <p>${c.comentario}</p>
        `;
        ul.appendChild(li);
      });
    })
    .catch(err => {
      console.error(err);
      document.getElementById("lista-comentarios")
              .innerHTML = "<li>Erro ao carregar comentários.</li>";
    });
}


function verificarPermissaoComentario() {
  fetch("SessionServlet")
    .then(r => {
      if (!r.ok) throw new Error();
      return r.json();
    })
    .then(user => {
      if (user.perfil === "Avaliador") {
        const container = document.getElementById("novo-comentario");
        container.innerHTML = `
          <h3>Adicionar Avaliação</h3>
          <form id="commentForm">
            <textarea id="comentarioTexto" placeholder="Escreva aqui..." required></textarea><br>
            <label>Nota:
              <input type="number" id="notaComentario" min="0" max="5" value="5">
            </label><br><br>
            <button type="submit">Enviar</button>
          </form>
        `;
        document.getElementById("commentForm")
                .addEventListener("submit", e => {
                  e.preventDefault();
                  enviarComentario();
                });
      }
    })
    .catch(()=>{});
}

function enviarComentario() {
  const texto = document.getElementById("comentarioTexto").value.trim();
  const nota  = +document.getElementById("notaComentario").value;
  if (!texto || nota < 0 || nota > 5) return;

  const params = new URLSearchParams({
    nome:  nomeMedicamento,
    texto: texto,
    nota:  nota
  });

  fetch("SalvaComentario", {
    method: "POST",
    credentials: "same-origin",                           
    headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8" },
    body: params.toString()
  })
  .then(r => {
    if (!r.ok) throw new Error("não autorizado ou erro");
    document.getElementById("comentarioTexto").value = "";
    carregarComentarios();
  })
  .catch(err => {
    alert("Erro ao enviar comentário: " + err.message);
  });
}

