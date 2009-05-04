Clear field
  $(".clear_field").val("")


Jquery Stuff  
  $("#title_row").after("<%= escape_javascript(     render :partial => 'payments/payment', :collection => @payments  ) %>")
  $(".shown_payments").hide().appear()
  $(this).switchOff().pause(1500).appear()
  $("#new_review").before('<div id="flash_notice"><%= escape_javascript(flash.delete(:notice)) %></div>');
  $("#reviews_count").html("<%= pluralize(@review.product.reviews.count, 'Review') %>");
  $("#reviews").append("<%= escape_javascript(render(:partial => @review)) %>");
  $("#new_review")[0].reset();





$('#mark_as_payed_form').unbind();
$('#mark_as_payed_button').unbind()

$('#mark_as_payed_button').unbind('click')
$('#mark_as_payed_button').unbind('submit')


  $('#mark_as_payed_form').ajaxForm(function(data) { 
    eval(data);
  }); 

  $('#mark_as_payed_button').click(function () {
    $('#mark_as_payed_form').submit()
  })

  $('#mark_as_payed_button').confirm({
    timeout:3000,
    dialogShow:'fadeIn',
    dialogSpeed:'slow',
    buttons: {
      wrapper:'<button></button>',
      separator:'  '
    }  
  });    
      


  $("#mark_as_payed_button").click( function() {
   jConfirm('Can you confirm this?', 'Confirmation Dialog');
  });

  $("#mark_as_payed_button").click( function() {
   jConfirm('Can you confirm this?', 'Confirmation Dialog', function(r) {
     jAlert('Confirmed: ' + r, 'Confirmation Results');
   });
  });
