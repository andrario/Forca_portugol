programa {
	//Bibliotecas
	inclua biblioteca Util
    	inclua biblioteca Texto
	//Variaveis globais
	inteiro opcao = 0
	cadeia palavra = " "

    //Função que escreve o menu inicial
    funcao inteiro MenuInicial (){
        limpa()
        escreva("Jogo da forca\n selecione uma opção e aperte Enter:\n1 - Palavra aleatória\n2 - Escrever uma palavra\n3 - Sair\n\n")
        leia(opcao)
        retorne opcao
    }
    //Função que escreve o menu pós jogo
    funcao inteiro MenuJogo(){
		escreva("\nEscolha uma opção: ")
        	escreva("\n1 - Jogar novamente")
        	escreva("\n2 - Voltar ao menu")
        	escreva("\n3 - Sair\n")
        	leia(opcao)
    		retorne opcao
    }

	//Função para selecionar uma palavra aleatoriamente em uma lista
    funcao cadeia EscolhePalavra(){
    		inteiro indice
    		cadeia palavras[11] = {"movimento","luta","trabalho","moradia","casa","cozinha","solidaria","apartamento","social","programaçao","tecnologia"}
    		
    		indice = Util.sorteia(0, 10)
    		retorne palavras[indice]
    }

	//Escreve na tela as letras corretas, retorna um contador inteiro
    funcao inteiro EscreveTentativa(cadeia listaCertas){
		inteiro quantidadeLetrasPalavra = Texto.numero_caracteres(palavra)
		cadeia letra
		inteiro finalizou = 0
		para(inteiro i=0;i<quantidadeLetrasPalavra;i++){
			letra = Texto.extrair_subtexto(palavra,i,i+1)
			se(Texto.posicao_texto(letra, listaCertas, 0) > -1){
				escreva(letra)
			}
			senao{
				escreva("_")
				finalizou++
			}
		}
		retorne finalizou
	}

	//Verifica se a letra foi adivinhada corretamente, 
    funcao logico Tentativa(inteiro tentativas){
    		cadeia letraTentativa
		cadeia listaCertas = ""
		cadeia listaErradas = ""
		inteiro tentativa = 0
		caracter lista[28]
		inteiro quantidadeLetrasPalavra = Texto.numero_caracteres(palavra)
		inteiro finalizou = quantidadeLetrasPalavra
		
		enquanto(tentativa < tentativas){
			finalizou = quantidadeLetrasPalavra
			limpa()
			finalizou = EscreveTentativa(listaCertas)
			se(finalizou <= 0){ 
				retorne verdadeiro
			}
			escreva("\nEscreva sua tentativa\n")
			leia(letraTentativa)
			escreva("\n")
			se(Texto.posicao_texto(letraTentativa, palavra,0)>-1){
				se(Texto.posicao_texto(letraTentativa, listaCertas,0)<0){
					listaCertas += letraTentativa
				}
			}
			senao{
				tentativa++
			}
		}
		retorne falso
    }
    //Função que executa o jogo, 
    funcao inteiro IniciaJogo (){
        inteiro tentativas = 5
        inteiro escolhido
        logico resultado = falso

        limpa()

        se(opcao==1){
        	palavra = EscolhePalavra()
        }senao se(opcao==2){
        	escreva("\nEscreva a palavra secreta: \n")
        	leia(palavra)
        	limpa()
        }
        
        
        resultado = Tentativa(tentativas)
        se(resultado==falso){
        	escreva("\nVocê perdeu")
        }
        senao{
        	escreva("\nVocê Ganhou")
        }
        escolhido = MenuJogo()
        retorne escolhido
    }
    //Função principal, a partir dela será executado o programa inteiro
	funcao inicio(){
		
		enquanto(opcao!=3){
		    opcao = MenuInicial()
		    se (opcao==1){
				opcao = IniciaJogo()
		    }
		    senao se(opcao==2){
		    		opcao = IniciaJogo()
		    }
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3051; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */