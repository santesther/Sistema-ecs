class PublicosPdf < Prawn::Document
    def initialize(relatorio, current_user, usuario_matricula)
      super(top_margin: 85.0393, left_margin: 85.0393, right_margin: 56.6929, bottom_margin: 56.6929)
      @relatorio = relatorio
      @usuario_matricula = usuario_matricula
        fill_color "40464e"
        font_size 9
  

        image "#{Rails.root}/app/assets/images/cabecalho.png", at: [-50, 680], :width => 550
        move_down 60        
        
        repeat(1..5, dynamic: true) do
          draw_text "#{page_number}", at: [490, 700]
         end
  
        @relatorio.each do |relatorio|
          if(relatorio.matricula_aluno == @usuario_matricula)
            draw_text "Campos dos Goytacazes, RJ, #{relatorio.data}", at: [240, 600], :inline_format => true
            move_down 10
            text "Termo de Compromisso de Estágio - TCE", align: :center, size: 24
            move_down 10
            text "<b>Seguradora: </b>#{relatorio.seguradora}",align: :center, size: 12, :inline_format => true, :leading => 10
            move_down 10
            text "<b>Apólice de seguro: </b>#{current_user.apolice}",align: :center, size: 12, :inline_format => true, :leading => 10
            move_down 10

            text "O <b>INSTITUTO FEDERAL FLUMINENSE <i>CAMPUS</i> CAMPOS CENTRO</b> neste Ato representado pela <b>Diretoria de Ensino dos Cursos Superiores de Licenciatura do  - INSTITUIÇÃO PROMOTORA -</b>, inscrita no CNPJ/MF sob o nº 10.779.511/0002-98, situada na Rua Doutor Siqueira, nº 273, Parque Dom Bosco, Campos dos Goytacazes/RJ, CEP: 28.030-130, telefone (22) 27262897, <b>firma parceria</b>, em atendimento à Lei Nº 11.788, de 25/09/2008, com o(a) <b>#{relatorio.instituicao_apresentacao} - Instituição de Ensino CONCEDENTE - </b> inscrito no CNPJ/MF sob o nº #{relatorio.cnpj}, situado no(a) #{relatorio.endereco_da_instituicao}, nº: #{relatorio.numero_da_instituicao}, #{relatorio.complemento_da_instituicao}, Bairro: #{relatorio.bairro_da_instituicao}, no município de #{relatorio.municipio_da_instituicao}, Estado do Rio de Janeiro, CEP: #{relatorio.cep_da_instituicao}, telefone: #{relatorio.telefone_da_instituicao}, representado por <b>#{relatorio.representante_da_instituicao}, para fins de abertura de campo de Estágio Curricular Supervisionado dos Cursos de Licenciatura</b>, ao(à) <b>LICENCIANDO(A)", align: :justify, :inline_format => true, :leading => 10
            move_down 10
            text "<b>#{relatorio.aluno_apresentacao}</b>", align: :center, size: 16, :inline_format => true, :leading => 10
            move_down 10 
            text "matriculado(a) no <i>Campus</i> Campos Centro do IFFluminense, sob o nº #{relatorio.matricula_aluno}, no #{relatorio.aluno_semestre} semestre do ano letivo de #{relatorio.ano}, no Curso Superior de Licenciatura em #{relatorio.licenciatura}, no componente curricular #{relatorio.estagio}. Residente no(a) #{relatorio.endereco}, nº #{relatorio.numero}, Complemento: #{relatorio.complemento}, Bairro: #{relatorio.bairro}, município: #{relatorio.municipio}, UF: #{current_user.UF}, CEP: #{relatorio.cep}, telefone/contato: nº #{relatorio.telefone}", align: :justify, :inline_format => true, :leading => 10
            move_down 40
            text "<b>Período de Vigência: #{relatorio.periodo_de}", align: :justify, :inline_format => true

            move_down 130
            text "CLÁUSULA PRIMEIRA - DA FINALIDADE", align: :center, size: 16
            move_down 20
            text "Estágio Curricular Supervisionado compreende um conjunto de atividades que propiciam aos licenciandos situações e oportunidades reais de trabalho. É ato educativo escolar, supervisionado, desenvolvido em ambiente profissional correlato à área de atuação acadêmica do aluno em conformidade com a Lei N.º 11.788/08.
  
  
            §1.º O Estágio Curricular Supervisionado tem por finalidade, propiciar o desenvolvimento e o aperfeiçoamento de competências próprias da atividade profissional, objetivando o desenvolvimento do licenciando para a vida cidadã e para o trabalho, conforme disposição legal.
  
            §2.º O Estágio Curricular Supervisionado constitui-se de atividades relacionadas às funções atribuídas a profissionais do curso acima especificado, conforme descrição contida no Plano de Curso e explicitadas no Plano de Atividades de Estágio (PAE).
  
            §3.º As funções atribuídas aos profissionais encontram-se descritas no Plano de Curso e, as atividades de estágio, no Plano de Atividades de Estágio (PAE).", align: :justify
            move_down 20
  
            text "CLÁUSULA SEGUNDA - DA PROMOTORA", align: :center, size: 16
            move_down 20
            text "O Instituto Federal Fluminense campus Campos Centro se compromete a:
  
            1. avaliar as instalações da parte CONCEDENTE do estágio e sua adequação à formação cultural e profissional do educando;
  
            2. contratar, em benefício do estagiário, caso não esteja amparado pela Instituição CONCEDENTE, seguro de acidentes pessoais, vigente durante todo o período do estágio;
  
            3. orientar o estagiário quanto ao planejamento e desenvolvimento das atividades do estágio e quanto a sua participação nas diversas etapas;
  
            4. indicar professor orientador como responsável pelo acompanhamento e avaliação das atividades de estágio e do desempenho do licenciando, de forma progressiva;
  
            5. sugerir atividades específicas para avaliação do desenvolvimento das competências previstas no perfil do egresso, com a participação dos estagiários;
  
            6. fornecer todo o material necessário ao registro das atividades do estágio;
  
            7. solicitar ao educando, a apresentação periódica de relatórios das atividades realizadas durante a vigência do estágio;
  
            8. zelar pelo cumprimento do termo de compromisso, reorientando o estagiário para outra Instituição, em caso de descumprimento das presentes normas;
  
            9. comunicar à parte CONCEDENTE, no início do estágio, o período de realização de avaliações escolares ou acadêmicas, justificando-se assim, um possível impedimento de cumprimento de horário pré-fixado;
  
            10. expedir Declaração de Conclusão de Prática Profissional, na qual o Estágio Curricular Supervisionado se encontra inserido como parte integrante, para fins de Colação de Grau.", align: :justify
        
            move_down 80
            text "CLÁUSULA TERCEIRA - DA CONCEDENTE", align: :center, size: 16
            move_down 20
            text "A CONCEDENTE se compromete a:
  
            1. disponibilizar, ao ESTAGIÁRIO, oportunidades de aplicabilidade dos conhecimentos pertinentes à sua área profissional, em ambiente condizente com as exigências legais à formação;
  
            2. indicar supervisor do quadro de pessoal, com formação ou experiência profissional na área correspondente ao curso do ESTAGIÁRIO, para orientar até 10 (dez) estagiários simultaneamente;
  
            3. contratar, em casos não amparados pela Instituição PROMOTORA, seguro de acidentes pessoais, em benefício do estagiário, vigente durante todo o período do estágio;
  
            4. conceder ao ESTAGIÁRIO oportunidades de aperfeiçoamento na sua área de formação, complementando e consolidando, na prática, os conhecimentos em construção, objetivando o desenvolvimento de competências e habilidades;
  
            5. elaborar juntamente com o estagiário o Plano de Atividades de Estágio (PAE), em conformidade com as competências próprias da atividade profissional, previstas no respectivo Plano de Curso;
  
            6. comprovar a frequência e as atividades desenvolvidas durante o Estágio, com vistos e respectivas identificações, em fichas próprias (FRA); por ocasião da finalização das atividades, a avaliação final do Período, pelo supervisor, na “Ficha de Avaliação do Estagiário”;
  
  
            7. estabelecer a jornada e a duração do estágio que deverá ser definida, de comum acordo, entre a Instituição de Ensino PROMOTORA, a parte CONCEDENTE e o aluno ESTAGIÁRIO ou seu representante legal;
  
            8. garantir ao estagiário, redução da carga horária de estágio, nos períodos de avaliação acadêmica, observando o calendário letivo da Instituição de Ensino PROMOTORA;
  
            9. Indicar, enquanto perdurar o Estágio Curricular Supervisionado, a forma de contraprestação ao estagiário (quando houver): ..............................................;
  
            10. assegurar ao estagiário, em caso de estágio com duração igual ou superior a 01 (um) ano ininterrupto, período de recesso de 30 (trinta) dias, ou de maneira proporcional, naquele em que a duração for inferior ao período acima mencionado. O recesso de que trata este item, deverá ser gozado, preferencialmente, durante as férias escolares.", align: :justify
            move_down 20
  
            text "CLÁUSULA QUARTA - DO ESTAGIÁRIO", align: :center, size: 16
            move_down 20
            text "O ESTAGIÁRIO se compromete à:
  
            1. atender às normas e procedimentos da CONCEDENTE como estagiário;
  
            2. manter relacionamento de cordialidade e respeito no ambiente de trabalho;
  
            3. cumprir a jornada estabelecida no presente Termo e registrar as atividades desenvolvidas, diariamente, na Ficha de Registro de Atividades (FRA);
  
            4. executar as atividades que lhe forem atribuídas e zelar pelos equipamentos e materiais que venha utilizar no desenvolvimento do seu estágio;"
              move_down 10
  
            text "5. informar por escrito e, em tempo hábil, à CONCEDENTE, qualquer fato que o impossibilite de cumprir a programação do estágio, quer quanto ao horário, duração ou aspectos técnicos;
  
            6. utilizar equipamento de segurança que for disponibilizado pela CONCEDENTE, em ambientes de aprendizagem específicos, principalmente na área de Ciências da Natureza.", align: :justify
            move_down 20
  
            text "CLÁUSULA QUINTA - DA SUPERVISÃO E AVALIAÇÃO", align: :center, size: 16
            move_down 20
            text "O Estágio, como ato educativo escolar supervisionado, será acompanhado pelo professor orientador da Instituição de Ensino PROMOTORA e pelo supervisor da parte CONCEDENTE, em conformidade com as Normas Técnicas do Instituto Federal Fluminense (IFFluminense) e a legislação vigente, ficando, o estagiário, sujeito a essa regulamentação.", align: :justify
            move_down 20
  
            text "CLÁUSULA SEXTA - DO PRAZO DO ESTÁGIO", align: :center, size: 16
            move_down 20
            text "A duração do estágio é estabelecida pelas Normas Técnicas e Processuais de Estágio do Instituto Federal de Educação, Ciência e Tecnologia Fluminense, aprovadas pelo Conselho Superior do IFFluminense.", align: :justify
            move_down 20
  
            text "CLÁUSULA SÉTIMA - DAS DISPOSIÇÕES GERAIS:", align: :center, size: 16
            move_down 20
            text "1. A realização do Estágio Curricular Supervisionado não acarretará vínculo empregatício entre o ESTAGIÁRIO e a CONCEDENTE, em razão da legislação vigente e do presente termo.
  
            2. O Estágio Curricular Supervisionado poderá ser interrompido pelas partes contratantes, mediante comunicação por escrito, com antecedência mínima de 10 (dez) dias.
  
            3. O compromisso estagiário/Instituição será rescindido:
  
            a) automaticamente, ao término do prazo de validade do Termo de Compromisso;
  
            b) por abandono do estagiário, caracterizado por ausência não justificada por 30 (trinta) dias consecutivos;
  
            c) a partir da interrupção do curso na Instituição Promotora, pelo aluno/estagiário, nos casos de trancamento da matrícula;
  
            d) a pedido do estagiário (a), quando não houver adaptação ao plano de estágio da CONCEDENTE, no prazo de até 30 (trinta) dias, contados a partir do início do estágio;
  
            e) a qualquer momento, em caso de vínculo permanente, pela CONCEDENTE;
  
            f) por interesse e conveniência de uma das partes, que deverá apresentar à parte contrária, por escrito, justificativa do fato;
  
            g) por desempenho insuficiente das atividades propostas, nas avaliações a que for submetido (a), pelos supervisores orientadores das partes conveniadas;
  
            h) por conduta incompatível do estagiário em relação às normas exigidas pela Instituição Concedente."

            move_down 20
            text "4. Fica eleito o foro da Comarca da cidade de Campos dos Goytacazes, Estado do Rio de Janeiro para dirimir qualquer questão que se originar deste termo.
  
            E por estarem de pleno e comum acordo com o exposto no presente Termo de Compromisso, firmam em 03 (três) vias de igual teor, cabendo a 1.ª via à Instituição de Ensino PROMOTORA, a 2.ª, à CONCEDENTE e a 3.ª via, ao ESTAGIÁRIO.", align: :justify
  
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

            move_down 50
            %i[center].each do |position|
              image "#{Rails.root}/app/assets/images/logo_dirlic.png", position: position
              end
          end
        end
    end
  end