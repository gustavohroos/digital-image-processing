function matrizes = separa_cores(imagem)
  % Converte a imagem para o formato uint8, garantindo consistência
  imagem = im2uint8(imagem);

  % Inicializa matrizes para os canais vermelho, verde e azul com zeros
  vermelho = zeros(size(imagem), 'uint8');
  verde = zeros(size(imagem), 'uint8');
  azul = zeros(size(imagem), 'uint8');

  % Extrai o canal vermelho da imagem original e o armazena na matriz 'vermelho'
  vermelho(:,:,1) = imagem(:,:,1);
  % Extrai o canal verde da imagem original e o armazena na matriz 'verde'
  verde(:,:,2) = imagem(:,:,2);
  % Extrai o canal azul da imagem original e o armazena na matriz 'azul'
  azul(:,:,3) = imagem(:,:,3);

  % Combina as três matrizes de cores em um array de células
  matrizes = {vermelho, verde, azul};
end

