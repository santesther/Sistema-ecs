class RelatorioMunicipalouparticularaditivoController < ApplicationController
    def index
        @relatorios = Relatmunicipalouparticularaditivo.all
    
        if current_user.licenciatura == 'Ciências da Natureza'
          redirect_to action: "edit"
        end
    
        respond_to do |format|
         format.html
         format.pdf do
           @relatorio = Relatmunicipalouparticularaditivo.all
           if current_user.role != "normal_user"
             @usuario_matricula = params['matricula']
           else
             @usuario_matricula = current_user.matricula
           end
           @users = current_user.update(:status_impressao => true)
           pdf = MunicipalouparticularaditivoPdf.new(@relatorio, current_user, @usuario_matricula)
           send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'
    
           if current_user.role == "normal_user"
             ContactMailer.confirmacao_impressao(current_user).deliver
           end
         end
        end
      end
    
      def update
        @relatorios = current_user.update(user_params)
        redirect_to relatorio_municipalouparticularaditivo_index_path, notice: 'Dados Atualizados com sucesso!'
      end

      def destroy
        Rails.logger.info("Parâmetro user_id recebido: #{params[:user_id]}")
        @relatorio_municipalouparticularaditivo = Relatmunicipalouparticularaditivo.find_by(user_id: params[:user_id])
        if @relatorio_municipalouparticularaditivo
          Rails.logger.info("Encontrou a carta de apresentação com ID: #{@relatorio_municipalouparticularaditivo.id}")
          @relatorio_municipalouparticularaditivo.destroy
          flash[:notice] = "Termo Municipal ou Particular Aditivo excluído com sucesso."
        else
          Rails.logger.info("Relatorio aditivo centro não encontrada para user_id: #{params[:user_id]}")
          flash[:alert] = "Termo Municipal ou Particular Aditivo não encontrado."
        end
        redirect_to estagio_welcome_index_path
      end
    
      def create
        @relatorios = Relatmunicipalouparticularaditivo.new(relatorio_params)
    
        @users = current_user.update(:pdf_aditivo_municipalouparticular => true)
    
        @relatorios.ano = @relatorios.ano
        @relatorios.periodo_letivo = @relatorios.periodo_letivo
        @relatorios.periodo_dirlic = @relatorios.periodo_dirlic
        @relatorios.semestre_dirlic = @relatorios.semestre_dirlic
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
        @relatorios.cnpj = current_user.cnpj
        @relatorios.endereco_da_instituicao = current_user.endereco_da_instituicao
        @relatorios.numero_da_instituicao = current_user.numero_da_instituicao
        @relatorios.bairro_da_instituicao = current_user.bairro_da_instituicao
        @relatorios.municipio_da_instituicao = current_user.municipio_da_instituicao
        @relatorios.cep_da_instituicao = current_user.cep_da_instituicao
        @relatorios.telefone_da_instituicao = current_user.telefone_da_instituicao
        @relatorios.representante_da_instituicao = @relatorios.representante_da_instituicao
        @relatorios.estado_da_instituicao = current_user.estado_da_instituicao
        @relatorios.apolice = current_user.apolice
        @relatorios.nome_social_termo = @relatorios.nome_social_termo
        @relatorios.aluno_apresentacao_dois = current_user.nome_civil
        @relatorios.uf = current_user.uf
    
    
        ContactMailer.contact_message(current_user).deliver
    
    
        flash[:notice] = 'Mensagem enviada com sucesso'
    
        if @relatorios.save
          redirect_to estagio_welcome_index_path, id: @relatorios.id,  notice: 'Relatório salvo com sucesso!'
        else
          redirect_to estagio_welcome_index_path, notice: 'Ocorreu um erro ao salvar o relatório, tente novamente mais tarde!'
        end
      end
    
      def user_params
        params.permit(:licenciatura)
      end
    
      def relatorio_params
        params.permit(:data, :seguradora, :apolice, :instituicao_apresentacao, :estado_da_instituicao, :aluno_apresentacao, :aluno_apresentacao_dois, :semestre_apresentacao, :ano_apresentacao, :aluno_semestre, :periodo_de, :periodo_a, :matricula_aluno, :ano, :endereco, :numero, :complemento, :bairro, :municipio, :estado, :cep, :telefone, :estado_da_instituicao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :representante_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :licenciatura, :periodo, :avaliador, :periodo_letivo, :periodo_dirlic, :semestre_dirlic, :uf, :estagio, :user_id, :nome_social_termo)
      end
end
