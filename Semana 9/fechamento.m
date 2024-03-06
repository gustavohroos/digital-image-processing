function imagem_fechamento = fechamento(imagem, elemento_estruturante)
  imagem_dilatada = dilata(imagem, elemento_estruturante);
  imagem_fechamento = erosao(imagem_dilatada, elemento_estruturante);
end
