Rails.application.routes.draw do
  get 'estagio_welcome/edit'
  get 'estagio_welcome/index'
  get 'estagio_welcome/pdf_visualiza'
  get 'estagio_welcome/historico'
  get 'users/index'
  get 'users/show'
  get 'signature/index'
  get 'relatorio_centro/edit'
  get 'relatorio_centro/index'
  get 'relatoutros/index'
  get 'relatoutros/edit'
  get 'relatorio_campi/index'
  get 'relatorio_campi/edit'
  get 'relatorio_publico/index'
  get 'relatorio_publico/edit'
  get 'documents/index'
  devise_for :users, :controllers => { registrations: 'registrations'} 
  
  resources :users do
    patch :update_status
  end
  
  
  #resources :users /tenho q tentar assim dps
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "welcome#index"
  
  get "/welcome", to: "welcome#index"

  #get 'welcome/historico', to: "welcome#historico"
  
  #get 'welcome/users', to: 'welcome#users'

  get 'welcome/listagem', to: "welcome#listagem"

  #get '/users', to: "users#index"
  #get '/users/:id', to: "users#show"

  #get 'users/:id/update_status', to: "users#update_status"

  get 'download', to: "documents#download"
  get 'preview', to: "documents#preview"

  #Routes do Sistema de Estágio
  get 'estagio_welcome/index'
  post 'estagio_welcome/index'

  get 'estagio_welcome/pendente'
  post 'estagio_welcome/pendente'

  get 'estagio_welcome/edit'
  post 'estagio_welcome/edit'

  get 'estagio_welcome/update'
  post 'estagio_welcome/update'

  get 'estagio_welcome/historico'
  post 'estagio_welcome/historico'

  get 'estagio_welcome/status_impressao'
  post 'estagio_welcome/status_impressao'

  get 'estagio_welcome/pdf_visualiza'

  get 'relatorio_centro/index'
  get 'relatorio_campi/index'

  get 'relatorio_publico/index'

  get 'relatorio_particular/index'
  get 'relatorio_particular/edit'

  get 'relatorio_particular/update'
  post 'relatorio_particular/update'

  get 'relatorio_particular/create'
  post 'relatorio_particular/create'

  get 'relatorio_naoformal/index'
  get 'relatorio_naoformal/edit'

  get 'relatorio_naoformal/create'
  post 'relatorio_naoformal/create'

  get 'relatorio_naoformal/edit'
  post 'relatorio_naoformal/edit'

  get 'relatorio_naoformal/update'
  post 'relatorio_naoformal/update'

  get 'relatorio_centro/create'
  post 'relatorio_centro/create'

  get 'relatorio_centro/edit'
  post 'relatorio_centro/edit'

  get 'relatorio_centro/update'
  post 'relatorio_centro/update'

  get 'relatorio_campi/create'
  post 'relatorio_campi/create'

  get 'relatorio_campi/edit'
  post 'relatorio_campi/edit'

  get 'relatorio_campi/update'
  post 'relatorio_campi/update'

  get 'relatorio_publico/create'
  post 'relatorio_publico/create'

  get 'relatorio_publico/edit'
  post 'relatorio_publico/edit'

  get 'relatorio_publico/update'
  post 'relatorio_publico/update'

 
  get 'pdf_geral/particular'
  get 'pdf_geral/publico'
  get 'pdf_geral/centro'
  get 'pdf_geral/campi'
  get 'pdf_geral/naoformal'
  get 'pdf_geral/publico'

  get 'pdf_geral/update_particular'
  post 'pdf_geral/update_particular'

  get 'pdf_geral/update_publico'
  post 'pdf_geral/update_publico'

  get 'pdf_geral/update_centro'
  post 'pdf_geral/update_centro'

  get 'pdf_geral/update_campi'
  post 'pdf_geral/update_campi'

  get 'pdf_geral/update_naoformal'
  post 'pdf_geral/update_naoformal'

  
end