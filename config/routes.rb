Rails.application.routes.draw do

  get '/users/sign_out', to: 'devise/sessions#destroy'

  devise_for :users

  root 'home#home'

  resources :links do
   member do
    put "like", to: "links#upvote"
    put "dislike", to: "links#downvote"
   end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
