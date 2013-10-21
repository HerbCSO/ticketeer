Ticketeer::Application.routes.draw do
  root :to => "home#index"

  devise_for :users,
    :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations"},
    :except => [ :create, :new ]
  ActiveAdmin.routes(self)

  get 'users/edit', to: 'users#edit', as: :edit_profile
  get 'users/edit', to: 'users#edit', as: :user
  patch 'users/edit', to: 'users#update'

  get 'auth/failure', to: redirect('/')
  get '/auth/:provider/callback', to: 'sessions#create'

  get 'take_number' => 'home#take_number', as: :take_number
  get 'service_ticket' => 'home#service_ticket', as: :service_ticket
  get 'cancel_ticket' => 'home#cancel_ticket', as: :cancel_ticket
  get 'about' => 'home#about', as: :about

  resources :messages
end
