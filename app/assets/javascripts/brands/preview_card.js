$(document).ready(function(){
  preview();
});

function preview(){
  $('li').filter('.list-group-item').click(function(){
    board_id = this.value;
    console.log(board_id);

  })
};