$(document).ready(function(){
  $('li').filter('.list-group-item').click(function(){
    $.get(`brands/${this.value}`)
  })
})