Blah::Application.routes.draw do
  root :to => 'messages#index'

  resources :messages, :path => 'mensajes'
  resources :users, :path => 'participantes'

  match "/autorizar" => "sessions#create", :as => :signin
  match "/entrar" => "sessions#new", :as => :login
  match "/salir" => "sessions#destroy", :as => :signout
  match "/enter/:id" => "sessions#enter", :as => :enter
  match "/gogroup/:id" => "groups#enter", :as => :gogroup

  match "/blah" => "blah#about"
  match "/status" => "blah#status", :as => :status
  match "/work" => "blah#perform_jobs", :as => :work
  match "/contactar" => "blah#contact", :as => :contact
end
