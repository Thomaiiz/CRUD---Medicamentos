document.addEventListener("DOMContentLoaded", () => {
  fetch("SessionServlet")
    .then(res => res.json())
    .then(user => {
      const container = document.getElementById("dadosUsuario");

      if (!user || !user.nome || !user.perfil) {
        container.innerHTML = "<p>Você precisa estar logado para acessar esta página.</p>";
        setTimeout(() => window.location.href = "login.html", 2000);
        return;
      }

      container.innerHTML = `
        <p><strong>Nome:</strong> ${user.nome}</p>
        <p><strong>E-mail:</strong> ${user.email}</p>
        <p><strong>Perfil:</strong> ${user.perfil}</p>
        <a class="btn btn-vermelho" href="SaidaServlet">Sair da Conta</a>
      `;
    });
});
