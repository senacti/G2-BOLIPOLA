document.addEventListener("DOMContentLoaded", function() {
  const icon = document.querySelector('#info-icon');
  const menuItem = document.querySelector('li#m.info');

  if (icon && menuItem) {
    icon.addEventListener('click', function() {
      menuItem.classList.toggle('active');
    });
  }
});