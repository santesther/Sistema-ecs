Rails.application.routes.draw do
  root "welcome#index"
  resources :mensagens
  get "/welcome", to: "welcome#index"
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'users/index'
  get 'users/show'


  #Routes do Sistema de Estágio
  get 'estagio_welcome/locus'

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
  
  get 'relatorio_aditivocentro/index'

  get 'relatorio_campiaditivo/index'

  get 'relatorio_estadualaditivo/index'

  get 'relatorio_municipalouparticularaditivo/index'

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

  get 'relatorio_aditivocentro/create'
  post 'relatorio_aditivocentro/create'

  get 'relatorio_aditivocentro/edit'
  post 'relatorio_aditivocentro/edit'

  get 'relatorio_aditivocentro/update'
  post 'relatorio_aditivocentro/update'

  get 'relatorio_campiaditivo/create'
  post 'relatorio_campiaditivo/create'

  get 'relatorio_campiaditivo/edit'
  post 'relatorio_campiaditivo/edit'

  get 'relatorio_estadualaditivo/create'
  post 'relatorio_estadualaditivo/create'

  get 'relatorio_estadualaditivo/edit'
  post 'relatorio_estadualaditivo/edit'

  get 'relatorio_estadualaditivo/update'
  post 'relatorio_estadualaditivo/update'

  get 'relatorio_centro/update'
  post 'relatorio_centro/update'

  get 'relatorio_municipalouparticularaditivo/update'
  post 'relatorio_municipalouparticularaditivo/update'

  get 'relatorio_municipalouparticularaditivo/create'
  post 'relatorio_municipalouparticularaditivo/create'

  get 'relatorio_municipalouparticularaditivo/edit'
  post 'relatorio_municipalouparticularaditivo/edit'

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
  get 'pdf_geral/aditivocentro'
  get 'pdf_geral/campiaditivo'
  get 'pdf_geral/estadualaditivo'
  get 'pdf_geral/municipalouparticularaditivo'

  get 'pdf_geral/update_aditivocentro'
  post 'pdf_geral/update_aditivocentro'

  get 'pdf_geral/update_campiaditivo'
  post 'pdf_geral/update_campiaditivo'

  get 'pdf_geral/update_estadualaditivo'
  post 'pdf_geral/update_estadualaditivo'

  get 'pdf_geral/update_municipalouparticularaditivo'
  post 'pdf_geral/update_municipalouparticularaditivo'
  
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

  #deletes relats
  get '/delete_relat_centro', to: 'relatorio_centro#destroy', as: 'delete_relat_centro'
  get '/delete_relat_campi', to: 'relatorio_campi#destroy', as: 'delete_relat_campi'
  get '/delete_relat_publico', to: 'relatorio_publico#destroy', as: 'delete_relat_publico'
  get '/delete_relat_particular', to: 'relatorio_particular#destroy', as: 'delete_relat_particular'
  get '/delete_relat_aditivocentro', to: 'relatorio_aditivocentro#destroy', as: 'delete_relat_aditivocentro'
  get '/delete_relat_campiaditivo', to: 'relatorio_campiaditivo#destroy', as: 'delete_relat_campiaditivo'
  get '/delete_relat_estadualaditivo', to: 'relatorio_estadualaditivo#destroy', as: 'delete_relat_estadualaditivo'
  get '/delete_relat_municipalouparticularaditivo', to: 'relatorio_municipalouparticularaditivo#destroy', as: 'delete_relat_municipalouparticularaditivo'


  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }
  
 resources :users do
  member do
    get 'liberar'
   end
end
end