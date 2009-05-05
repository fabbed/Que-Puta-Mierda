# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead


  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:email], params[:password])
    if logged_in?
      current_user.remember_me unless current_user.remember_token?
      cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      redirect_back_or_default('/')
      flash[:notice] = "Te conectaste!"
    else
      flash[:notice] = "El nombre de usuario y contraseña que has introducido no se corresponden. <br>Verifica los datos y asegúrate de haber hecho click en el link de confirmación de cuenta que te fue enviado por E-mail."      
      render :action => "new"
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "Te desconectaste!"
    redirect_back_or_default('/')
  end
end
