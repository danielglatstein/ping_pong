Rails.application.routes.draw do
  resources :games
  resources :players
  resources :sessions 
  resources :teams
  resources :tables
end
