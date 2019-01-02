require_relative 'ui'
require_relative 'rank'

def palavra_secreta
    aviso_escolhendo_palavra
    texto = File.read("dicionario.txt")
    todas_palavras = texto.split "\n"
    numero_escolhido = rand(todas_palavras.size)
    palavra_secreta = todas_palavras[numero_escolhido].downcase
    aviso_palavra_escolhida(palavra_secreta)
    return palavra_secreta
end

def chute_valido(chutes, erros, mascara)
    cabecalho_palpite(chutes, erros, mascara)
    loop do
        chute = palpite
        if chutes.include? chute
            aviso_chute_repetido(chute)
        else
            return chute
        end
    end
end

def exibe(chutes, palavra)
    mascara = ""
    for caractere in palavra.chars
        if chutes.include? caractere
            mascara += caractere
        else
            mascara += "*"
        end
    end
    return mascara
end

def joga(nome)
    palavra = palavra_secreta
    erros = 0
    chutes = []
    pontos = 0

    while erros < 5
        mascara = exibe(chutes, palavra)
        chute = chute_valido(chutes, erros, mascara)
        chutes << chute
        if chute.size == 1
            letra = chute[0]
            qtd_encontrada = palavra.count(letra)
            if qtd_encontrada == 0
                aviso_letra_nao_encontrada
                erros += 1
            else
                aviso_letra_encontrada(qtd_encontrada)
            end
        else
            if chute == palavra
                aviso_acerto
                pontos += 100
                break
            else
                aviso_erro
                pontos -=30
                erros +=1
            end
        end
    end
    aviso_vitoria(pontos)
    return pontos
end

def jogo_da_forca
    nome = da_boas_vindas
    pts_totais = 0

    aviso_rank(exibe_rank)

    loop do
        pts_totais += joga(nome)
        aviso_pts_totais(pts_totais)
        rankeia(nome, pts_totais)
        if nao_quer_jogar?
            break
        end
    end
end