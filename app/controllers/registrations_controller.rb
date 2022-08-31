class RegistrationsController < Devise::RegistrationsController
    private

    def sign_up_params
        params.require(:user).permit(:nome_civil, :nome_social, :email, :matricula, :licenciatura, :periodo, :municipio, :cep, :endereco, :complemento, :numero, :bairro, :telefone, :avatar, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:nome_civil, :nome_social, :email, :matricula, :licenciatura, :periodo, :municipio, :cep, :endereco, :complemento, :numero, :bairro, :telefone, :avatar, :password, :password_confirmation, :current_password)
    end

end