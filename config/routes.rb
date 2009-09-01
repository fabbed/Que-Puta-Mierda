ActionController::Routing::Routes.draw do |map|
  map.resources :newsletter_registrations


  map.resources :stories, 
                :collection => { :tops => :get, :flops => :get, :to_moderate => :get},
                :member => { :vote_top => :post, :vote_flop => :post }

  map.resources :categories
  map.resources :users
  map.resources :changes
    
  map.resource :session
  map.resource :comments  

  map.terms      '/terminos-del-servicio', :controller => 'terminos', :action => 'terms'
  map.privacidad  '/politica-de-privacidad', :controller => 'terminos', :action => 'privacidad'



  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.admin_kpis    "admin/kpis", :controller => 'admin/kpis'
  map.admin_stories "admin/stories", :controller => 'admin/stories'
  
  
  map.root :controller => 'stories'


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
