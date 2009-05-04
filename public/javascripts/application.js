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
  
  //An den Button wird das behaviour gebunden die form als ajax zu posten
  
  $("#mytable").tablesorter();
  
  $("#mytable tr").mouseover(function () {
    $(this).find("td").addClass("highlight");
  })
  $("#mytable  tr").mouseout(function () {
    $(this).find("td").removeClass("highlight");
  })
  
  
  $("#header_info_box").corners();
  $(".biznames .form").corners();  

  // $('#new_bizname').ajaxForm({
  //         success: function(data){eval(data);}
  // });

  
  $('.mark_as_payed_button').bind('click', function() {
      $(this).parent("form").ajaxSubmit({
          success: function(data){eval(data);}
      });
      return false; // <-- important!
  });

  $('.mark_as_payed_button').confirm({
    timeout:3000,
    dialogShow:'fadeIn',
    dialogSpeed:'slow',
    msg: '¿Esta seguro?',
    buttons: {
      wrapper:'<button></button>',
      separator:'  '
    }  
  });    


  $('.delete_keyword_link').bind('click', function() {
      $(this).parent("form").ajaxSubmit({
          success: function(data){eval(data);}
      });
      return false; // <-- important!
  });

  // $('.delete_keyword_link').confirm({
  //   timeout:3000,
  //   dialogShow:'fadeIn',
  //   dialogSpeed:'slow',
  //   msg: '¿Esta seguro?',
  //   buttons: {
  //     wrapper:'<button></button>',
  //     separator:'  '
  //   }  
  // });    





}); 