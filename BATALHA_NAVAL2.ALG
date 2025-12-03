algoritmo "batalha_naval"
const
   TAMANHO_TABULEIRO = 5 // Tamanho do tabuleiro 
   QTD_NAVIOS = 2        // Quantidade de navios

var
   op, i, j, linha, coluna, pontos_j1, pontos_j2, barcos_restantes_j1, barcos_restantes_j2, bomba1, bomba2: inteiro
   mapa: vetor[1..TAMANHO_TABULEIRO, 1..TAMANHO_TABULEIRO] de caractere
   nome_jogador1, nome_jogador2: caractere
   vez_jogador: inteiro
   repeticao: logico

inicio
   enquanto verdadeiro faca
      // Menu
      escreval("Menu de Jogo")
      escreval("1. Máquina vs Humano")
      escreval("2. Humano vs Humano")
      escreval("3. Sair")
      escreval("Escolha uma opção: ")
      leia(op)

      se op = 1 então

         pontos_j1 <- 0
         barcos_restantes_j1 <- QTD_NAVIOS
         pontos_j2 <- 0
         barcos_restantes_j2 <- QTD_NAVIOS

         /
         para i de 1 ate TAMANHO_TABULEIRO faca
            para j de 1 ate TAMANHO_TABULEIRO faca
               mapa[i,j] <- "_"
            fimpara
         fimpara


         escreval("Posicione seus barcos (1 a ", QTD_NAVIOS, ").")
         para i de 1 ate QTD_NAVIOS faca
            escreval("Posicione o barco ", i, ":")
            escreval("Linha (1-", TAMANHO_TABULEIRO, "): ")
            leia(linha)
            escreval("Coluna (1-", TAMANHO_TABULEIRO, "): ")
            leia(coluna)


            se (linha >= 1) e (linha <= TAMANHO_TABULEIRO) e (coluna >= 1) e (coluna <= TAMANHO_TABULEIRO) e (mapa[linha, coluna] = "_") então
               mapa[linha, coluna] <- "B"
            senao
               escreval("Posição inválida ou já ocupada! Tente novamente.")
               i <- i - 1
            fimse
         fimpara
         limpaTela()
         escreval("Posicionando os barcos da Máquina...")
         para i de 1 ate QTD_NAVIOS faca
            repeticao := verdadeiro
            enquanto repeticao faca
               linha <- aleatorio(1, TAMANHO_TABULEIRO)
               coluna <- aleatorio(1, TAMANHO_TABULEIRO)


               se mapa[linha, coluna] = "_" então
                  mapa[linha, coluna] <- "B"
                  repeticao <- falso
               fimse
            fimenquanto
         fimpara

         limpaTela()

         enquanto barcos_restantes_j1 > 0 e barcos_restantes_j2 > 0 faca

            escreval("Batalha Naval - Máquina vs Humano")
            escreval("Navios restantes do Jogador 1: ", barcos_restantes_j1)
            escreval("Navios restantes da Máquina: ", barcos_restantes_j2)
            escreval("Total de pontos do Jogador 1: ", pontos_j1)

            escreval("Jogador 1, digite a linha e coluna para atacar a Máquina: ")
            escreval("Linha: ")
            leia(bomba1)

            escreval("Coluna: ")
            leia(bomba2)


            se (bomba1 >= 1) e (bomba1 <= TAMANHO_TABULEIRO) e (bomba2 >= 1) e (bomba2 <= TAMANHO_TABULEIRO) então

               se mapa[bomba1, bomba2] = "B" então
                  escreval("Acertou!")
                  mapa[bomba1, bomba2] <- "X"
                  pontos_j1 <- pontos_j1 + 1
                  barcos_restantes_j2 <- barcos_restantes_j2 - 1
               senao
                  mapa[bomba1, bomba2] <- "O"
                  escreval("Errou!")
               fimse
            senao
               escreval("Posição de ataque inválida! Tente novamente.")
            fimse

            se barcos_restantes_j2 = 0 então
               escreval("Você venceu! Total de pontos: ", pontos_j1)
               interrompa
            fimse

            escreval("Agora é a vez da Máquina.")
            linha := aleatorio(1, TAMANHO_TABULEIRO)
            coluna := aleatorio(1, TAMANHO_TABULEIRO)

            se mapa[linha, coluna] = "B" então
               escreval("A Máquina acertou!")
               mapa[linha, coluna] <- "X"
               pontos_j2 <- pontos_j2 + 1
               barcos_restantes_j1 <- barcos_restantes_j1 - 1
            senao
               mapa[linha, coluna] <- "O"
               escreval("A Máquina errou!")
            fimse
            se barcos_restantes_j1 = 0 então
               escreval("A Máquina venceu!")
               interrompa
            fimse

            escreval("Mapa atual (Os barcos são ocultados):")
            para i de 1 ate TAMANHO_TABULEIRO faca
               para j de 1 ate TAMANHO_TABULEIRO faca
                  se mapa[i,j] = "B" então
                     escreval("_ ")
                  senao
                     escreval(mapa[i,j], " ")
                  fimse
               fimpara
               escreval("")
            fimpara
            limpaTela()
            escreval("Pressione qualquer tecla para continuar...")
            leia()
         fimenquanto

      senao se op = 2 então
      senao se op = 3 então
         escreval("Saindo do jogo. Até logo!")
         interrompa
      fimse
   fimenquanto
fimalgoritmo
