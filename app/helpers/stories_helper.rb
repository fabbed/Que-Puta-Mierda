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



end
