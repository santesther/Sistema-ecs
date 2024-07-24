class EstadualaditivoPdf< Prawn::Document
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
        move_down 60        
        
        repeat(1..5, dynamic: true) do
          draw_text "#{page_number}", at: [490, 700]
         end

        @relatorio.each do |relatorio|
          if(relatorio.matricula_aluno == @usuario_matricula)
            draw_text "Campos dos Goytacazes, RJ, #{relatorio.data}", at: [240, 600], :inline_format => true
            move_down 5
            text "<b>TERMO ADITIVO DE ESTÁGIO</b>", align: :center, size: 15, :inline_format => true, :leading => 10
            text "<b>Seguradora: </b>#{relatorio.seguradora}",align: :center, :inline_format => true, size: 12, :leading => 10
            text "<b>Apólice de seguro nº: </b>#{relatorio.apolice} ", align: :center, :inline_format => true, size: 12, :leading => 10
            move_down 10
            text "O <b>INSTITUTO FEDERAL FLUMINENSE</b> neste Ato representado por Marlúcia Cereja de Alencar <b>Diretora de Ensino Superior das Licenciaturas do CAMPUS CAMPOS CENTRO - INSTITUIÇÃO PROMOTORA -</b>, inscrito no CNPJ/MF sob o nº 10.779.511/0002-98, situada na Rua Doutor Siqueira, nº 273, Bairro: Parque Dom Bosco, município: Campos dos Goytacazes/RJ, CEP: 28.030-130, telefone (22) 27262897, firma parceria, em atendimento à Lei Nº 11.788, de 25/09/2008, com o(a) <b>#{relatorio.instituicao_apresentacao}</b> - <b>Instituição de Ensino CONCEDENTE -</b> inscrito no CNPJ/MF sob o nº #{relatorio.cnpj}, situado no(a) #{relatorio.endereco_da_instituicao}, nº: #{relatorio.numero_da_instituicao}, Bairro: #{relatorio.bairro_da_instituicao}, no município de #{relatorio.municipio_da_instituicao}, Estado do #{relatorio.estado_da_instituicao}, CEP: #{relatorio.cep_da_instituicao}, telefone #{relatorio.telefone_da_instituicao}, representado por <b>#{relatorio.representante_da_instituicao}, para fins de continuidade do Estágio Curricular Supervisionado dos Cursos de Licenciatura</b>, ao(à) <b>LICENCIANDO(A)</b>", align: :justify, :inline_format => true, :leading => 10
            move_down 10
            text "<b>#{relatorio.aluno_apresentacao}</b>", align: :center, size: 16, :inline_format => true, :leading => 10 
            move_down 10
            text "matrícula nº #{relatorio.matricula_aluno} do #{relatorio.semestre_apresentacao } semestre do ano letivo #{relatorio.ano} do Curso Superior de Licenciatura em #{relatorio.licenciatura}.", align: :justify, :inline_format => true, :leading => 10
            
            move_down 20
            text "<b>Cláusula Primeira:</b>", align: :left, :inline_format => true, :leading => 5
            text "O PRESENTE TERMO ADITIVO INCLUI:", align: :left, :inline_format => true, :leading => 5 
            text "<b>(X)</b> O componente curricular #{relatorio.estagio} no semestre do ano letivo #{relatorio.ano_apresentacao}.", align: :justify, :inline_format => true, :leading => 10
              
            move_down 90
            text "CLÁUSULA SEGUNDA", align: :center, size: 16
            move_down 20
            text "Permanecem válidas todas as demais disposições do Termo de Compromisso celebrado, do qual passa a ser integrante este Termo Aditivo.
            E, por estarem justas e contratadas, assinam as partes, o presente Termo Aditivo em 03 (três) vias de igual teor e forma.", align: :justify
            move_down 20
  
            
            text "Campos dos Goytacazes, RJ, #{relatorio.data}</u>", align: :center, :inline_format => true
  
            move_down 50
            text "Concedente: _________________________________________________", :inline_format => true
  
            move_down 60
            text "IFFluminense campus Campos Centro: "
            stroke_horizontal_rule
            pad_top(20) { }

            move_down 30
            text "Licenciando(a) Estagiário(a): ______________________________________________________________", :inline_format => true

          
          end
        end
    end
  end