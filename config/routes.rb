ActionController::Routing::Routes.draw do |map|
  map.resources :newsletter_registrations
  
  map.resources :suggestions

  map.resources :stories, 
                :collection => { :tops => :get, :flops => :get, :to_moderate => :get, :new2 => :get},
                :member => { :vote_top => :post, :vote_flop => :post }


  # Typus admin
  prefix = "admin2" # Typus::Configuration.options[:prefix]
  map.with_options :controller => 'typus' do |i|
    i.typus_dashboard "#{prefix}", :action => 'dashboard'
    i.typus_index "#{prefix}/:model", :action => 'index'
    i.connect "#{prefix}/:model/:action", :requirements => { :action => /index|new|create/ }, :action => 'index'
    i.connect "#{prefix}/:model/:id/:action", :requirements => { :action => /edit|update|destroy|position|toggle|relate|unrelate/, :id => /\d+/ }, :action => 'edit'
  end
  map.connect "#{prefix}/:model/:action", :controller => 'typus_extras'
  map.connect "#{prefix}/:model/:id/:action", :controller => 'typus_extras'


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

  map.admin_kpis        "admin/kpis",         :controller => 'admin/kpis'
  map.admin_stories     "admin/stories",      :controller => 'admin/stories'
  map.admin_suggestions "admin/suggestions",  :controller => 'admin/suggestions'
  
  map.root :controller => 'stories'

  map.sitemap "/sitemap.xml", :controller => "sitemap", :action => "xml"

  map.suggestions "/queremos-vuestras-sugerencias", :controller => "suggestions", :action => "index"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
