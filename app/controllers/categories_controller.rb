class CategoriesController < ApplicationController

  def show
    @stories = Story.find(:all, :conditions => ["category_id = ?", params[:id].to_i])
  end

end
