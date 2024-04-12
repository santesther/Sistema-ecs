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
        @relatorios = CartaApresentacao.all
        if @relatorios.present?
          @relatorios.destroy_by(params[:id])
        end
          redirect_to estagio_welcome_index_path, notice: 'Carta excluída com sucesso.'
        end
    
    
      def create
        @relatorios = CartaApresentacao.new(relatorio_params)
    
        @users = current_user.update(:carta_apresentacao => true)
       
        @relatorios.ano = @relatorios.ano
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
        params.permit(:data, :instituicao_apresentacao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :avaliador)
      end
end
