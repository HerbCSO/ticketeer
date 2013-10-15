Ticketeer::Application.routes.draw do
  root :to => "home#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks"}
  ActiveAdmin.routes(self)

  get 'auth/failure', to: redirect('/')
  get '/auth/:provider/callback', to: 'sessions#create'

  get 'take_number' => 'home#take_number', as: :take_number
  get 'service_ticket' => 'home#service_ticket', as: :service_ticket
  get 'about' => 'home#about', as: :about
end
