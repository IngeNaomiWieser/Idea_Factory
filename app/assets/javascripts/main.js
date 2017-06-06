$(document).ready(function() {
  $('.idea-container').on('click', function(event) {
    event.preventDefault();
    $(this).children().eq(1).slideToggle();
  });
});
