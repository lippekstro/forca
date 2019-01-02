def da_boas_vindas
    puts "Bem vindo ao jogo da Forca"
    puts "Qual seu nome? "
    nome = gets.strip
    puts "\n\n"
    puts "Começaremos o jogo para você, #{nome}."
    return nome
end

def nao_quer_jogar?
    puts "Deseja jogar novamente(S/N)? "
    escolha = gets.strip.upcase
    escolha == "N"
end

def cabecalho_palpite(chutes, erros, mascara)
    puts "\n\n"
    desenha_forca(erros)
    puts "Palavra Secreta: #{mascara}"
    puts "Erros ate agora #{erros}"
    puts "Chutes ate agora: #{chutes}"  
end

def palpite
    puts "Entre com uma letra ou palavra"
    chute = gets.strip.downcase
    return chute
end

def aviso_chute_repetido(chute)
    puts "Você ja utilizou a letra '#{chute}'"
end

def aviso_letra_nao_encontrada
    puts "Letra nao encontrada"
end

def aviso_letra_encontrada(qtd_encontrada)
    puts "Letra encontrada #{qtd_encontrada} vezes"
end

def aviso_acerto
    puts "\nParabéns, você ganhou!"
    puts

    puts "       ___________      "
    puts "      '._==_==_=_.'     "
    puts "      .-\\:      /-.    "
    puts "     | (|:.     |) |    "
    puts "      '-|:.     |-'     "
    puts "        \\::.    /      "
    puts "         '::. .'        "
    puts "           ) (          "
    puts "         _.' '._        "
    puts "        '-------'       "
    puts
end

def aviso_erro
    puts "Que pena...errou"
end

def aviso_vitoria(pontos)
    puts "Voce ganhou #{pontos} pontos."
end

def aviso_escolhendo_palavra
    puts "Escolhendo palavra..."
end

def aviso_palavra_escolhida(palavra_secreta)
    puts "Palavra secreta com #{palavra_secreta.size} letras...Boa Sorte!"
end

def aviso_pts_totais(pts_totais)
    puts "Voce fez #{pts_totais} pontos."
end

def aviso_rank(dados)
    puts "RANKING"
    puts "#{dados[0]} ---------- #{dados[1]}"
end

def desenha_forca(erros)
    cabeca = "   "
    corpo = " "
    pernas = "   "
    bracos = "   "
    if erros >= 1
        cabeca = "(_)"
    end
    if erros >= 2
        bracos = " | "
        corpo = "|"
    end
    if erros >= 3
        bracos = "\\|/"
    end
    if erros >= 4
        pernas = "/ \\"
    end

    puts "  _______       "
    puts " |/      |      "
    puts " |      #{cabeca}  "
    puts " |      #{bracos}  "
    puts " |       #{corpo}  "
    puts " |      #{pernas}  "
    puts " |              "
    puts "_|___           "
    puts

end