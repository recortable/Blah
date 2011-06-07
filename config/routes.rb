Rapid::Application.routes.draw do
  root :to => 'messages#index'

  resources :messages, :path => 'mensajes'
  resources :users, :path => 'participantes'

  match "/autorizar" => "sessions#create", :as => :signin
  match "/entrar" => "sessions#new", :as => :login
  match "/salir" => "sessions#destroy", :as => :signout
  match "/enter/:id" => "sessions#enter", :as => :enter

end
