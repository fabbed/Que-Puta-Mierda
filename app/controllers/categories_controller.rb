class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id].to_s)
    @stories = @category.stories.paginate(:page => params[:page], :per_page => STORIES_PER_PAGE)
  end

end


