$(document).ready(function(){
  $('li').click(function(){
    $.get(`brands/${this.value}`)
  })
})