ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resource :session

  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'


  map.root :controller => 'welcome'


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
