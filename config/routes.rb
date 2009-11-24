ActionController::Routing::Routes.draw do |map|
  map.resources :comments

  map.resources :chains, :member => {:like => :get} do |chain|
    chain.resources :mics
    chain.resources :preamps
    chain.resources :dynamics_processors
    chain.resources :effects_processors
    chain.resources :equalizers
    chain.resources :comments
  end

  map.resources :equalizers, :collection => {:search => :get} do |equalizer|
    equalizer.resources :comments
  end

  map.resources :effects_processors, :collection => {:search => :get} do |effects_processor|
    effects_processor.resources :comments
  end

  map.resources :dynamics_processors, :collection => {:search => :get} do |dynamics_processor|
    dynamics_processor.resources :comments
  end

  map.resources :preamps, :collection => {:search => :get} do |preamp|
    preamp.resources :comments
  end

  map.resources :mics, :collection => {:search => :get} do |mic|
    mic.resources :comments
  end

  map.resources :audios, :except => [:index, :show, :create]

  map.resources :chain_gears
  map.resource :account, :controller => 'users'
  map.resources :password_resets
  map.resources :users
  map.resource :user_session

  map.add_mic '/chains/:chain_id/add/mic/:mic_id', :controller => 'chain_gears', :action => 'add_mic'
  map.add_line_in '/chains/:chain_id/add/line_in', :controller => 'chain_gears', :action => 'add_line_in'
  map.add_preamp '/chains/:chain_id/add/preamp/:preamp_id', :controller => 'chain_gears', :action => 'add_preamp'
  map.add_dynamics_processor '/chains/:chain_id/add/dynamics_processor/:dynamics_processor_id', :controller => 'chain_gears', :action => 'add_dynamics_processor'
  map.add_effects_processor '/chains/:chain_id/add/effects_processor/:effects_processor_id', :controller => 'chain_gears', :action => 'add_effects_processor'
  map.add_equalizer '/chains/:chain_id/add/equalizer/:equalizer_id', :controller => 'chain_gears', :action => 'add_equalizer'

  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.register 'register', :controller => 'users', :action => 'new'
  map.root :controller => 'user_sessions', :action => 'new'
end