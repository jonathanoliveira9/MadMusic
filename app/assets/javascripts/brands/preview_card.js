$(document).ready(function(){
  $('#default').show();
  $('li').filter('.list-group-item').click(function(){
    $.get(`brands/${this.value}`)
    $('#default').hide();
  })
})