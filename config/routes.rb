Rails.application.routes.draw do
  resources :bookings
  resources :slots
  resources :movs do 
    collection do 
      get:autocomplete
    end
  end
  default_url_options :host => "localhost"
  devise_for :users
  get 'home/index'
  get '/book_user'=>"slots#book_user" , :as =>"book_user"
  
  root 'home#index'



end
