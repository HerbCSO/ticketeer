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
#== Route Map
# Generated on 02 Nov 2013 11:46
#
#                        root GET      /                                      home#index
#            new_user_session GET      /users/sign_in(.:format)               devise/sessions#new
#                user_session POST     /users/sign_in(.:format)               devise/sessions#create
#        destroy_user_session DELETE   /users/sign_out(.:format)              devise/sessions#destroy
#     user_omniauth_authorize GET|POST /users/auth/:provider(.:format)        omniauth_callbacks#passthru {:provider=>/google_oauth2/}
#      user_omniauth_callback GET|POST /users/auth/:action/callback(.:format) omniauth_callbacks#(?-mix:google_oauth2)
#               user_password POST     /users/password(.:format)              devise/passwords#create
#           new_user_password GET      /users/password/new(.:format)          devise/passwords#new
#          edit_user_password GET      /users/password/edit(.:format)         devise/passwords#edit
#                             PATCH    /users/password(.:format)              devise/passwords#update
#                             PUT      /users/password(.:format)              devise/passwords#update
#                  admin_root GET      /admin(.:format)                       admin/dashboard#index
#             admin_dashboard GET      /admin/dashboard(.:format)             admin/dashboard#index
#  batch_action_admin_tickets POST     /admin/tickets/batch_action(.:format)  admin/tickets#batch_action
#               admin_tickets GET      /admin/tickets(.:format)               admin/tickets#index
#                             POST     /admin/tickets(.:format)               admin/tickets#create
#            new_admin_ticket GET      /admin/tickets/new(.:format)           admin/tickets#new
#           edit_admin_ticket GET      /admin/tickets/:id/edit(.:format)      admin/tickets#edit
#                admin_ticket GET      /admin/tickets/:id(.:format)           admin/tickets#show
#                             PATCH    /admin/tickets/:id(.:format)           admin/tickets#update
#                             PUT      /admin/tickets/:id(.:format)           admin/tickets#update
#                             DELETE   /admin/tickets/:id(.:format)           admin/tickets#destroy
#    batch_action_admin_users POST     /admin/users/batch_action(.:format)    admin/users#batch_action
#                 admin_users GET      /admin/users(.:format)                 admin/users#index
#                             POST     /admin/users(.:format)                 admin/users#create
#              new_admin_user GET      /admin/users/new(.:format)             admin/users#new
#             edit_admin_user GET      /admin/users/:id/edit(.:format)        admin/users#edit
#                  admin_user GET      /admin/users/:id(.:format)             admin/users#show
#                             PATCH    /admin/users/:id(.:format)             admin/users#update
#                             PUT      /admin/users/:id(.:format)             admin/users#update
#                             DELETE   /admin/users/:id(.:format)             admin/users#destroy
# batch_action_admin_comments POST     /admin/comments/batch_action(.:format) admin/comments#batch_action
#              admin_comments GET      /admin/comments(.:format)              admin/comments#index
#                             POST     /admin/comments(.:format)              admin/comments#create
#               admin_comment GET      /admin/comments/:id(.:format)          admin/comments#show
#                edit_profile GET      /users/edit(.:format)                  users#edit
#                        user GET      /users/edit(.:format)                  users#edit
#                  users_edit PATCH    /users/edit(.:format)                  users#update
#                auth_failure GET      /auth/failure(.:format)                redirect(301, /)
#                             GET      /auth/:provider/callback(.:format)     sessions#create
#                 take_number GET      /take_number(.:format)                 home#take_number
#              service_ticket GET      /service_ticket(.:format)              home#service_ticket
#               cancel_ticket GET      /cancel_ticket(.:format)               home#cancel_ticket
#                       about GET      /about(.:format)                       home#about
#                    messages GET      /messages(.:format)                    messages#index
#                             POST     /messages(.:format)                    messages#create
#                 new_message GET      /messages/new(.:format)                messages#new
#                edit_message GET      /messages/:id/edit(.:format)           messages#edit
#                     message GET      /messages/:id(.:format)                messages#show
#                             PATCH    /messages/:id(.:format)                messages#update
#                             PUT      /messages/:id(.:format)                messages#update
#                             DELETE   /messages/:id(.:format)                messages#destroy
