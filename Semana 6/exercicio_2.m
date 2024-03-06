
% Ler a imagem original
img_barbara = imread('imagens/barbara_gray.bmp');
img_lena = imread('imagens/lena.bmp');


% Calcular entropia
entropia_barbara = calcular_entropia(img_barbara);
entropia_lena = calcular_entropia(img_lena);

% Plotar as imagens e entropias
subplot(1,2,1);
imshow(img_barbara);
title(sprintf('Barbara\nEntropia: %.2f', entropia_barbara), 'FontSize', 8);

subplot(1,2,2);
imshow(img_lena);
title(sprintf('Lena\nEntropia: %.2f', entropia_lena), 'FontSize', 8);


print('imagens/plot_entropia.png', '-dpng', '-r300');
