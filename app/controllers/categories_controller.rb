class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id].to_s)


    builder = Story.scope_builder
    builder.from_category(@category.id)

    sort_order=case params[:ordenar_por]
      when nil
        builder.tops
      when "putadas"
        builder.tops
      when "nuevas"
        builder.newest_first
      when "cagadas"
        builder.flops
    end


    builder.from_country(session[:selected_country]) if session[:selected_country]
    @stories = builder.paginate(:page => params[:page], :per_page => STORIES_PER_PAGE)
    
  end

end


