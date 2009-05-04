  function send_flirt(object, kiss_id) {
    message = $(object).parent().find("#message").val()
    $(object).parent().submit();
    $.post("create_flirt", { receiver_id: kiss_id, message: message } );
  }  

  function create_notice(object, kiss_id) {
    notice = $(object).parent().find("#notice").val()

    $(object).parent().find("#notice").val("")
    $.post("create_notice", { kissnofrog_id: kiss_id, notice: notice } );
  }  

  function paste_message(object, message_number){
    city = $(object).parent().find("#user_city").html()
    login = $(object).parent().find("#user_name").html()
    
    message = $(object).parent().find("#message").val("").val($("#message"+message_number).html().replace(/{login}/g, login).replace(/{city}/g, city))
  }
  
  function rate_user(object, user_id, number) {
    $.post("make_rating", { rating: number, user_id: user_id} );
  }
  