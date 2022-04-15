programa {
	inclua biblioteca Util
    	inclua biblioteca Texto
    funcao inteiro menu (){
        inteiro opcao
        
        limpa()
        escreva("Jogo da forca\n selecione uma opção e aperte Enter:\n1 - palavra aleatória\n2 - Escrever uma palavra\n3 - Sair\n\n")
        leia(opcao)
        retorne opcao
    }

    funcao cadeia EscolhePalavra(){
    		inteiro indice
    		cadeia palavras[10] = {"movimento","luta","trabalho","moradia","casa","cozinha","solidaria","apartamento","social","programaçao"}
    		
    		indice = Util.sorteia(0, 10)
    		escreva(palavras[indice]+"\n")
    		retorne palavras[indice]
    }

    funcao inteiro EscreveTentativa(cadeia palavra, cadeia listaCertas){
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

    funcao logico Tentativa(cadeia palavra, inteiro tentativas){
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
			finalizou = EscreveTentativa(palavra, listaCertas)
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
    
    funcao inteiro IniciaJogo (){
        inteiro opcao
        inteiro tentativas = 5
        cadeia palavra
        inteiro escolhido
        logico resultado = falso

        limpa()
        
        palavra = EscolhePalavra()
        
        resultado = Tentativa(palavra, tentativas)
        se(resultado==falso){
        	escreva("\nVocê perdeu")
        }
        senao{
        	escreva("\nVocê Ganhou")
        }
        escreva("\nEscolha uma opção: ")
        escreva("\n1 - Jogar novamente")
        escreva("\n2 - Voltar ao menu")
        escreva("\n3 - Sair\n")
        leia(escolhido)
        retorne escolhido
    }
    
	funcao inicio(){
		inteiro opcao
		enquanto(opcao!=3){
		    opcao = menu()
		    se (opcao==1){
				escolhido = IniciaJogo()
		    }
		    senao se(opcao==2){
		    		escreva("opção 2")
		    }
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2580; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */