class ChangesController < AdminController


  def create
    @change = Change.new(params[:change])
    

      if @change.save
        flash[:notice] = 'Change was successfully created.'
      end

      redirect_to :controller => "admin/kpis"    

    end

end
