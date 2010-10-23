# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_internetparty_session',
  :secret      => '1f09dae5a276bf65bb26bd103e6ce45353f91663cca4609f2e58cc6174f8b43af5a13c820f7b9683a5aa1628ddfa241c3116d814b36e49f5a31e3afb394ef54e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
