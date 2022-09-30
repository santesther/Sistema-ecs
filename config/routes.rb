Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  
  resources :users do
    patch :bulk_update
  end
  
  #resources :users /tenho q tentar assim dps
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :instituicao

  root "welcome#index"
  
  get "/welcome", to: "welcome#index"

  get 'welcome/historico', to: "welcome#historico"

  get 'welcome/listagem', to: "welcome#listagem"

  get '/users', to: "users#index"
  get 'users/:id', to: "users#show"
  
end