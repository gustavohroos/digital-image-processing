function quantiza(entrada, saida, bitsR, bitsG, bitsB)
  % Ler a imagem de entrada
  img = imread(entrada);

  % Separar os canais R, G, B
  R = img(:,:,1);
  G = img(:,:,2);
  B = img(:,:,3);

  % Quantização dos canais
  Rq = floor(double(R) / (2^(8-bitsR))) * (2^(8-bitsR)) + (2^(8-bitsR))/2;
  Gq = floor(double(G) / (2^(8-bitsG))) * (2^(8-bitsG)) + (2^(8-bitsG))/2;
  Bq = floor(double(B) / (2^(8-bitsB))) * (2^(8-bitsB)) + (2^(8-bitsB))/2;

  % Combinar os canais quantizados em uma nova imagem RGB
  quantizedImg = cat(3, uint8(Rq), uint8(Gq), uint8(Bq));

  % Apresentar a imagem quantizada
  imshow(quantizedImg);
  title('Imagem Quantizada');

  % Salvar a imagem quantizada
  imwrite(quantizedImg, saida);
end

