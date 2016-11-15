Rails.application.routes.draw do
  # get 'profils/new'

  # get 'profils/create'

  # get 'profils/show'

  # get 'profils/edit'

  # get 'profils/update'

  # get 'comics/index'

  # get 'comics/show'

  # get 'comics/new'

  # get 'comics/create'

  # get 'comics/edit'

  # get 'comics/update'

  # get 'comics/detroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :comics
  resources :profils

  root 'comics#index'
end
