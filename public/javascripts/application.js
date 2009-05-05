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


function vote_story(id, vote_type, mode) {

  params = {"id" : id, "mode" : mode}    
  
  if (vote_type == "top") {
    $.ajax({
      url: '/stories/vote_top',
      data: params,
      type: 'POST',
      success: function(data) {
        eval(data);
      }
    });  
  }
  else{
    $.ajax({
      url: '/stories/vote_flop',
      data: params,
      type: 'POST',
      success: function(data) {
        eval(data);
      }
    });      
  }

}



function round_corners () {
  $(".round_section").corners();
  $('.top_round_section').corners("top 10px");
  $('.story_wrapper .footer').corners("bottom 10px");
  $('.story_wrapper .round').corners("top 10px");
}


$(document).ready(function() { 
  round_corners();
  
  
    $.timer(2000, function (timer) {
      var fade_time = 200;
      $("#new_history").animate({opacity: 1.0}, fade_time).animate({opacity: 0.1}, fade_time, function() {
        $("#new_history").animate({opacity: 0.1}, fade_time).animate({opacity: 1.0}, fade_time)
      })
      timer.stop();
    });  
    $.timer(5000, function (timer) {
      var fade_time = 200;
      $("#new_history").animate({opacity: 1.0}, fade_time).animate({opacity: 0.1}, fade_time, function() {
        $("#new_history").animate({opacity: 0.1}, fade_time).animate({opacity: 1.0}, fade_time)
      })
      timer.stop();
    });  
  
  
  
  
  
}); 