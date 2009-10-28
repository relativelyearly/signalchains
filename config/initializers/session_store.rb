# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_signalchains_session',
  :secret      => 'd71f50efcac97974e1e2245d5466048123a0d50483aa2eb3ff7a2dce50c297a9f60403861860555a25231f892d8704a9ef549bafb9eca6a4c17a58ae08511464'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
