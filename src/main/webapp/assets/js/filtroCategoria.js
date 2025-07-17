let todosMedicamentos = [];

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
          <a href="cadastromedicamento.html">Cadastrar Medicamento</a>
        `);
      }
    })
    .catch(() => {
      authLink.href = "filtro-categoria.html";
    });

	
  fetch("MedicamentosServlet")
    .then(res => res.json())
    .then(lista => {
      todosMedicamentos = lista;
      setupFiltros();
      filtrarCategoria("todos"); 
    })
    .catch(err => console.error("Erro ao carregar medicamentos:", err));
});

function setupFiltros() {
  document.querySelectorAll(".filtros-categorias .filtro")
    .forEach(btn => {
      btn.addEventListener("click", () => {
        document.querySelectorAll(".filtro").forEach(b => b.classList.remove("ativo"));
        btn.classList.add("ativo");
        filtrarCategoria(btn.dataset.cat);
      });
    });
}

function filtrarCategoria(categoria) {
  const container = document.getElementById("resultado");
  container.innerHTML = "";

  const filtrados = categoria === "todos"
    ? todosMedicamentos
    : todosMedicamentos.filter(m => m.categoria === categoria);

  if (filtrados.length === 0) {
    container.innerHTML = "<p>Nenhum medicamento encontrado para essa categoria.</p>";
    return;
  }

  filtrados.forEach(med => {
    const card = document.createElement("div");
    card.className = "card";
    card.innerHTML = `
      <img src="img/${med.imagem}" 
           alt="${med.nomeComercial}" 
           class="card-img-top">
      <h3>${med.nomeComercial}</h3>
      <h4 class="principio-ativo">${med.principioAtivo}</h4>
      <p class="descricao">${med.formaFarmaceutica}</p>
      <div class="botoes-acao">
        <button class="botao detalhes"
                onclick="location.href='detalhes-medicamento.html?nome=${encodeURIComponent(med.nomeComercial)}'">
          Detalhes
        </button>
      </div>
    `;
    container.appendChild(card);
  });
}

