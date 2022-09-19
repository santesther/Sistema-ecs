Rails.application.routes.draw do
  resources :instituicaos
  get '/instituicao', to: "instituicao#index"
  get 'instituicao/new'
  get 'instituicao/show'
  get 'instituicao/create'
  devise_for :users, :controllers => { registrations: 'registrations'}
  
  
  
  #resources :users /tenho q tentar assim dps
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :instituicao

  root "welcome#index"
  
  get "/welcome", to: "welcome#index"

  get 'welcome/historico', to: "welcome#historico"

  get 'welcome/listagem', to: "welcome#listagem"

  get 'users/index'
  get 'users/show'
  
end