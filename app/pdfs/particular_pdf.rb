class ParticularPdf < Prawn::Document
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
     
        repeat(1..7, dynamic: true) do
          draw_text "#{page_number}", at: [490, 700]
         end
  
        @relatorio.each do |relatorio|
          if(relatorio.matricula_aluno == @usuario_matricula)
            draw_text "Campos dos Goytacazes, RJ, #{relatorio.data}", at: [240, 600], :inline_format => true
            move_down 5
            text "Termo de Compromisso de Estágio - TCE", align: :center, size: 24
            move_down 10
            text "<b>Seguradora: </b>#{relatorio.seguradora}", align: :center, size: 12, :inline_format => true, :leading => 10
            move_down 5
            text "<b>Apólice de seguro: </b>#{relatorio.apolice}",align: :center, size: 12, :inline_format => true, :leading => 10
            move_down 10

            text "O <b>INSTITUTO FEDERAL FLUMINENSE <i>CAMPUS</i> CAMPOS CENTRO</b> neste Ato representado por Marlúcia Cereja de Alencar <b>Diretora de Ensino Superior das Licenciaturas (DIRESLCC) - INSTITUIÇÃO PROMOTORA -</b>, inscrita no CNPJ/MF sob o nº 10.779.511/0002-98, situada na Rua Doutor Siqueira, nº 273, Parque Dom Bosco, Campos dos Goytacazes/RJ, CEP: 28.030-130, telefone (22) 27262897, <b>firma parceria</b>, em atendimento à Lei Nº 11.788, de 25/09/2008, com a Instituição de Ensino <b>#{relatorio.instituicao_apresentacao} - CONCEDENTE -</b> inscrita no CNPJ/MF sob o nº #{relatorio.cnpj}, situada no(a) #{relatorio.endereco_da_instituicao}, nº #{relatorio.numero_da_instituicao}, Bairro #{relatorio.bairro_da_instituicao}, no munícipio de #{relatorio.municipio_da_instituicao}, Estado do #{relatorio.estado_da_instituicao}, CEP: #{relatorio.cep_da_instituicao}, telefone #{relatorio.telefone_da_instituicao}, representada por <b>#{relatorio.representante_da_instituicao}, para fins de abertura de campo de Estágio Curricular Supervisionado dos Cursos de Licenciatura</b>, ao(à) <b>LICENCIANDO(A)</b>", align: :justify, :inline_format => true, :leading => 10
            move_down 10
            text "<b>#{relatorio.aluno_apresentacao}</b>", align: :center, size: 16, :inline_format => true, :leading => 10
            move_down 10
            text "matriculado(a) no Campus Campos Centro do IFFluminense, sob o nº #{relatorio.matricula_aluno}, no #{relatorio.aluno_semestre} semestre do ano letivo de #{relatorio.ano}, no Curso Superior de Licenciatura em #{relatorio.licenciatura}, no componente curricular #{relatorio.estagio}. Residente no(a) #{relatorio.endereco}, nº #{relatorio.numero}, Complemento: #{relatorio.complemento}, Bairro: #{relatorio.bairro}, município: #{relatorio.municipio}, UF: #{relatorio.UF}, CEP: #{relatorio.cep}, telefone/contato: nº #{relatorio.telefone}", align: :justify, :inline_format => true, :leading => 10
            move_down 10
            text "<b>Período de Vigência: #{relatorio.periodo_de}", align: :justify, :inline_format => true
            
            move_down 140
            text "CLÁUSULA PRIMEIRA - DA FINALIDADE", align: :center, size: 16
          move_down 40
          text "Estágio Curricular Supervisionado compreende um conjunto de atividades que propiciam aos licenciandos situações e oportunidades reais de trabalho. É ato educativo escolar, supervisionado, desenvolvido em ambiente profissional correlato à área de atuação acadêmica do aluno em conformidade com a Lei N.º 11.788/08.
  
  
          §1.º O Estágio Curricular Supervisionado tem por finalidade, propiciar o desenvolvimento e o aperfeiçoamento de competências próprias da atividade profissional, objetivando o desenvolvimento do licenciando para a vida cidadã e para o trabalho, conforme disposição legal.
  
          §2.º O Estágio Curricular Supervisionado constitui-se de atividades relacionadas às competências próprias dos profissionais da área em que o(a) licenciando(a) se encontra matriculado(a), previstas nas Diretrizes e no Projeto Pedagógico do Curso.", align: :justify
          move_down 20
  
          text "CLÁUSULA SEGUNDA - DA PROMOTORA", align: :center, size: 16
          move_down 40
          text "O Instituto Federal Fluminense Campus Campos Centro se compromete a:
  
            1. avaliar as instalações da Instituição CONCEDENTE do estágio e as possibilidades de adequação à formação cultural e profissional do licenciando;
            
            2. contratar, em benefício do estagiário, caso não esteja amparado pela Instituição CONCEDENTE, seguro de acidentes pessoais, vigente durante todo o período do estágio;
              
            3. orientar o estagiário quanto ao planejamento e desenvolvimento das atividades do estágio e quanto à sua participação nas diversas etapas previstas para a ação no campo;
              
            4. indicar professor orientador como responsável pelo acompanhamento e desempenho do licenciando, avaliando paralelamente com o Supervisor de campo, as atividades desenvolvidas;
            
            5. sugerir atividades específicas para avaliação do desenvolvimento das competências previstas no perfil do egresso, com a participação dos Estagiários;
              
            6. fornecer todo o material necessário ao registro das atividades do estágio;

            7. solicitar ao(à) licenciando(a), a apresentação periódica de Relatórios das Atividades realizadas durante a vigência do estágio;
              
            8. zelar pelo cumprimento do termo de compromisso, reorientando o(a) Estagiário(a) para outra Instituição, em caso de descumprimento das presentes normas;
              
            9. comunicar à parte CONCEDENTE, no início do Estágio, o período de realização de avaliações escolares ou acadêmicas, justificando-se assim, um possível impedimento de cumprimento de horário pré-fixado;", align: :justify
          move_down 20
          
          text "CLÁUSULA TERCEIRA - DA CONCEDENTE", align: :center, size: 16
          move_down 40
          text "A CONCEDENTE se compromete a:
  
          1. disponibilizar, ao(à) ESTAGIÁRIO(A), oportunidades de aplicabilidade dos conhecimentos pertinentes à sua área profissional, em ambiente condizente com as exigências legais e educacionais, no âmbito de sua formação;
              
          2. indicar Supervisor(es) do quadro de pessoal, com formação pedagógica e experiência profissional na área de formação do(a) ESTAGIÁRIO(A), para orientar até 10 (dez) estagiários simultaneamente;
              
          3. contratar, em casos não amparados pela Instituição PROMOTORA, seguro de acidentes pessoais, em benefício do(a) Estagiário(a), vigente durante todo o período do estágio;
              
          4. conceder ao(à) ESTAGIÁRIO(A) oportunidades de aperfeiçoamento na sua área de formação, complementando e consolidando, na prática, os conhecimentos em construção e o desenvolvimento de competências e habilidades específicas;
              
          5. elaborar juntamente com o(a) Estagiário(a) o Plano de Atividades de Estágio (PAE), em conformidade com as propostas de atividades para o Estágio e com as competências próprias da atividade profissional previstas no Plano de Curso;
              
          6. comprovar a frequência e as atividades desenvolvidas durante o Estágio, com vistos e respectivas identificações nos Formulários de Registro de Atividades(FRA);

          7. registrar, por ocasião da finalização do período de Estágio, avaliação final pelo Supervisor, em Formulário próprio - Formulário de Avaliação do Estagiário;
              
          8. estabelecer a jornada e a duração do Estágio que deverá ser definida, em comum acordo, entre a Instituição de Ensino PROMOTORA, a parte CONCEDENTE e o(a) aluno(a) ESTAGIÁRIO(A);
              
          9. garantir ao(à) Estagiário(a), redução da carga horária de estágio, nos períodos de avaliação acadêmica, observando o calendário letivo da Instituição de Ensino PROMOTORA;
              
          10. assegurar ao(a) Estagiário(a), em caso de estágio com duração igual ou superior a 01 (um) ano ininterrupto, na mesma Instituição, período de recesso de 30 (trinta) dias, ou de maneira proporcional, naquele em que a duração for inferior ao período acima mencionado. O recesso de que trata este item, deverá ser gozado, preferencialmente, durante as férias escolares.", align: :justify
          move_down 20
  
          text "CLÁUSULA QUARTA - DO ESTAGIÁRIO", align: :center, size: 16
          move_down 40
          text "O ESTAGIÁRIO se compromete à:
  
            1. atender às normas e procedimentos da CONCEDENTE como Estagiário(a);
              
            2. manter relacionamento de cordialidade e respeito no ambiente de trabalho;
              
            3. cumprir a jornada estabelecida no Plano de Estágio e registrar as atividades desenvolvidas, diariamente, no Formulário de Registro de Atividades (FRA);
              
            4. executar as atividades que lhe forem atribuídas e zelar pelos equipamentos e materiais que venha utilizar no desenvolvimento do seu Estágio;
              
            5. contribuir com a Instituição CONCEDENTE, com os recursos didáticos pedagógicos elaborados por ele e utilizados na prática docente quando do desenvolvimento de projetos alternativos de aprendizagem ou atividades específicas em sala de aula;
              
            6. informar por escrito e, em tempo hábil, à CONCEDENTE, qualquer fato que o impossibilite de cumprir a programação do estágio, quer quanto ao horário, duração ou aspectos técnicos;
              
            7. utilizar equipamento de segurança que for disponibilizado pela CONCEDENTE, em ambientes de aprendizagem específicos.", align: :justify
  
          move_down 20
  
          text "CLÁUSULA QUINTA - DA SUPERVISÃO E AVALIAÇÃO", align: :center, size: 16
          move_down 40
          text " O Estágio, como ato educativo escolar supervisionado, será acompanhado, e avaliado pelo professor orientador da Instituição de Ensino PROMOTORA e pelo supervisor(es) indicado pela parte CONCEDENTE, em conformidade com a legislação vigente, ficando o(a) Estagiário(a), sujeito a essa Regulamentação.", align: :justify
          move_down 20
  
          text "CLÁUSULA SEXTA - DO PRAZO DO ESTÁGIO", align: :center, size: 16
          move_down 40
          text " A duração do Estágio é estabelecida em conformidade com a legislação específica vigente. Fica definido neste Termo de Compromisso o prazo de Estágio de 06 (seis) meses, obedecendo a modalidade de semestralidade própria dos Cursos de Licenciaturas, com possibilidades de prorrogação por mais de (06) seis meses.", align: :justify
          move_down 20
  
          text "CLÁUSULA SÉTIMA - DAS DISPOSIÇÕES GERAIS:", align: :center, size: 16
          move_down 40
          text "1. A realização do Estágio Curricular Supervisionado não acarretará vínculo empregatício entre o(a) ESTAGIÁRIO(A) e a CONCEDENTE, em razão da legislação vigente e do presente termo.
              
            2. O Estágio Curricular Supervisionado poderá ser interrompido pelas partes contratantes, mediante comunicação por escrito, com antecedência mínima de 10 (dez) dias.
              
            3. A jornada de Atividade de Estágio será definida em comum acordo entre a Instituição de Ensino, a parte concedente e o estudante, devendo ser compatível com as atividades escolares e não ultrapassar 6h diárias e 30h semanais.
              
            4. O compromisso Estagiário/Instituição será rescindido:
              
            a) automaticamente, ao término do prazo de validade do Termo de Compromisso;
              
            b) por abandono do(a) Estagiário(a), caracterizado por ausência não justificada por 30 (trinta) dias consecutivos;
              
            c) a partir da interrupção do Curso na Instituição Promotora, pelo(a) Aluno(a)/Estagiário(a), nos casos de trancamento da matrícula;
            
            d) a pedido do(a) Estagiário(a), quando não houver condições de adaptação ao Plano de Atividades de Estágio(PAE), pela CONCEDENTE, ou vice-versa. Esta rescisão deverá se dar no prazo de até 30 (trinta) dias, a partir do início do Estágio;
              
            e) a qualquer momento, em caso de vínculo permanente do(a) Estagiário(a) com a CONCEDENTE;
              
            f) por interesse e conveniência de uma das partes, que deverá apresentar à parte contrária, por escrito, justificativa do fato;
              
            g) por desempenho insuficiente das atividades propostas, nas avaliações a que for submetido(a), pelos Supervisores e Orientadores das partes parceiras;
              
            h) por conduta incompatível do(o) Estagiário(a) em relação às normas exigidas pela Instituição Concedente.

            5. Fica eleito o foro da Comarca da cidade de Campos dos Goytacazes, Estado do Rio de Janeiro para dirimir qualquer questão que se originar deste termo.
              
            E por estarem de pleno e comum acordo com o exposto no presente Termo de Compromisso, firmam parceria em 03 (três) vias de igual teor, cabendo a 1.ª via à Instituição de Ensino PROMOTORA, a 2.ª, à CONCEDENTE e a 3.ª via, ao ESTAGIÁRIO.", align: :justify
  
            move_down 50
            text "Campos dos Goytacazes, RJ, #{relatorio.data}", align: :center, :inline_format => true
  
            move_down 50
            text "Concedente: _________________________________________________", :inline_format => true
  
            move_down 60
            text "IFFluminense <i>campus</i> Campos Centro: "
            stroke_horizontal_rule
            pad_top(20) { }

            move_down 30
            text "Estagiário: ______________________________________________________________", :inline_format => true

          end
        end
    end
  end