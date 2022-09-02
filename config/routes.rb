Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "welcome#index"
  
  get "/welcome", to: "welcome#index"

  get 'welcome/historico', to: "welcome#historico"

  get 'welcome/instituicao', to: "welcome#instituicao"

  get 'welcome/usuarios', to: "welcome#usuarios"

  get 'welcome/listagem', to: "welcome#listagem"

    

  
  # Defines the root path route ("/")
  # root "articles#index"
end