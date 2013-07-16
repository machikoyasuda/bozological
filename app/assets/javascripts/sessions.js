$(function(){
  $('#view-password').on('click', function(event) {
    if ($(this).hasClass('alert')) {
      $(this).removeClass('alert');
      $(this).addClass('success');
      $('#password').attr('type', 'text');
    } else {
      $(this).removeClass('success');
      $(this).addClass('alert');
      $('#password').attr('type', 'password');
    }
    return false;
  });
});
