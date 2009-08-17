module StoriesHelper

  def thumbs_up_link(story)
    
    icon = (story.rated_top == 0) ? image_tag("new/icon_thumbs_up_not_active.png"): image_tag("new/icon_thumbs_up_active.png")
    
    
    content_tag(:div, icon + content_tag(:span, story.rated_flop.to_s), :class => "up")

    
    # =image_tag "new/icon_thumbs_down_active.png"
    # =
    # =image_tag "new/icon_thumbs_down_not_active.png"
    # =image_tag "new/icon_thumbs_up_not_active.png"          
    
  end

  def thumbs_down_link(story)
    
    icon = (story.rated_flop == 0) ? image_tag("new/icon_thumbs_down_not_active.png"): image_tag("new/icon_thumbs_down_active.png")    
    content_tag(:div, icon + content_tag(:span, story.rated_flop.to_s), :class => "down")    
    # =image_tag "new/icon_thumbs_down_active.png"
    # =image_tag "new/icon_thumbs_up_active.png"
    # =image_tag "new/icon_thumbs_down_not_active.png"
    # =image_tag "new/icon_thumbs_up_not_active.png"          
    
  end


  def comment_bubble_link(story)
    
    link_class = ((story.comments.size == 0) ? "zero" : "not_zero"     )
    link_to("#{story.comments.size}", story_path(story, :anchor => "comments"), :class => link_class)
    
    
  end

  def category_as_tag(story)
    icon_class = (story.category.name.length > 5) ? "category_medium" : "category_small" 
    
    content_tag(:span, (link_to(story.category.name, category_path(story.category)) + "&nbsp;&nbsp;&nbsp;"), :class => icon_class)
    
  end


end
