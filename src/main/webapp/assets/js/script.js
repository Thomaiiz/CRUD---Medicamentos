const toggle = document.querySelector('.menu-toggle');
const nav = document.querySelector('header nav');

toggle.addEventListener('click', () => {
  nav.classList.toggle('open');
});

function toggleMenu() {
    const nav = document.querySelector('header nav');
    nav.classList.toggle('open');
}

const input = document.getElementById('searchInput');
const cards = document.querySelectorAll('.card');

document.addEventListener('DOMContentLoaded', () => {
  const input = document.getElementById('searchInput');

  input.addEventListener('input', () => {
    const termo = input.value.trim().toLowerCase();

    document.querySelectorAll('.card').forEach(card => {
      const tituloEl = card.querySelector('h4, h3');
      const nome = tituloEl ? tituloEl.innerText.toLowerCase() : '';
      const visivel = nome.includes(termo);

      const wrapper = card.closest('.card-link') || card;
      wrapper.style.display = visivel ? '' : 'none';
    });
  });
});

