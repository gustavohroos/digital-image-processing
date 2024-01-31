function plot_img = realizar_cisalhamento()

  % Carrega a imagem
  imagem = imread('imagens/barbara_gray.bmp');


  img_cisalhamento_1 = cisalhamento(imagem, 0.2, 0);
  img_cisalhamento_2 = cisalhamento(imagem, 0, 0.25);
  img_cisalhamento_3 = cisalhamento(imagem, 0.25, 0.1);

  % Configuração da figura
  figure;

  % Plotagem da imagem original
  subplot(2, 2, 1);
  imshow(imagem);
  title('Original');

  % Plotagem das imagens com realces
  subplot(2, 2, 2);
  imshow(uint8(img_cisalhamento_1));
  title('cv = 0.2, ch = 0');

  subplot(2, 2, 3);
  imshow(uint8(img_cisalhamento_2));
  title('cv = 0, ch = 0.25');

  subplot(2, 2, 4);
  imshow(uint8(img_cisalhamento_3));
  title('cv = 0.25, ch = 0.1');

  % Salva a imagem como 'imagens/transformacoes_aplicadas.png'
  saveas(gcf, 'imagens/transformacoes_aplicadas.png');
end

