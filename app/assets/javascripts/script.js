document.addEventListener('turbolinks:load', function() {
  openPopup();
});

function openPopup() {
  document.getElementById('popup').style.display = 'block';
}

function closePopup() {
  document.getElementById('popup').style.display = 'none';
}
