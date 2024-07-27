class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
   
	def configure_permitted_parameters     
    devise_parameter_sanitizer.permit(:sign_up) do |users_params|        
        users_params.permit(:nome_civil, :nome_social, :email, :endereco, :complemento, :numero, :bairro, :municipio, :cep, :matricula, :licenciatura, :periodo, :telefone, :avatar, :nome_da_instituicao, :tipo_da_instituicao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :complemento_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :UF, :estado_da_instituicao, :password, :password_confirmation)    
    end

    devise_parameter_sanitizer.permit(:account_update) do |users_params|        
        users_params.permit(:nome_civil, :nome_social, :email, :endereco, :complemento, :numero, :bairro, :municipio, :cep, :matricula, :licenciatura, :periodo, :telefone, :avatar, :nome_da_instituicao, :tipo_da_instituicao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :complemento_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :apolice, :UF, :estado_da_instituicao, :password, :password_confirmation)    
    end  
  end

end
