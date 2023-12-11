function plot_img = realizar_filtragens()

  % Carrega a imagem
  imagem = imread('imagens/barbara_gray.bmp');

  % Médias
  filtro_media_3x3 = ones(3) / 3^2;
  filtro_media_7x7 = ones(7) / 7^2;

  % Filtro personalizado
  filtro_personalizado = [1, 2, 1; 2, 4, 2; 1, 2, 1] / 16;

  % Realces
  realce_1 = [-1, -1, -1; -1, 9, -1; -1, -1, -1];
  realce_2 = [0, 1, 0; 1, -4, 1; 0, 1, 0];
  realce_3 = [1, 1, 1; 1, -8, 1; 1, 1, 1];

  % Filtragem da imagem com os filtros
  img_filtro_media_3x3 = filtragem(imagem, filtro_media_3x3);
  img_filtro_media_7x7 = filtragem(imagem, filtro_media_7x7);
  img_filtro_personalizado = filtragem(imagem, filtro_personalizado);
  img_realce_1 = filtragem(imagem, realce_1);
  img_realce_2 = filtragem(imagem, realce_2);
  img_realce_3 = filtragem(imagem, realce_3);

  % Configuração da figura
  figure;

  % Plotagem da imagem original
  subplot(3, 3, 2);
  imshow(imagem);
  title('Original', 'FontSize', 12);

  % Plotagem das imagens com filtros
  subplot(3, 3, 4);
  imshow(uint8(img_filtro_media_3x3));
  title('Filtro Média 3x3', 'FontSize', 10);

  subplot(3, 3, 5);
  imshow(uint8(img_filtro_media_7x7));
  title('Filtro Média 7x7', 'FontSize', 10);

  subplot(3, 3, 6);
  imshow(uint8(img_filtro_personalizado));
  title('Filtro Personalizado', 'FontSize', 10);

  % Plotagem das imagens com realces
  subplot(3, 3, 7);
  imshow(uint8(img_realce_1));
  title('Realce 1', 'FontSize', 10);

  subplot(3, 3, 8);
  imshow(uint8(img_realce_2));
  title('Realce 2', 'FontSize', 10);

  subplot(3, 3, 9);
  imshow(uint8(img_realce_3));
  title('Realce 3', 'FontSize', 10);

  % Ajusta o tamanho das imagens
  set(gcf, 'Position', get(0, 'Screensize'));

  % Salva a imagem como 'imagens/filtros_aplicados.png'
  saveas(gcf, 'imagens/filtros_aplicados.png');
end

