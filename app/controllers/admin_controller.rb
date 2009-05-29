class AdminController < ApplicationController

  before_filter :login_required, :is_admin
  
  
  
  
end