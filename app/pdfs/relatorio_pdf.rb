class RelatorioPdf < Prawn::Document
    def initialize(users, activities, user_nome, margin: 50)
      super(top_margin: 70)
      @users = users
      @activities = activities
      @user_nome = user_nome
  
  
        fill_color "40464e"
  
        # Define a cor do traçado
         fill_color "666666"
         image "#{Rails.root}/public/logo/ifflogo.png", :at => [-20,730], :scale => 0.5
  
        # Cria um texto com tamanho 30 PDF Points, bold alinha no centro
         text "Relatório de Atividades
                  Cadastradas", :size => 26, :style => :bold, :align => :center
  
        # Move 80 PDF points para baixo o cursor
        move_down 30
        @users.each do |users|
             if(users.nome == @user_nome)
  
               text "Dados do Aluno
                        Nome civil: #{users.nome}
                        Nome social: #{users.nome_social}
                        Matrícula: #{users.matricula}
                        Curso: #{users.licenciatura}\n
                        Quantidade de horas cadastradas:\n", :size => 12, :style => :bold
                        
                        text "#{users.cargahoraria[18]} de #{MAXIMO[18]}", :size => 12, :style => :bold
               move_down 20
               table_data = [["<b>Atividades</b>", "Horas Cadastradas"],
                             ["<b><u>Contabilização de Horas</u></b>", "<b>#{users.cargahoraria[18]}<b>"],
                             ["<b>Participação como ouvinte em Palestras, Seminários, Congressos, Conferências, Simpósios, Fóruns, Encontros, Mesas Redondas, Minicursos, Oficinas e similares</b>", "<b>#{users.cargahoraria[0]}<b>"],
                             ["<b>Participação no desenvolvimento de projetos de extensão sob orientação de professor,na área de formação</b>", "<b>#{users.cargahoraria[1]}<b>"],
                             ["<b>Participação no desenvolvimento de projeto de pesquisa sob orientação de professor, na área de formação</b>", "<b>#{users.cargahoraria[2]}<b>"],
                             ["<b>Visitas orientadas a exposições, museus, teatros, patrimônio artístico ou cultural </b>", "<b>#{users.cargahoraria[3]}<b>"],
                             ["<b>Participação em atividades artísticas e culturais sob a supervisão de professor e/ou de profissional do IFFluminense</b>", "<b>#{users.cargahoraria[4]}<b>"],
                             ["<b>Representação em Órgãos Colegiados e/ou Comissões do IFFluminense campus Campos Centro</b>", "<b>#{users.cargahoraria[5]}<b>"],
                             ["<b>Participação em atividade de extensão, na área de formação, nas modalidades presencial e/ou semipresencial</b>", "<b>#{users.cargahoraria[6]}<b>"],
                             ["<b>Atuação em função de bolsista ou voluntário no IFFluminense, em, no mínimo, 02 (dois) períodos letivos</b>", "<b>#{users.cargahoraria[7]}<b>"],
                             ["<b>Participação em curso de extensão, na área de formação, na modalidade online</b>", "<b>#{users.cargahoraria[8]}<b>"],
                             ["<b>Participação em Atividade de Monitoria, na área de formação, no 2.º segmento do Ensino Fundamental, em Cursos de Nível Médio e/ou em Curso Superior</b>", "<b>#{users.cargahoraria[9]}<b>"],
                             ["<b>Participação como ouvinte na apresentação oral de Qualificação de Projeto e/ou de Monografia (Trabalho de Conclusão, Dissertação e Tese), na área de formação e/ou em áreas afins à formação</b>", "<b>#{users.cargahoraria[10]}<b>"],
                             ["<b>Participação como ouvinte na apresentação oral de Monografias (Trabalho Conclusão de Curso, Dissertação e Tese), na área de formação e/ou em áreas afins à formação</b>", "<b>#{users.cargahoraria[11]}<b>"],
                             ["<b>Apresentação de trabalhos acadêmicos, científicos ou culturais em instituições de âmbito local, regional, nacional e/ou internacional</b>", "<b>#{users.cargahoraria[12]}<b>"],
                             ["<b>Publicação em periódicos / em Anais (Resumo e/ou Artigo Completo)</b>", "<b>#{users.cargahoraria[13]}<b>"],
                             ["<b>Publicação em Livros</b>", "<b>#{users.cargahoraria[14]}<b>"],
                             ["<b>Participação na organização e coordenação de eventos acadêmico-científico-culturais internos ou externos ao IFFluminense</b>", "<b>#{users.cargahoraria[15]}<b>"],
                             ["<b>Participação em Grupo de Estudo Temático sob orientação de professor, em semestre letivo, na área de formação e/ou em áreas afins à formação</b>", "<b>#{users.cargahoraria[16]}<b>"],
                             ["<b>Apresentação de trabalhos de pesquisa institucional em eventos científicos internos ou externos</b>", "<b>#{users.cargahoraria[17]}<b>"],]
  
  
                              table(table_data,:header => true, :width => 500, :cell_style => { :inline_format => true, size: 9 })
  
  
              move_down 20
              text "Atividades cadastradas", :size => 12, :style => :bold
              cont = 1
  
              activities.each do |activity|
                if(activity.user.nome == users.nome)
                  if ((activity.status == "Deferido")||(activity.status == "Indeferido"))
                     text "\nAtividade #{cont}", :size => 11, :style => :bold
                     text "Título: #{activity.titulo}
                     Nome do Evento: #{activity.nome_do_evento}
                     Status: #{activity.status}
                     Instituição: #{activity.local_realizacao_atividade}
                     Data: #{activity.data_evento.strftime("%d/%m/%Y")}
                     Relatório da Atividade: #{activity.relatorio}
                     Avaliador: #{activity.edited_by}
                     Horas Atribuídas: #{activity.hora_computada}", :size =>10
                    cont += 1
                  end
                end
              end
  
              if(cont == 1)
                 text "Não existem atividades aprovadas", :size => 10
              end
            end
        end
  
      # Escreve o texto com os detalhes que o usuário entrou
      # text "#{details}", :size => 12, :align => :justify, :inline_format => true
      # Move mais 30 PDF points para baixo o cursor
      # move_down 10
      # Adiciona o nome com 12 PDF points, justify e com o formato inline (Observe que o <b></b> funciona para deixar em negrito)
      # text "Com o cliente: <b>#{name}</b> por R$#{price}", :size => 12, :align => :justify, :inline_format => true
      # Muda de font para Helvetica
       font "Helvetica"
      # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
       text "Relatório de Atividades Cadastradas", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
      # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
       number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 1, :page_filter => :all, :at => [ bounds.right - 270, -20], :align => :right, :size => 8
      # Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
    end
  end
  