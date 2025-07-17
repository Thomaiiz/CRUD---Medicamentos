document.addEventListener("DOMContentLoaded", () => {
  const params = new URLSearchParams(window.location.search);
  const erro = params.get('erro');
  if (erro) {
    document.getElementById('erro').textContent = decodeURIComponent(erro);
  }
});