//Fades out the notice flash message after some seconds

  function show_suggestions() {
    $("#show_suggestions_link").hide()


    $("#suggestions_table").appear(function(){
      $.scrollTo($('#suggestions_table'), 800);  
    })
    
  }


  function another_suggestion() {
    $("#suggestion_form").blindDown()
    $("#another_suggestion_link").hide()
    $(".clear_field").val("")
  }

function fade_out(time){
  setTimeout(function() {
    $('#flash_messages').blindUp();
  }, time);
}



$(document).ready(function() { 
  
  $(".round_section").corners();

  $('.top_round_section').corners("top 10px");
  $('.story_wrapper .footer').corners("bottom 10px");


}); 