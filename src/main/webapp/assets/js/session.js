document.addEventListener("DOMContentLoaded", () => {
  fetch("SessionServlet")
    .then(r => r.json())
    .then(user => {
      const link = document.getElementById("authLink");
      const isLoggedIn = user && Object.keys(user).length > 0;

      link.classList.remove("btn-entrar", "btn-sair");

      if (isLoggedIn) {
        link.textContent = "Sair";
        link.href = "SaidaServlet";
        link.classList.add("btn-sair");
      } else {
        link.textContent = "Entrar";
        link.href = "login.html";
        link.classList.add("btn-entrar");
      }
    })
    .catch(err => console.error(err));
});