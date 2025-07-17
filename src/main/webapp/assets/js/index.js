let loggedUser = null;

document.addEventListener("DOMContentLoaded", () => {
  const menu = document.getElementById("menu");

  fetch("SessionServlet")
    .then(res => {
      if (!res.ok) throw new Error("não autenticado");
      return res.json();
    })
    .then(user => {
      loggedUser = user;
	  
	  
	  
      if (user.perfil === "Usuario") {
        menu.insertAdjacentHTML("beforeend", `
          <a href="cadastromedicamentos.html">Cadastrar Medicamento</a>
        `);
      }
    })
    .catch(() => {
    });

  const lancamentosEstáticos = [
    { imagem: 'farmaco1.png', nomeComercial: 'Neosaldina',   principioAtivo: 'Paracetamol', formaFarmaceutica: 'Drágeas', preco: 'R$ 26,34' },
    { imagem: 'farmaco2.png', nomeComercial: 'Cimegripe',     principioAtivo: 'Fenilefrina + Paracetamol + Clorfeniramina', formaFarmaceutica: 'Cápsulas', preco: 'R$ 12,90' },
    { imagem: 'farmaco3.png', nomeComercial: 'Rinosoro',      principioAtivo: 'Cloreto de Sódio', formaFarmaceutica: 'Sachês em pó', preco: 'R$ 19,90' },
    { imagem: 'farmaco4.png', nomeComercial: 'Benegrip',      principioAtivo: 'Paracetamol + Fenilefrina + Dexclorfeniramina', formaFarmaceutica: 'Comprimidos', preco: 'R$ 21,19' },
    { imagem: 'farmaco5.png', nomeComercial: 'Strepsils',     principioAtivo: 'Amilmetacresol + Diclorobenzil álcool', formaFarmaceutica: 'Pastilhas', preco: 'R$ 17,49' }
  ];
  renderizarCards(lancamentosEstáticos, "cardsLancamentos");

  const ofertasEstáticas = [
    { imagem: 'oferta1.png', nomeComercial: 'Colflex Trio',    principioAtivo: 'MSM', formaFarmaceutica: 'Sachês', preco: 'R$ 139,79' },
    { imagem: 'oferta2.png', nomeComercial: 'Ibuprofeno Tutti',principioAtivo: 'Ibuprofeno', formaFarmaceutica: 'Suspensão oral', preco: 'R$ 25,13' },
    { imagem: 'oferta3.png', nomeComercial: 'Apixabana EMS',   principioAtivo: 'Apixabana', formaFarmaceutica: 'Comprimidos revestidos', preco: 'R$ 62,90' },
    { imagem: 'oferta4.png', nomeComercial: 'Fórmula Infantil',principioAtivo: 'Fórmula infantil em pó', formaFarmaceutica: 'Pó', preco: 'R$ 58,90' },
    { imagem: 'oferta5.png', nomeComercial: 'Dipirona Prati',  principioAtivo: 'Dipirona', formaFarmaceutica: 'Comprimidos', preco: 'R$ 13,39' }
  ];
  renderizarCards(ofertasEstáticas, "cardsOfertas");

  fetch("MedicamentosServlet")
    .then(res => res.json())
    .then(userMeds => {
      renderizarCards(userMeds, "cardsCadastrados");
    })
    .catch(err => console.error("Erro ao carregar meds:", err));
});

function renderizarCards(lista, containerId) {
  const container = document.getElementById(containerId);
  container.innerHTML = "";

  lista.forEach(med => {
    const card = document.createElement("div");
    card.className = "card";

    let inner = `
      <img src="img/${med.imagem}" alt="${med.nomeComercial}" class="card-img-top">
      <h3>${med.nomeComercial}</h3>
      <h4 class="principio-ativo">${med.principioAtivo}</h4>
      <p class="descricao">${med.formaFarmaceutica}</p>
    `;

	if (containerId === "cardsCadastrados" && loggedUser && 
	    loggedUser.perfil === "Usuario") {
      inner += `
        <div class="botoes-acao">
          <button class="botao editar"
                  onclick="location.href='editar-medicamento.html?nome=${encodeURIComponent(med.nomeComercial)}'">
            Editar
          </button>
          <button class="botao excluir"
                  onclick="removerMedicamento('${med.nomeComercial}')">
            Remover
          </button>
        </div>
      `;
    } else {
      inner += `
        <button onclick="location.href='detalhes-medicamento.html?nome=${encodeURIComponent(med.nomeComercial)}'">
          DETALHES
        </button>
      `;
    }

    card.innerHTML = inner;
    container.appendChild(card);
  });
}

function removerMedicamento(nomeComercial) {
  if (!confirm("Tem certeza que deseja remover este medicamento?")) return;

  const params = new URLSearchParams();
  params.append("acao", "remover");             
  params.append("nomeComercial", nomeComercial);

  fetch("RemoverMedicamentoServlet", {
    method: "POST",
    body: params
  })
    .then(res => {
      if (!res.ok) {
        return res.text().then(text => { 
          throw new Error(text || "falha ao remover"); 
        });
      }
      carregarMedicamentos();
    })
    .catch(err => alert("Erro ao remover: " + err.message));
}

function buscar() {
  const termo = document.getElementById("campoBusca").value.trim();
  if (termo) {
    window.location.href = `detalhes-medicamento.html?nome=${encodeURIComponent(termo)}`;
  }
}
