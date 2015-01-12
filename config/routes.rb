Rails.application.routes.draw do
  root 'tallii#index'

  post '/user/login' => 'user#login', as: 'login'
  post '/user/create' => 'user#create', as: 'register'

  get '/logout' => 'user#logout', as: 'logout'

  get '/profile/:id' => 'user#show', as: 'profile'
  
  get '/games' => 'game#index', as: 'game'
  get '/games/show/:id' => 'game#show', as: 'game_show'
	get '/games/new' => 'game#new', as: 'game_new'
	post '/games/create' => 'game#create', as: 'game_create'
  
  get '/scores' => 'score#index', as: 'score'
  post '/scores/new' => 'score#create', as: 'score_new'
  get '/players/(:month)/(:year)' => 'player#index', as: 'player'

  get '/login' => 'tallii#authenticate', as: 'authenticate'
end
