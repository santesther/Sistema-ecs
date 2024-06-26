class AditivocentroPdf < Prawn::Document
    def initialize(relatorio, current_user, usuario_matricula)
      super(top_margin: 85.0393, left_margin: 85.0393, right_margin: 56.6929, bottom_margin: 56.6929)
      @relatorio = relatorio
      @usuario_matricula = usuario_matricula
        fill_color "40464e"
        font_size 9

        image "#{Rails.root}/app/assets/images/cabecalho.png", at: [-50, 680], :width => 550
        
        repeat(2..5, dynamic: true) do
          draw_text "#{page_number-1}", at: [490, 700]
         end

        @relatorio.each do |relatorio|
          if(relatorio.matricula_aluno == @usuario_matricula)
              draw_text "Campos dos Goytacazes, RJ, #{relatorio.data}", at: [240, 600], :inline_format => true
              move_down 90


            text "<b>TERMO ADITIVO DE ESTÁGIO</b> (Período letivo: <b><u>#{relatorio.periodo_letivo})</u></b>", align: :center, size: 15, :inline_format => true, :leading => 10
            text "<b>Seguradora: </b><u>#{relatorio.seguradora}</u>",align: :center, :inline_format => true, size:12, :leading => 10
            text "<b>Apólice de seguro nº: </b><u>#{current_user.apolice}</u> ", align: :center, :inline_format => true, size:12, :leading => 10
            move_down 20
            text "Aditamento ao Termo de Compromisso de Estágio, Ato representado pela  <b>Diretoria de Ensino dos Cursos Superiores de Licenciatura do CAMPUS CAMPOS CENTRO - INSTITUIÇÃO PROMOTORA E CONCEDENTE</b> -, inscrito no CNPJ/MF sob o nº 10.779.511/0002-98, situada na Rua Doutor Siqueira, nº 273, Bairro: Parque Dom Bosco, município: Campos dos Goytacazes/RJ, CEP: 28.030-130, telefone (22) 27262897, <b>firma parceria</b>, em atendimento à Lei Nº 11.788, de 25/09/2008, com a <b>Diretoria de Ensino da Educação Básica e Profissional, para fins de continuidade do Estágio Curricular Supervisionado dos Cursos de Licenciatura</b>, em atendimento à Lei Nº 11.788, de 25/09/2008, ao(à) <b>LICENCIANDO(A)</b>", align: :justify, :inline_format => true, :leading => 10
            move_down 10
            text "<u>#{relatorio.aluno_apresentacao}</u>", align: :center, size:12, :inline_format => true, :leading => 10 
            move_down 10
            text "matrícula nº <u>#{relatorio.matricula_aluno}</u> do <u>#{relatorio.periodo}</u> do Curso Superior de Licenciatura em <u>#{relatorio.licenciatura}</u>.", align: :justify, :inline_format => true, :leading => 10
            move_down 20
            text "<b>Cláusula Primeira:</b>", align: :left, :inline_format => true, :leading => 10
            text "O PRESENTE TERMO ADITIVO ALTERA:", align: :left, :inline_format => true, :leading => 10 
            text "(<b>X</b>) O período do término do estágio para: <b><u>#{relatorio.periodo_a}</u></b>", align: :justify, :inline_format => true, :leading => 10
            text "<b>Observação:</b> Termo Aditivo => justifica-se pelo(a) discente ter desenvolvido as atividades do Estágio Curricular Supervisionado <u>#{relatorio.periodo_dirlic}</u> período no Campus Campos Centro do IFFluminense, no <u>#{relatorio.semestre_dirlic}</u> semestre letivo de <u>#{relatorio.ano}</u>.", align: :justify, :inline_format => true, :leading => 10
    
            if relatorio.avaliador == "Edina Lacerda"
              bounding_box([-10, cursor], width: 150, height: 100) do
                transparent(0) { stroke_bounds }
                %i[left].each do |vposition|
                image "#{Rails.root}/app/assets/images/carimbo_edina.png", :width => 300,
                position: :left, vposition: 40
                end
                bounding_box([10, cursor], width: 400, height: 450) do
                  transparent(0) { stroke_bounds }
                  %i[center].each do |vposition|
                  image "#{Rails.root}/app/assets/images/assinatura_edina.png", :width => 150,
                  position: :left, vposition: -60
              end
            end
          end
            elsif relatorio.avaliador == "Elizabeth Freitas"
              bounding_box([-10, cursor], width: 150, height: 100) do
                transparent(0) { stroke_bounds }
                %i[left].each do |vposition|
                image "#{Rails.root}/app/assets/images/carimbo_Elizabeth.png", :width => 250,
                position: :left, vposition: 40
                end
                bounding_box([55, cursor], width: 400, height: 450) do
                  transparent(0) { stroke_bounds }
                  %i[center].each do |vposition|
                  image "#{Rails.root}/app/assets/images/assinatura_elizabeth.png", :width => 140,
                  position: :left, vposition: -80
              end
            end
          end
          elsif relatorio.avaliador == "Virginia Ribeiro"
              bounding_box([-10, cursor], width: 150, height: 100) do
                transparent(0) { stroke_bounds }
                %i[left].each do |vposition|
                image "#{Rails.root}/app/assets/images/carimbo_virginia_certo.png", :width => 200,
                position: :left, vposition: 40
                end
                bounding_box([0, cursor], width: 400, height: 450) do
                  transparent(0) { stroke_bounds }
                  %i[center].each do |vposition|
                  image "#{Rails.root}/app/assets/images/assinatura_virginia_ok.png", :width => 220,
                  position: :left, vposition: -90
              end
            end
          end
          elsif relatorio.avaliador == "Marlúcia Cereja"
              bounding_box([-10, cursor], width: 150, height: 100) do
                transparent(0) { stroke_bounds }
                %i[left].each do |vposition|
                image "#{Rails.root}/app/assets/images/carimbo_marlucia_ok.png", :width => 185,
                position: :left, vposition: 40
                end
                bounding_box([55, cursor], width: 400, height: 450) do
                  transparent(0) { stroke_bounds }
                  %i[center].each do |vposition|
                  image "#{Rails.root}/app/assets/images/assinatura_marlucia.png", :width => 140,
                  position: :left, vposition: -80
              end
            end
          end
          else 
            text "Usuário não cadastrado"
          end
  

            move_down 110
            text "CLÁUSULA SEGUNDA", align: :center, size: 16
            move_down 20
            text "Permanecem válidas todas as demais disposições do Termo de Compromisso celebrado, do qual passa a ser integrante este Termo Aditivo.
            E, por estarem justas e contratadas, assinam as partes, o presente Termo Aditivo em 03 (três) vias de igual teor e forma.", align: :justify
            move_down 20
  
            
            text "Campos dos Goytacazes, RJ, <u>#{relatorio.data}</u>", align: :center, :inline_format => true
  
            move_down 50
            text "Concedente: _________________________________________________", :inline_format => true
  
            move_down 60
            text "IFFluminense <i>campus</i> Campos Centro: "
            stroke_horizontal_rule
            pad_top(20) { }
              if relatorio.avaliador == "Edina Lacerda"
                bounding_box([65, cursor], width: 150, height: 100) do
                  transparent(0) { stroke_bounds }
                  %i[center].each do |vposition|
                  image "#{Rails.root}/app/assets/images/carimbo_edina.png", :width => 300,
                  position: :center, vposition: -10
                  end
                  bounding_box([55, cursor], width: 400, height: 450) do
                    transparent(0) { stroke_bounds }
                    %i[center].each do |vposition|
                    image "#{Rails.root}/app/assets/images/assinatura_edina.png", :width => 150,
                    position: :center, vposition: -120
                end
              end
            end
              elsif relatorio.avaliador == "Elizabeth Freitas"
                bounding_box([50, cursor], width: 150, height: 100) do
                  transparent(0) { stroke_bounds }
                  %i[center].each do |vposition|
                  image "#{Rails.root}/app/assets/images/carimbo_Elizabeth.png", :width => 250,
                  position: :center, vposition: 5
                  end
                  bounding_box([55, cursor], width: 400, height: 450) do
                    transparent(0) { stroke_bounds }
                    %i[center].each do |vposition|
                    image "#{Rails.root}/app/assets/images/assinatura_elizabeth.png", :width => 140,
                    position: :center, vposition: -150
                end
              end
            end
           elsif relatorio.avaliador == "Virginia Ribeiro"
                bounding_box([-10, cursor], width: 150, height: 100) do
                  transparent(0) { stroke_bounds }
                  %i[left].each do |vposition|
                  image "#{Rails.root}/app/assets/images/carimbo_virginia_certo.png", :width => 200,
                  position: :left, vposition: -5
                  end
                  bounding_box([280, cursor], width: 400, height: 450) do
                    transparent(0) { stroke_bounds }
                    %i[center].each do |vposition|
                    image "#{Rails.root}/app/assets/images/assinatura_virginia_ok.png", :width => 220,
                    position: :left, vposition: -170
                end
              end
            end
            elsif relatorio.avaliador == "Marlúcia Cereja"
                bounding_box([-10, cursor], width: 150, height: 100) do
                  transparent(0) { stroke_bounds }
                  %i[left].each do |vposition|
                  image "#{Rails.root}/app/assets/images/carimbo_marlucia_ok.png", :width => 185,
                  position: :left, vposition: -5
                  end
                  bounding_box([280, cursor], width: 400, height: 450) do
                    transparent(0) { stroke_bounds }
                    %i[center].each do |vposition|
                    image "#{Rails.root}/app/assets/images/assinatura_marlucia.png", :width => 140,
                    position: :left, vposition: -150
                end
              end
            end
            else 
              text "Usuário não cadastrado"
            end

            move_down 30
            text "Licenciando(a) Estagiário(a): ______________________________________________________________", :inline_format => true


            move_down 140
            %i[center].each do |position|
              image "#{Rails.root}/app/assets/images/logo_dirlic.png", position: position
              end
          end
        end
    end
  end