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
            text "<b>DA:</b><u> Diretoria de Ensino Superior dos Cursos de Licenciatura/Núcleo de Apoio à Prática Profissional (NAPP) do IFFluminense campus Campos Centro</u>", align: :left, size: 12, inline_format: true
            move_down 20
            text "<b>À:</b><b>Direção da Instituição de Ensino:</b> <u>#{relatorio.instituicao_apresentacao}</u>", align: :left, size: 12, inline_format: true
            move_down 10
            text "<b>Assunto: Apresentação do Discente-Estagiário:</b> <u>#{relatorio.aluno_apresentacao}</u>", align: :left, size: 12, inline_format: true, leading: 10
            move_down 10
            text "Prezado Gestor.", align: :justify, inline_format: true, leading: 10
            move_down 5
            text "O IFFluminense <i>campus</i> Campos Centro apresenta o(a) licenciando(a)-estagiário(a): <u>#{relatorio.aluno_apresentacao_dois}</u>, matriculado(a), neste instituto, no <u>#{relatorio.periodo}</u> período do Curso Superior de Licenciatura em <u>#{relatorio.licenciatura}</u>, no <u>#{relatorio.semestre_apresentacao}</u> semestre letivo de <u>#{relatorio.ano_apresentacao}</u>, para fins de cumprimento das atividades do Estágio Curricular Supervisionado no campo de estágio dessa Instituição Concedente, prescristas no Plano de Atividades de Estágio(PAE), conforme Calendário Acadêmico deste <i>Campus</i>, em atendimento a carga horária total destinada ao período em curso.", align: :left, inline_format: true, leading: 10
            move_down 10
            text "Ressaltamos que o Estágio Curricular Supervisionado é componente obrigatório e de importância significativa para a formação dos futuros formadores. Agradecemos a atenção sempre nos concedida e a seriedade com que os profissionais da educação têm acolhido e acompanhado nossos(as) licenciados(as). Sem mais, colocamo-nos à disposição para quaisquer esclarecimentos e registramos, nesta, os contatos com DIRLIC/NAPP (22) 2726-2897 // dirlicenciatura.camposcentro@iff.edu.br, bem como o site licenciaturas.centro.iff.edu", align: :left, inline_format: true, leading: 10
            move_down 20
    
            %i[center].each do |position|
              draw_text "Atenciosamente,", at: [200, 170], inline_format: true
              image "#{Rails.root}/app/assets/images/logo_dirlic.png", position: position
              move_down 50
            end
    
            if relatorio.avaliador == "Edina Lacerda"
              bounding_box([-10, cursor], width: 150, height: 100) do
                transparent(0) { stroke_bounds }
                %i[left].each do |vposition|
                  image "#{Rails.root}/app/assets/images/carimbo_edina.png", width: 300, position: :left, vposition: -60
                end
                bounding_box([10, cursor], width: 400, height: 450) do
                  transparent(0) { stroke_bounds }
                  %i[center].each do |vposition|
                    image "#{Rails.root}/app/assets/images/assinatura_edina.png", width: 150, position: :left, vposition: -165
                  end
                end
              end
            elsif relatorio.avaliador == "Elizabeth Freitas"
              bounding_box([-10, cursor], width: 150, height: 100) do
                transparent(0) { stroke_bounds }
                %i[left].each do |vposition|
                  image "#{Rails.root}/app/assets/images/carimbo_Elizabeth.png", width: 250, position: :left, vposition: -75
                end
                bounding_box([55, cursor], width: 400, height: 450) do
                  transparent(0) { stroke_bounds }
                  %i[center].each do |vposition|
                    image "#{Rails.root}/app/assets/images/assinatura_elizabeth.png", width: 140, position: :left, vposition: -195
                  end
                end
              end
            elsif relatorio.avaliador == "Virginia Ribeiro"
              bounding_box([-10, cursor], width: 150, height: 100) do
                transparent(0) { stroke_bounds }
                %i[left].each do |vposition|
                  image "#{Rails.root}/app/assets/images/carimbo_virginia_certo.png", width: 200, position: :left, vposition: -75
                end
                bounding_box([0, cursor], width: 400, height: 450) do
                  transparent(0) { stroke_bounds }
                  %i[center].each do |vposition|
                    image "#{Rails.root}/app/assets/images/assinatura_virginia_ok.png", width: 220, position: :left, vposition: -210
                  end
                end
              end
            elsif relatorio.avaliador == "Marlúcia Cereja"
              bounding_box([-10, cursor], width: 150, height: 100) do
                transparent(0) { stroke_bounds }
                %i[left].each do |vposition|
                  image "#{Rails.root}/app/assets/images/carimbo_marlucia_ok.png", width: 185, position: :left, vposition: -75
                end
                bounding_box([55, cursor], width: 400, height: 450) do
                  transparent(0) { stroke_bounds }
                  %i[center].each do |vposition|
                    image "#{Rails.root}/app/assets/images/assinatura_marlucia.png", width: 140, position: :left, vposition: -195
                  end
                end
              end
            else
              text "Usuário não cadastrado"
            end
            move_down 10
          end
        end
      end
    end
    