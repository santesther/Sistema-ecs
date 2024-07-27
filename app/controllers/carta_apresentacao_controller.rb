class CartaApresentacaoController < ApplicationController
  def index
    @relatorios = CartaApresentacao.all
  
    respond_to do |format|
      format.html
      format.pdf do
        @relatorio = CartaApresentacao.all
        if current_user.role != "normal_user"
          @usuario_matricula = params['matricula']
        else
          @usuario_matricula = current_user.matricula
        end
        @users = current_user.update(:status_carta => true)
  
        pdf = CartaapresentacaoPdf.new(@relatorio, current_user, @usuario_matricula)
  
        # Renderiza o PDF
        send_data pdf.render, filename: 'carta.pdf', type: 'application/pdf', disposition: 'inline'
  
        if current_user.role == "normal_user"
          #ContactMailer.confirmacao_impressao(current_user).deliver
        end
      end
    end
  end
      
    
      def update
        @relatorios = current_user.update(user_params)
       
        redirect_to relatorio_centro_index_path, notice: 'Dados Atualizados com sucesso!'
      end
    
      def destroy
        Rails.logger.info("Parâmetro user_id recebido: #{params[:user_id]}")
        @carta_apresentacao = CartaApresentacao.find_by(user_id: params[:user_id])
        if @carta_apresentacao
          Rails.logger.info("Encontrou a carta de apresentação com ID: #{@carta_apresentacao.id}")
          @carta_apresentacao.destroy
          flash[:notice] = "Carta de apresentação excluída com sucesso."
        else
          Rails.logger.info("Carta de apresentação não encontrada para user_id: #{params[:user_id]}")
          flash[:alert] = "Carta de apresentação não encontrada."
        end
        redirect_to estagio_welcome_index_path
      end
    
    
      def create
        @relatorios = CartaApresentacao.new(relatorio_params)
    
        @users = current_user.update(:carta_apresentacao => true)
       
        @relatorios.ano = @relatorios.ano
        @relatorios.nome_social_termo = @relatorios.nome_social_termo
        @relatorios.matricula_aluno = current_user.matricula
        @relatorios.licenciatura = current_user.licenciatura
        @relatorios.periodo = current_user.periodo
        @relatorios.endereco = current_user.endereco
        @relatorios.numero = current_user.numero
        @relatorios.complemento = current_user.complemento
        @relatorios.bairro = current_user.bairro
        @relatorios.municipio = current_user.municipio
        @relatorios.cep = current_user.cep
        @relatorios.telefone = current_user.telefone
        @relatorios.apolice = current_user.apolice
        @relatorios.aluno_apresentacao = current_user.nome_civil
    
        ContactMailer.contact_message(current_user).deliver
    
        flash[:notice] = 'Mensagem enviada com sucesso'
    
        if @relatorios.save
          redirect_to estagio_welcome_index_path, id: @relatorios.id,  notice: 'Relatório salvo com sucesso!'
        else
          redirect_to estagio_welcome_index_path, alert: 'Ocorreu um erro ao salvar o relatório, tente novamente mais tarde!'
        end
      end
    
      def user_params
        params.permit(:licenciatura)
      end
    
      def relatorio_params
        params.permit(:data, :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :avaliador, :user_id, :nomeSocialTermo, :nome_social_termo)
      end
end
