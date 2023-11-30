document.addEventListener("DOMContentLoaded", function() {
  const icon = document.querySelector('#info-icon');
  const menu = document.querySelector('.show-menu');

  let menuOpen = false;

  if (icon && menu) {
    icon.addEventListener('click', function() {
      menuOpen = !menuOpen;

      if (menuOpen) {
        menu.classList.add('visible');
      } else {
        menu.classList.remove('visible');
      }
    });
  }
});

