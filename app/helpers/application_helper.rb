# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  include TagsHelper

  def link_to_facebox(name, options = {}, html_options = {})
    link_to(name, options, html_options.merge({ :rel=> "facebox" }))
  end

  def show_payment_status(payment)
    
    output = ""

    if payment.is_payed
      output << "Markeado como pagado el #{my_date(payment.payed_at)}"
    else
      output << content_tag(:span, "No pagado", :class => "red bold")
    end
    
     
    
  end


  def get_flag_for_user(user)
    return (image_tag "flags/" + user.country.iso.upcase + ".gif")
  end

  def get_flag_for_bizname(bizname)
    return (image_tag "flags/" + bizname.country_code.upcase + ".gif")
  end



  def formated_money(money, main_currency)
    if main_currency == "CLP"
      "#{money.as_euro.format} (#{money.format(:no_cents)})"
    elsif
      "#{money.format(:no_cents)} (#{money.as_euro.format})"
    end
  end


  def my_date(date)
    date.strftime("%d/%m/%Y a las %H:%M hrs")
  end

  def my_date_kpis(date)
    date.strftime("%d.%m.%Y")
  end



  def info_field(label, value)
    
    output = ""
    output << content_tag(:div, label, :class => "info grid_2 alpha")
    output << content_tag(:div, value, :class => "value grid_4 omega")

  end


  def photo_and_user_link(user, avatar_type)

    output = ""
    output << '<div class="thumb_photo_in_table">'
    if user.has_photo?
      output << '<div class="photo fl">' +  image_tag(user.avatar(avatar_type)) + '</div>'    
    end
    output << '<div class="username fl">' +  link_to(user.fullname, user_path(user)) + '</div>'  
    output << '</div">'
                
  end


  def render_main_tabnav(classname)
    
    case classname
    when "Administrator": return (tabnav "admin_main")
    when "Distributor": return (tabnav "distributor_main")
    when "Author": return tabnav("author_main")
    end

  end

  def content_type_attrs(content_type = "text/html")
    { "http-equiv" => "Content-type", "content" => "#{content_type}; charset=utf-8" }
  end


  def spanish_month_names
    return ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
  end 

  def title(page_title)
    content_for(:title) { page_title }
  end

  def link_to_home_area
    if current_user.class.name == "Author"
        return (link_to("Inicio", account_home_author_path))
    elsif current_user.class.name == "Distributor"
        return (link_to "Inicio", account_home_distributor_path)
    elsif current_user.class.name == "Administrator"
        return (link_to("Inicio", home_admin_path))
    end
    
    
  end

end
