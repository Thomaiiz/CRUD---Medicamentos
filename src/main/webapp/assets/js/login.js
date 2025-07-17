document.addEventListener("DOMContentLoaded", () => {
  const params = new URLSearchParams(window.location.search);
  const erro = params.get("erro");
  if (erro === "1") {
    document.getElementById("mensagem").textContent = "E‑mail ou senha inválidos.";
  }
});
