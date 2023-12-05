document.addEventListener('DOMContentLoaded', function () {
  const daysButtons = document.querySelectorAll('.days');
  const reservesInfo = document.querySelector('.info-show');
  let menuOpen = false;

  if (daysButtons.length > 0 && reservesInfo) {
    daysButtons.forEach(function (button) {
      button.addEventListener('click', function() {
        menuOpen = !menuOpen;

        if (menuOpen) {
          reservesInfo.classList.add('visible');
        } else {
          reservesInfo.classList.remove('visible');
        }
      });
    });
  }
});
