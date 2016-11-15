Rails.application.routes.draw do
  # get 'comics/index'

  # get 'comics/show'

  # get 'comics/new'

  # get 'comics/create'

  # get 'comics/edit'

  # get 'comics/update'

  # get 'comics/detroy'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :comics

  root 'comics#index'
end
