Rails.application.routes.draw do
  get 'list_items/reading_list'
  get 'list_items/finished_books'
  get 'list_items/show'
  get 'list_items/create'
  get 'list_items/update'
  get 'list_items/destroy'
  get 'books/index'
  get 'books/show'
  get '/current_user', to: 'current_user#index'
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
