// TO SLIDE WHEN THE TITLE IS CLICKED
// $(document).ready(function() {
  // $('.idea-container').on('click', function(event) {
  //   event.preventDefault();
  //   $(this).children().eq(1).slideToggle();
  // });
// });


// TO SLIDE WHEN THE SHOW BUTTON IS CLICKED
$(document).ready(function() {
  $('.show_button').on('click', function(event) {
    $(this).parent().siblings().slideToggle();
    $(this).html( $(this).text() == 'Hide' ? 'Show' : 'Hide' );
  });
});
