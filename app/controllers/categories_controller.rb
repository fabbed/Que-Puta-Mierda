class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id].to_s)
    sort_order=case params[:ordenar_por]
      when nil
        @stories = @category.stories.tops.paginate(:page => params[:page], :per_page => STORIES_PER_PAGE)
      when "putadas"
        @stories = @category.stories.tops.paginate(:page => params[:page], :per_page => STORIES_PER_PAGE)
      when "nuevas"
        @stories = @category.stories.newest_first.paginate(:page => params[:page], :per_page => STORIES_PER_PAGE)        
      when "cagadas"
        @stories = @category.stories.flops.paginate(:page => params[:page], :per_page => STORIES_PER_PAGE)        
    end
    
  end

end


