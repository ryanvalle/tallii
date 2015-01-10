Rails.application.routes.draw do
  root 'tallii#index'

  post '/user/login' => 'user#login', as: 'login'
  post '/user/create' => 'user#create', as: 'register'

  get '/logout' => 'user#logout', as: 'logout'

  get '/profile' => 'user#show', as: 'profile'
  get '/games' => 'game#index', as: 'game'
  get '/scores' => 'score#index', as: 'score'
  get '/players' => 'player#index', as: 'player'
end
