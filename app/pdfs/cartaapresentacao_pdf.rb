class CartaapresentacaoPdf< Prawn::Document
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
    
        image "#{Rails.root}/app/assets/images/cabecalho.png", at: [-30, 680], width: 500
        move_down 60
        move_down 10
        text "<b>CARTA DE APRESENTAÇÃO</b>", align: :center, size: 15, inline_format: true, leading: 10
        move_down 5
    
        @relatorio.each do |relatorio|
          if relatorio.matricula_aluno == @usuario_matricula
            draw_text "Campos dos Goytacazes, RJ, #{relatorio.data}", at: [240, 600], inline_format: true
            move_down 20
            text "<b>DA:</b> Diretoria de Ensino Superior da Licenciaturas do IFFluminense <i>Campus</i> Campos Centro (DIRESLCC).", align: :left, size: 12, inline_format: true
            move_down 20
            text "<b>À:</b><b>Direção da Instituição de Ensino:</b> #{relatorio.instituicao_apresentacao}", align: :left, size: 12, inline_format: true
            move_down 10
            text "Assunto: Apresentação de licenciando(a)-estagiário."
            move_down 10
            text "Prezado Gestor.", align: :justify, inline_format: true, leading: 10
            move_down 5
            text "O IFFluminense <i>Campus</i> Campos Centro apresenta o(a) licenciando(a)-estagiário(a) #{relatorio.aluno_apresentacao_dois}, matriculado(a) neste instituto no #{relatorio.periodo} período do Curso Superior de Licenciatura em #{relatorio.licenciatura}, no #{relatorio.semestre_apresentacao} semestre letivo de #{relatorio.ano_apresentacao}, para fins de cumprimento das atividades do Estágio Curricular Supervisionado no campo de estágio dessa Instituição Concedente, previstas no Plano de Atividades de Estágio(PAE), em atendimento à carga horária total destinada ao período em curso.", align: :left, inline_format: true, leading: 10
            move_down 10
            text "Ressaltamos que o Estágio Curricular Supervisionado é componente obrigatório, e não remunerado, e de importância significativa para a formação docente. Agradecemos a atenção sempre nos concedida e a seriedade com que os profissionais da educação têm acolhido e acompanhado nossos(as) licenciados(as). Estamos à disposição para quaisquer esclarecimentos por meio dos contatos: (22) 2726-2897  e dirlicenciatura.camposcentro@iff.edu.br.", align: :left, inline_format: true, leading: 10
            move_down 20
    
            text "Atenciosamente,", align: :center, inline_format: true, leading: 10
            text "Marlúcia Cereja de Alencar.", align: :center, inline_format: true, leading: 10
            end
        end
      end
    end
    