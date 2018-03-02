Rails.application.routes.draw do
  resources :applications
  match '/users', to: 'users#index', via: 'get'
  resources :jobs
  resources :companies do
    end
  root to: 'pages#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  devise_scope :user do
    get 'users/sign_in', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  match '/users/:id', to: 'users#destroy', via: 'delete', as: :user

  resources :profiles, only: [:index, :new, :create, :destroy, :edit, :update] do
  root "profiles#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
