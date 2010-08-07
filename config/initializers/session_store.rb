# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_agape_session',
  :secret      => '94943d5f1216ea3fd030f8b2477fe5638ec8ac23cde0ebef37c57ab3a6d192189acb5803ad33da83d8043d93e0b993c3018329b54c5df2e1b7ecb494d1623262'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
