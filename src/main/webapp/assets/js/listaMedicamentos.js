let loggedUser = null;

document.addEventListener("DOMContentLoaded", () => {
  const authLink = document.getElementById("authLink");
  const menu = document.getElementById("menu");

  fetch("SessionServlet")
    .then(res => {
      if (!res.ok) throw new Error("não autenticado");
      return res.json();
    })
    .then(user => {
      loggedUser = user;

      authLink.textContent = "Sair";
      authLink.classList.remove("btn-login");
      authLink.classList.add("btn-vermelho");
      authLink.href = "SaidaServlet";

      if (user.perfil === "Usuario") {
        menu.insertAdjacentHTML("beforeend", `
          <a href="cadastromedicamentos.html">Cadastrar Medicamento</a>
        `);
      }
    })
    .catch(() => {
      authLink.href = "login.html";
    });

  carregarMedicamentos();
});

function carregarMedicamentos() {
  fetch("MedicamentosServlet")
    .then(res => res.json())
    .then(lista => renderizarCards(lista, "cardsMedicamentos"))
    .catch(err => console.error("Erro ao carregar meds:", err));
}


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
      <div class="botoes-acao">
    `;

    if (loggedUser
        && (loggedUser.perfil === "Usuario")) {
      inner += `
        <button class="botao editar"
                onclick="editarMedicamento('${encodeURIComponent(med.nomeComercial)}')">
          Editar
        </button>
        <button class="botao excluir"
                onclick="removerMedicamento('${encodeURIComponent(med.nomeComercial)}')">
          Remover
        </button>
      `;
    }
    inner += `
        <button class="botao detalhes"
                onclick="verDetalhes('${encodeURIComponent(med.nomeComercial)}')">
          Detalhes
        </button>
      </div>
    `;

    card.innerHTML = inner;
    container.appendChild(card);
  });
}

function editarMedicamento(nome) {
  window.location.href = `editar-medicamento.html?nome=${decodeURIComponent(nome)}`;
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

function verDetalhes(nome) {
  window.location.href = `detalhes-medicamento.html?nome=${decodeURIComponent(nome)}`;
}
