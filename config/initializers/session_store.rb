# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_quemierda_session',
  :secret      => '25646f29dc2bb96a9417c1587b3cc6a86c9cae3d0e5dff0830369b85dad696cbd403967edf2a035ed8f2b65f67f8c5e00e6f46bb6719956be971eed232cc7d62'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
