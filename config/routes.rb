ActionController::Routing::Routes.draw do |map|

  map.resources :stories, 
                :collection => { :tops => :get, :flops => :get, :to_moderate => :get},
                :member => { :vote_top => :post, :vote_flop => :post }

  map.resources :categories
  map.resources :users
  map.resource :session
  map.resource :comments  

  map.terms      '/terminos-del-servicio', :controller => 'terminos', :action => 'terms'
  map.privacidad  '/politica-de-privacidad', :controller => 'terminos', :action => 'privacidad'



  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'


  map.root :controller => 'welcome'


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
