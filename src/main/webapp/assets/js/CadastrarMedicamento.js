document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("formMedicamento");
  const msg  = document.getElementById("mensagem");

  form.addEventListener("submit", event => {
    event.preventDefault();
    msg.textContent = "";
    msg.style.color = "green";

    fetch("MedicamentosServlet", {
      method: "POST",
      body: new FormData(form)
    })
    .then(res => {
      if (!res.ok) {
        return res.text().then(txt => { throw new Error(txt) });
      }
      return res.text();
    })
    .then(texto => {
      msg.textContent = texto;
      setTimeout(() => {
        window.location.href = "index.html";
      }, 800); 
    })
    .catch(err => {
      msg.style.color = "red";
      msg.textContent = "Erro: " + err.message;
    });
  });
});
