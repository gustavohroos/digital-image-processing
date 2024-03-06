function imagem_abertura = abertura(imagem, elemento_estruturante)
  imagem_erodida = erosao(imagem, elemento_estruturante);
  imagem_abertura = dilata(imagem_erodida, elemento_estruturante);
end
