function round_corners () {
  // $(".round_corners").corners();
  // $(".round_section").corners();
  // $('.top_round_section').corners("top 10px");
  // $('.story_wrapper .footer').corners("bottom 10px");
  // $('.story_wrapper .round').corners("top 10px");

  $('#header_login_section').corners("bottom 10px");
  $('.round_20').corners("20px");
  $('#new_story_wrapper').corners("20px");  
  $('.round').corners("10px");  
  
}

function submit_form (form) {
    $("input:submit", form).after($("#spinner").show());
    $("input:submit", form).attr("disabled", true).attr("value", "Enviando...................");
    form.submit();
}


$(document).ready(function() { 
  round_corners();

  $(".tooltip").tooltip({
     delay: 0,
     showURL: false
  })



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