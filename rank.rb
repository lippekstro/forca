def rankeia(nome, pts_totais)
    conteudo = "#{nome}\n#{pts_totais}"
    File.write "rank.txt", conteudo
end

def exibe_rank
    conteudo = File.read "rank.txt"
    conteudo.split "\n"
end
