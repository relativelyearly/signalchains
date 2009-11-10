ActionController::Routing::Routes.draw do |map|
  map.resources :chain_gears
  map.resources :mics
  map.resources :chains do |chain|
    chain.resources :mics
  end
  map.resource :account, :controller => 'users'
  map.resources :password_resets
  map.resources :users
  map.resource :user_session

  map.add_mic '/chains/:chain_id/add/mic/:mic_id', :controller => 'chain_gears', :action => 'add_mic'
  map.add_line_in '/chains/:chain_id/add/line_in', :controller => 'chain_gears', :action => 'add_line_in'

  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.register 'register', :controller => 'users', :action => 'new'
  map.root :controller => 'user_sessions', :action => 'new'
end