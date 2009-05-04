ActionController::Routing::Routes.draw do |map|
  map.root :controller => "welcome", :action => "index"
  
  map.resource :session
  map.login  "login",   :controller => "sessions", :action => "new"
  map.logout "logout",  :controller => "sessions", :action => "destroy"
  
  map.resources :cities,       :collection => { :validate => :get }
  map.resources :universities, :collection => { :validate => :get }
  
  map.resource :account, :collection => { :validate => :get } do |account|
    account.resource   :info,     :controller => "account/infos"
    account.resource   :profile,  :controller => "account/profiles"
    account.resource   :avatar,   :controller => "account/avatars"
    account.resource   :password, :controller => "account/passwords", :member => { :forgotten => :get, :reset => :post }
    
    account.trips "trips", :controller => "account/trips", :action => "index"
    account.with_options :path_prefix => "account/trips" do |trips|
      trips.resources  :offered_trips, :controller => "account/offered_trips", :collection => { :previous => :get }, :as => :offered do |offered_trips|
        offered_trips.resources :bookings do |booking|
          booking.resource :rating, :controller => "account/ratings"
        end
      end
      trips.resources  :booked_trips,  :controller => "account/booked_trips", :collection => { :previous => :get }, :as => :booked do |booked_trips|
        booked_trips.resources :bookings do |booking|
          booking.resource :rating, :controller => "account/ratings"
        end
      end
      
      account.resources :payments, :controller => "account/payments"
    end
    
    account.ratings "ratings", :controller => "account/ratings", :action => "index"
    account.with_options :path_prefix => "account/ratings" do |trips|
      trips.resources  :given_ratings,    :controller => "account/given_ratings", :as => :given
      trips.resources  :received_ratings, :controller => "account/received_ratings", :as => :received
    end
  end
  map.new_account           "signup",                                    :controller => "accounts", :action => "new"
  map.new_account_with_code "signup/:invitation_code",                   :controller => "accounts", :action => "new"
  map.activate_account      "account/activate/:activation_code",         :controller => "accounts",  :action => "activate"
  map.new_account_password  "account/password/new/:password_reset_code", :controller => "account/passwords", :action => "new"
  
  map.resources :trips, :collection => { :search => :any }, :member => { :complete_subtrips => :put } do |trip|
    trip.resources :bookings
  end
  
  map.resources :users do |user|
    user.resources :ratings
  end
  
  map.static_actions :infos, [:index, :about, :faq, :help, :contact, :terms, :privacy, :imprint]
  
  map.connect "sms/zong", :controller => "sms_handler", :action => "zong"
end
