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
              move_down 40
            text "<b>TERMO ADITIVO DE ESTÁGIO</b>", align: :center, size: 15, :inline_format => true, :leading => 10
            move_down 40
            text "<b>Seguradora: </b>#{relatorio.seguradora}",align: :center, :inline_format => true, size:12, :leading => 10
            text "<b>Apólice de seguro nº: </b>#{relatorio.apolice} ", align: :center, :inline_format => true, size:12, :leading => 10
            move_down 20
            text "Aditamento ao Termo de Compromisso de Estágio, Ato representado pela  <b>Diretoria de Ensino dos Cursos Superiores de Licenciatura do CAMPUS CAMPOS CENTRO - INSTITUIÇÃO PROMOTORA E CONCEDENTE</b> -, inscrito no CNPJ/MF sob o nº 10.779.511/0002-98, situada na Rua Doutor Siqueira, nº 273, Bairro: Parque Dom Bosco, município: Campos dos Goytacazes/RJ, CEP: 28.030-130, telefone (22) 27262897, <b>firma parceria</b>, em atendimento à Lei Nº 11.788, de 25/09/2008, com a <b>Diretoria de Ensino da Educação Básica e Profissional, para fins de continuidade do Estágio Curricular Supervisionado dos Cursos de Licenciatura</b>, em atendimento à Lei Nº 11.788, de 25/09/2008, ao(à) <b>LICENCIANDO(A)</b>", align: :justify, :inline_format => true, :leading => 10
            move_down 10
            text "#{relatorio.aluno_apresentacao}", align: :center, size:12, :inline_format => true, :leading => 10 
            move_down 10
            text "matrícula nº #{relatorio.matricula_aluno} do #{relatorio.periodo} do Curso Superior de Licenciatura em #{relatorio.licenciatura}.", align: :justify, :inline_format => true, :leading => 10
            move_down 20
            text "<b>Cláusula Primeira:</b>", align: :left, :inline_format => true, :leading => 10
            text "O PRESENTE TERMO ADITIVO INCLUI:", align: :left, :inline_format => true, :leading => 10 
            text "<b>(X)</b> O componente curricular #{relatorio.estagio} no semestre do ano letivo #{relatorio.ano}.", align: :justify, :inline_format => true, :leading => 10
  

            move_down 180
            text "CLÁUSULA SEGUNDA", align: :center, size: 16
            move_down 20
            text "Permanecem válidas todas as demais disposições do Termo de Compromisso celebrado, do qual passa a ser integrante este Termo Aditivo.
            E, por estarem justas e contratadas, assinam as partes, o presente Termo Aditivo em 03 (três) vias de igual teor e forma.", align: :justify
            move_down 20
  
            
            text "Campos dos Goytacazes, RJ, #{relatorio.data}", align: :center, :inline_format => true
  
            move_down 50
            text "Concedente: _________________________________________________", :inline_format => true
  
            move_down 60
            text "IFFluminense <i>campus</i> Campos Centro: "
            stroke_horizontal_rule
            pad_top(20) { }

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