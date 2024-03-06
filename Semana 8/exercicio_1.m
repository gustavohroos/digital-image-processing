pkg load image;

img = imread('imagens/lena.png');

matrizes = separa_cores(img);

figure;

subplot(2, 2, 1);
imshow(img);
title('Original');
subplot(2, 2, 2);
imshow(matrizes{1});
title('Vermelho');
subplot(2, 2, 3);
imshow(matrizes{2});
title('Verde');
subplot(2, 2, 4);
imshow(matrizes{3});
title('Azul');

print('imagens/lena_separa_cores.png', '-dpng');
