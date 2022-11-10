class CentroPdf < Prawn::Document
    def initialize(relatorio, current_user, usuario_matricula)
      super(top_margin: 20)
      @relatorio = relatorio
      @usuario_matricula = usuario_matricula
        fill_color "40464e"
        font_size 9
  
        image "#{Rails.root}/app/assets/images/cabecalho.png", :width => 550
        move_down 50
        text "<b>CARTA DE APRENSETAÇÃO</b>", align: :center, size: 30
        move_down 30
        text "<b>À:</b>Direção da Instituição de Ensino #{current_user.nome_da_instituicao}", align: :left, size: 24
        move_down 20
        text "<b>Assunto: Apresentação de discente-estagiário</b>",align: :left
  
        @relatorio.each do |relatorio|
          if(relatorio.matricula_aluno == @usuario_matricula)
            move_down 30
            text "Prezado Gestor", align: :justify, :inline_format => true, :leading => 10
            move_down 30
            text "O IFFluminense <i>campus</i> Campos Centro apresenta o(a) licenciando(a)-estagiário(a) #{current_user.nome_social}, matriculado(a), neste instituto, no #{current_user.periodo}", align: :justify, :inline_format => true
            text "do Curso Superior de Licenciatura em #{current_user.licenciatura}, no #{current_user.semestre} semestre letivo de #{current_user.ano}, para fins de cumprimento das atividades do Estágio Curricualr"
            text "Supervisionado no campo de estágio dessa Instituição Concedente, prescristas no Plano de Atividades de Estágio(PAE), conforme Calendário Acadêmico deste <i>Campus</i>, em"
            text "atendimento a carga horária total destinada ao período em curso".
            move_down 30
            text "Ressaltamos que o Estágio Curricular Supervisionado é componente obrigatório e de importância significativa para a formação dos futuros formadores."
            text "Agradecemos a atenção sempre nos concedida e a seriedade com que os profissionais da educação têm acolhido e acompanhado nossos(as) licenciados(as)."
            move_down 10
            text "Sem mais, colocamo-nos à disposição para quaisquer esclarecimentos e registramos, nesta, os contatos com DIRLIC/NAPP"
            move_down 30
            text "(22) 2726-2897 // dirlicenciatura.camposcentro@iff.edu.br, bem como o site licenciaturas.centro.iff.edu"
          end
        end
    end
  end