# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      get '/reading_list' => 'list_items#reading_list'
      get '/finished_books' => 'list_items#finished_books'
      post '/list_item' => 'list_items#show'
      post '/add_list_item' => 'list_items#create'
      # post '/add_list_item' => 'list_items#add_list_item'
      post '/edit_list_item' => 'list_items#update'
      delete '/list_item' => 'list_items#destroy'

      get '/books' => 'books#index'
      post '/book' => 'books#show'
      get '/current_user', to: 'current_user#index'
    end
  end
  
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
