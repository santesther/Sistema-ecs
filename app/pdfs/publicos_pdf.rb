class PublicosPdf < Prawn::Document
    def initialize(relatorio, current_user, usuario_matricula)
      super(top_margin: 20)
      @relatorio = relatorio
      @usuario_matricula = usuario_matricula
        fill_color "40464e"
        font_size 9
  

        image "#{Rails.root}/app/assets/images/cabecalho.png", :width => 550
        move_down 50

        text "<b>CARTA DE APRESENTAÇÃO</b>", align: :center, size: 20, :inline_format => true, :leading => 10
       
  
        @relatorio.each do |relatorio|
          if(relatorio.matricula_aluno == @usuario_matricula)
            text "Campos dos Goytacazes, RJ, <u>#{relatorio.data}</u>", align: :center, :inline_format => true
            move_down 40
            text "<b>À:</b><b>Direção da Instituição de Ensino:</b> <u>#{relatorio.instituicao_apresentacao}</u>", align: :left, size: 15, :inline_format => true, :leading => 10
            move_down 20
            text "<b>Assunto: Apresentação de discente-estagiário:</b> <u>#{relatorio.aluno_apresentacao}</u>", align: :left, size: 10, :inline_format => true, :leading => 10
            move_down 30
            text "Prezado Gestor", align: :justify, :inline_format => true, :leading => 10
            move_down 10
            text "O IFFluminense <i>campus</i> Campos Centro apresenta o(a) licenciando(a)-estagiário(a): <u>#{relatorio.aluno_apresentacao_dois}</u>, matriculado(a), neste instituto, no <u>#{relatorio.periodo}</u>º do Curso Superior de Licenciatura em <u>#{relatorio.licenciatura}</u>, no <u>#{relatorio.semestre_apresentacao}</u>º semestre letivo de <u>20#{relatorio.ano_apresentacao}</u>, para fins de cumprimento das atividades do Estágio Curricular Supervisionado no campo de estágio dessa Instituição Concedente, prescristas no Plano de Atividades de Estágio(PAE), conforme Calendário Acadêmico deste <i>Campus</i>, em atendimento a carga horária total destinada ao período em curso.", align: :left, :inline_format => true, :leading => 10
            move_down 30
            text "Ressaltamos que o Estágio Curricular Supervisionado é componente obrigatório e de importância significativa para a formação dos futuros formadores. Agradecemos a atenção sempre nos concedida e a seriedade com que os profissionais da educação têm acolhido e acompanhado nossos(as) licenciados(as). Sem mais, colocamo-nos à disposição para quaisquer esclarecimentos e registramos, nesta, os contatos com DIRLIC/NAPP (22) 2726-2897 // dirlicenciatura.camposcentro@iff.edu.br, bem como o site licenciaturas.centro.iff.edu", align: :left, :inline_format => true, :leading => 10
            move_down 70 

           
            %i[center].each do |position|
              image "#{Rails.root}/app/assets/images/logo_dirlic.png", position: position
              end

           
            move_down 30
            image "#{Rails.root}/app/assets/images/cabecalho.png", :width => 550

            move_down 50
      
            text "Termo de Compromisso de Estágio - TCE", align: :center, size: 24
            move_down 20
            text "<b>Seguradora: </b><u>#{relatorio.seguradora}</u>",align: :center, :inline_format => true, :leading => 10
            text "<b>Apólice de seguro: </b><u>#{relatorio.apolice}</u>",align: :center, :inline_format => true, :leading => 10
            move_down 30

            text "O <b>INSTITUTO FEDERAL FLUMINENSE</b>, CNPJ/MF nº 10.779.511/0001-07, situado à Rua Coronel Walter Kramer, nº 357, bairro: Parque Santo Antônio, município: Campos dos Goytacazes/RJ, CEP: 28080-565, neste Ato representado por seu Reitor <u>#{relatorio.reitor}</u>, <b>com parceria firmada com a SECRETARIA ESTADUAL DE EDUCAÇÃO DO ESTADO DO RIO DE JANEIRO</b>(SEEDUC/RJ), neste Ato representado pela <b>Diretoria de Ensino dos Cursos Superiores de Licenciatura do <i>CAMPUS</i> CAMPOS CENTRO - INSTITUIÇÃO PROMOTORA -</b>, inscrito no CNPJ/MF sob o nº <u>#{relatorio.cnpj}</u>, situada no(a) <u>#{relatorio.endereco_da_instituicao}</u>, nº <u>#{relatorio.numero_da_instituicao}</u>, Bairro <u>#{relatorio.bairro_da_instituicao}</u>, no munícipio de <u>#{relatorio.municipio_da_instituicao}</u>, Estado do <u>#{relatorio.estado_da_instituicao}</u>, CEP: <u>#{relatorio.cep_da_instituicao}<u>, telefone <u>#{relatorio.telefone_da_instituicao}</u>, representada por <u><b>#{relatorio.representante}</u>, para fins de abertura de campo de Estágio Curricular Supervisionado dos Cursos de Licenciatura</b>, ao(à) <b>LICENCIANDO(A)</b>", align: :justify, :inline_format => true, :leading => 10
            move_down 10
            text "<b><u>#{relatorio.aluno_apresentacao}</u></b>", align: :center, size: 20, :inline_format => true, :leading => 10
            move_down 10 
            text "matriculado(a) no Campus Campos Centro do IFFluminense, sob o nº <u>#{relatorio.matricula_aluno}</u>, no <u>#{relatorio.aluno_semestre}º</u> semestre do ano letivo de <u>20#{relatorio.ano}</u>, no Curso Superior de Licenciatura em <u>#{relatorio.licenciatura}</u>, <u>#{relatorio.periodo}</u>º período. Residente no(a) <u>#{relatorio.endereco}</u>, nº <u>#{relatorio.numero}</u>, Complemento: <u>#{relatorio.complemento}</u>, Bairro: <u>#{relatorio.bairro}</u>, município: <u>#{relatorio.municipio}</u>, UF: <u>#{relatorio.estado}</u>, CEP: <u>#{relatorio.cep}</u>, telefone/contato: nº <u>#{relatorio.telefone}</u>", align: :justify, :inline_format => true, :leading => 10
            move_down 30
  
            text "Período de <u>#{relatorio.periodo_de}</u> a <u>#{relatorio.periodo_a}</u>", align: :justify, :inline_format => true
  
            move_down 320
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
            move_down 20
  
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
  
            4. executar as atividades que lhe forem atribuídas e zelar pelos equipamentos e materiais que venha utilizar no desenvolvimento do seu estágio;
  
            5. informar por escrito e, em tempo hábil, à CONCEDENTE, qualquer fato que o impossibilite de cumprir a programação do estágio, quer quanto ao horário, duração ou aspectos técnicos;
  
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
  
            h) por conduta incompatível do estagiário em relação às normas exigidas pela Instituição Concedente.
  
  
            4. Fica eleito o foro da Comarca da cidade de Campos dos Goytacazes, Estado do Rio de Janeiro para dirimir qualquer questão que se originar deste termo.
  
            E por estarem de pleno e comum acordo com o exposto no presente Termo de Compromisso, firmam em 03 (três) vias de igual teor, cabendo a 1.ª via à Instituição de Ensino PROMOTORA, a 2.ª, à CONCEDENTE e a 3.ª via, ao ESTAGIÁRIO.", align: :justify
  
            move_down 20
            text "Campos dos Goytacazes, RJ, <u>#{relatorio.data}</u>", align: :center, :inline_format => true
  
            move_down 30
            text "Concedente: _________________________________________________", :inline_format => true
  
            move_down 30
            text "IFFluminense <i>campus</i> Campos Centro: "
          if relatorio.avaliador == "Conceição Campinho"
            bounding_box([0, cursor], width: 150, height: 100) do
              stroke_bounds
              %i[center].each do |vposition|
              image "#{Rails.root}/app/assets/images/Carimbo_conceicao_correto.png", :width => 150,
              position: :center, vposition: 25
              end
            end
              elsif relatorio.avaliador == "Edina Lacerda"
                bounding_box([0, cursor], width: 250, height: 100) do
                  stroke_bounds
                %i[center].each do |vposition|
                  image "#{Rails.root}/app/assets/images/carimbo_edina.png", :width => 250,
                  position: :center, vposition: 25
                  end
                end
              elsif relatorio.avaliador == "Elizabeth Freitas Barreto da Silva Paes"
                bounding_box([0, cursor], width: 250, height: 100) do
                  stroke_bounds
                %i[center].each do |vposition|
                  image "#{Rails.root}/app/assets/images/carimbo_Elizabeth.png", :width => 250,
                  position: :center, vposition: 25
                  end
              end
            else 
              text "okok"
            end
  
            move_down 30
            text "Estagiário: ______________________________________________________________", :inline_format => true
          end
        end
    end
  end