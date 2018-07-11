Rails.application.routes.draw do
  
  get '/users/sign_out', to: 'devise/sessions#destroy'	

  devise_for :users
  
  root 'home#home'
  
  get 'home/home'

  resources :links

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
