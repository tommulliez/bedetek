Rails.application.routes.draw do



  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :comics do
    resources :bookings, only: [:new]
  end



  resources :profils do
    resources :bookings, except: [:new]

  end


  root 'comics#index'
end
