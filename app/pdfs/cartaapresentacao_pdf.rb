class CartaapresentacaoPdf< Prawn::Document
    def initialize(relatorio, current_user, usuario_matricula)
        super(top_margin: 85.0393, left_margin: 85.0393, right_margin: 56.6929, bottom_margin: 56.6929)
        @relatorio = relatorio
        @usuario_matricula = usuario_matricula
        fill_color "40464e"
        font_size 9
    
        image "#{Rails.root}/app/assets/images/cabecalho.png", at: [-30, 680], width: 500
        move_down 60
        move_down 10
        text "<b>CARTA DE APRESENTAÇÃO</b>", align: :center, size: 15, inline_format: true, leading: 10
        move_down 5
    
        @relatorio.each do |relatorio|
          if relatorio.matricula_aluno == @usuario_matricula
            draw_text "Campos dos Goytacazes, RJ, #{relatorio.data}", at: [240, 600], inline_format: true
            move_down 20
            text "<b>DA:</b> Diretoria de Ensino Superior dos Cursos de Licenciatura/Núcleo de Apoio à Prática Profissional (NAPP) do IFFluminense campus Campos Centro", align: :left, size: 12, inline_format: true
            move_down 20
            text "<b>À:</b><b>Direção da Instituição de Ensino:</b> #{relatorio.instituicao_apresentacao}", align: :left, size: 12, inline_format: true
            move_down 10
            text "<b>Assunto: Apresentação do Discente-Estagiário:</b> #{relatorio.aluno_apresentacao}", align: :left, size: 12, inline_format: true, leading: 10
            move_down 10
            text "Prezado Gestor.", align: :justify, inline_format: true, leading: 10
            move_down 5
            text "O IFFluminense <i>campus</i> Campos Centro apresenta o(a) licenciando(a)-estagiário(a): #{relatorio.aluno_apresentacao_dois}, matriculado(a), neste instituto, no #{relatorio.periodo} período do Curso Superior de Licenciatura em #{relatorio.licenciatura}, no #{relatorio.semestre_apresentacao} semestre letivo de #{relatorio.ano_apresentacao}, para fins de cumprimento das atividades do Estágio Curricular Supervisionado no campo de estágio dessa Instituição Concedente, prescristas no Plano de Atividades de Estágio(PAE), conforme Calendário Acadêmico deste <i>Campus</i>, em atendimento a carga horária total destinada ao período em curso.", align: :left, inline_format: true, leading: 10
            move_down 10
            text "Ressaltamos que o Estágio Curricular Supervisionado é componente obrigatório e de importância significativa para a formação dos futuros formadores. Agradecemos a atenção sempre nos concedida e a seriedade com que os profissionais da educação têm acolhido e acompanhado nossos(as) licenciados(as). Sem mais, colocamo-nos à disposição para quaisquer esclarecimentos e registramos, nesta, os contatos com DIRLIC/NAPP (22) 2726-2897 // dirlicenciatura.camposcentro@iff.edu.br, bem como o site licenciaturas.centro.iff.edu.", align: :left, inline_format: true, leading: 10
            move_down 20
    
            %i[center].each do |position|
              draw_text "Atenciosamente,", at: [200, 170], inline_format: true
              image "#{Rails.root}/app/assets/images/logo_dirlic.png", position: position
              move_down 50
            end
            end
        end
      end
    end
    