module StoriesHelper


  def awesome_truncate(text, length = 30, truncate_string = "...")
    return if text.nil?
    
    l = length - truncate_string.chars.length
    new_text = text.chars.length > length ? text[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : text
    
    new_text.split(" ").inject("") { |new_title, word| new_title = new_title + " " + word[0..22] }
  
  end



  def author(object)

    if object.is_a? Story
      if object.user and !object.anonymous
        object.user.login
      else
        "anónimo"
      end
    else object.is_a? Comment
      #todo: wenn eingeloogt dann echten namen
      "anónimo"
    end
  end



# =link_to_function "¡Qué puta mierda!(#{story_new.rated_top})", "vote_story(#{story_new.id}, 'top', 'collection')", :class => "vote_link"
# -else
# =link_to_function "¡Qué puta mierda!(#{story_new.rated_top})", "alert('Ya hay un voto tuyo para esta historia')", :class => "inactive"

  def thumbs_up_link(story)
    
    class_name = (session[:flop_votes].include?(story.id) or session[:top_votes].include?(story.id)) ? "not_active" : "active"

    submit_tag("&nbsp;", :disabled => (class_name == "not_active" ? true : false), :class => "#{class_name} thumb_input")
  end

  #"vote_story(#{story.id}, 'top', 'collection')"

  def thumbs_down_link(story)
    class_name = ((session[:flop_votes].include?(story.id) or session[:top_votes].include?(story.id))) ? "not_active" : "active"

    submit_tag("&nbsp;", :disabled => (class_name == "not_active" ? true : false), :class => "#{class_name} thumb_input")
  end



  def comment_bubble_link(story)
    
    link_class = ((story.comments.size == 0) ? "zero" : "not_zero"     )
    link_to("#{story.comments.size}", story_path(story, :anchor => "comments"), :class => link_class)
    
  end

  def category_as_tag(story)
    icon_class = (story.category.name.length > 4) ? "category_medium" : "category_small" 
    
    link_to(story.category.name+"&nbsp;&nbsp;&nbsp;", category_path(story.category), :class => icon_class + " fix tag")
    
  end


end
