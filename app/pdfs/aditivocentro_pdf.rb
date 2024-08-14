class AditivocentroPdf < Prawn::Document
    def initialize(relatorio, current_user, usuario_matricula)
      super(top_margin: 85.0393, left_margin: 85.0393, right_margin: 56.6929, bottom_margin: 56.6929)
      @relatorio = relatorio
      @usuario_matricula = usuario_matricula
      Prawn::Fonts::AFM.hide_m17n_warning = true
      fill_color(0,0,0,100)
      font_size 12

      font_families.update(
        "Calibri" => {
          normal: Rails.root.join('app', 'assets', 'Fonts', 'Calibri Regular.ttf'),
          bold: Rails.root.join('app', 'assets', 'Fonts', 'Calibri Bold.TTF'),
          italic: Rails.root.join('app', 'assets', 'Fonts', 'Calibri Italic.ttf'),
          bold_italic: Rails.root.join('app', 'assets', 'Fonts', 'Calibri Bold Italic.ttf'),
          light: Rails.root.join('app', 'assets', 'Fonts', 'Calibri Light.ttf'),
          light_italic: Rails.root.join('app', 'assets', 'Fonts', 'Calibri Light Italic.ttf')
        }
      )
  
      # Use a fonte Calibri
      font "Calibri"
        image "#{Rails.root}/app/assets/images/cabecalho.png", at: [-50, 680], :width => 550
        move_down 40
        
        repeat(1..5, dynamic: true) do
          draw_text "#{page_number}", at: [490, 700]
         end

        @relatorio.each do |relatorio|
          if(relatorio.matricula_aluno == @usuario_matricula)
            if relatorio.nome_social_termo.blank?
            move_down 20
            text "<b>TERMO ADITIVO DE ESTÁGIO</b>", align: :center, size: 15, :inline_format => true, :leading => 10
            move_down 10
            text "<b>Seguradora: </b>#{relatorio.seguradora}",align: :center, :inline_format => true, size:12, :leading => 10
            move_down 5
            text "<b>Apólice de seguro nº: </b>#{relatorio.apolice} ", align: :center, :inline_format => true, size:12, :leading => 10
            move_down 10
            text "Aditamento ao Termo de Compromisso de Estágio, Ato representado pela  <b>Diretoria de Ensino Superior das Licenciaturas do CAMPUS CAMPOS CENTRO - INSTITUIÇÃO PROMOTORA E CONCEDENTE</b> -, inscrito no CNPJ/MF sob o nº 10.779.511/0002-98, situada na Rua Doutor Siqueira, nº 273, Bairro: Parque Dom Bosco, município: Campos dos Goytacazes/RJ, CEP: 28.030-130, telefone (22) 27262897, <b>firma parceria</b>, em atendimento à Lei Nº 11.788, de 25/09/2008, com a <b>Diretoria de Ensino da Educação Básica e Profissional, para fins de continuidade do Estágio Curricular Supervisionado dos Cursos de Licenciatura</b>, em atendimento à Lei Nº 11.788, de 25/09/2008, ao(à) <b>LICENCIANDO(A)</b>", align: :justify, :inline_format => true, :leading => 10
            move_down 10
            text "<b>#{relatorio.aluno_apresentacao}</b>", align: :center, :inline_format => true, size: 16, :leading => 10 
            move_down 10
            text "matrícula nº #{relatorio.matricula_aluno} do #{relatorio.periodo} período do Curso Superior de Licenciatura em #{relatorio.licenciatura}.", align: :justify, :inline_format => true, :leading => 10
            move_down 20
            text "<b>Cláusula Primeira:</b>", align: :left, :inline_format => true, :leading => 10
            text "O PRESENTE TERMO ADITIVO INCLUI:", align: :left, :inline_format => true, :leading => 10 
            text "<b>(X)</b> O componente curricular #{relatorio.estagio} no #{relatorio.aluno_semestre} semestre do ano letivo #{relatorio.ano}.", align: :justify, :inline_format => true, :leading => 10
  

            move_down 120
            text "Claúsula Segunda", align: :center, size: 16
            move_down 20
            text "Permanecem válidas todas as demais disposições do Termo de Compromisso celebrado, do qual passa a ser integrante este Termo Aditivo.
            E, por estarem justas e contratadas, assinam as partes, o presente Termo Aditivo em 03 (três) vias de igual teor e forma.", align: :justify
            move_down 20
  
            
            text "Campos dos Goytacazes, RJ, #{relatorio.data}", align: :center, :inline_format => true
  
            move_down 50
            text "Concedente: _________________________________________________", :inline_format => true
  
            move_down 60
            text "IFFluminense Campus Campos Centro: "
            stroke_horizontal_rule
            pad_top(20) { }

            move_down 30
            text "Licenciando(a) Estagiário(a): ______________________________________________________________", :inline_format => true

            else
                  text "<b>TERMO ADITIVO DE ESTÁGIO</b>", align: :center, size: 15, :inline_format => true, :leading => 10
                  move_down 10
                  text "<b>Seguradora: </b>#{relatorio.seguradora}",align: :center, :inline_format => true, size:12, :leading => 10
                  move_down 5
                  text "<b>Apólice de seguro nº: </b>#{relatorio.apolice} ", align: :center, :inline_format => true, size:12, :leading => 10
                  move_down 10
                  text "Aditamento ao Termo de Compromisso de Estágio, Ato representado pela  <b>Diretoria de Ensino Superior das Licenciaturas do CAMPUS CAMPOS CENTRO - INSTITUIÇÃO PROMOTORA E CONCEDENTE</b> -, inscrito no CNPJ/MF sob o nº 10.779.511/0002-98, situada na Rua Doutor Siqueira, nº 273, Bairro: Parque Dom Bosco, município: Campos dos Goytacazes/RJ, CEP: 28.030-130, telefone (22) 27262897, <b>firma parceria</b>, em atendimento à Lei Nº 11.788, de 25/09/2008, com a <b>Diretoria de Ensino da Educação Básica e Profissional, para fins de continuidade do Estágio Curricular Supervisionado dos Cursos de Licenciatura</b>, em atendimento à Lei Nº 11.788, de 25/09/2008, ao(à) <b>LICENCIANDO(A)</b>", align: :justify, :inline_format => true, :leading => 10
                  move_down 10
                  text "<b>#{relatorio.aluno_apresentacao} (#{relatorio.aluno_apresentacao_dois}) </b>", align: :center, :inline_format => true, size: 16, :leading => 10 
                  move_down 10
                  text "matrícula nº #{relatorio.matricula_aluno} do #{relatorio.periodo} período do Curso Superior de Licenciatura em #{relatorio.licenciatura}.", align: :justify, :inline_format => true, :leading => 10
                  move_down 20
                  text "<b>Cláusula Primeira:</b>", align: :left, :inline_format => true, :leading => 10
                  text "O PRESENTE TERMO ADITIVO INCLUI:", align: :left, :inline_format => true, :leading => 10 
                  text "<b>(X)</b> O componente curricular #{relatorio.estagio} no #{relatorio.aluno_semestre} semestre do ano letivo #{relatorio.ano}.", align: :justify, :inline_format => true, :leading => 10
        
      
                  move_down 120
                  text "Cláusula Segunda", align: :center, size: 16
                  move_down 20
                  text "Permanecem válidas todas as demais disposições do Termo de Compromisso celebrado, do qual passa a ser integrante este Termo Aditivo.
                  E, por estarem justas e contratadas, assinam as partes, o presente Termo Aditivo em 03 (três) vias de igual teor e forma.", align: :justify
                  move_down 20
        
                  
                  text "Campos dos Goytacazes, RJ, #{relatorio.data}", align: :center, :inline_format => true
        
                  move_down 50
                  text "Concedente: _________________________________________________", :inline_format => true
        
                  move_down 60
                  text "IFFluminense Campus Campos Centro: "
                  stroke_horizontal_rule
                  pad_top(20) { }
      
                  move_down 30
                  text "Licenciando(a) Estagiário(a): ______________________________________________________________", :inline_format => true
            end

          end
        end
    end
  end