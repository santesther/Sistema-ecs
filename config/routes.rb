Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :instituicao
  
  get 'instituicao/index'
  get 'users/index'
  get 'users/show'
  
  #resources :users /tenho q tentar assim dps
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "welcome#index"
  
  get "/welcome", to: "welcome#index"

  get 'welcome/historico', to: "welcome#historico"

  get 'welcome/instituicao', to: "welcome#instituicao"

  get 'welcome/listagem', to: "welcome#listagem"

  # get 'instituicao/create', to: "instituicao#create"

  

  
  # Defines the root path route ("/")
  # root "articles#index"
end