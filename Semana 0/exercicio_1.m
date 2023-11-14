% 1. Leia uma imagem colorida utilizando a função imread

imagem = imread("imagens/suarez.jpg");

% 2. Exiba a imagem na tela utilizando a função imshow

imshow(imagem);

% 3. Converta a imagem do espaço de cores RGB para o espaço de cores YCbCr
% Obs: utilizei o pacote image -> pkg load image

imagem_YCbCr = rgb2ycbcr(imagem);

% 4. Exiba cada um dos canais da imagem na tela

canal_Y = imagem_YCbCr(:,:,1);
canal_Cb = imagem_YCbCr(:,:,2);
canal_Cr = imagem_YCbCr(:,:,3);
canais_combinados = cat(2, canal_Y, canal_Cb, canal_Cr);

imshow(canais_combinados);

imwrite(canais_combinados, 'imagens/canais.png');

% 5. Exiba o histograma de luminância (Y) utilizando a função histogram
% Obs: não achei a função histogram, fiz com a função hist

figure;
hist(canal_Y(:), 256);
title('Histograma de Luminância (Y)');
saveas(gcf, 'imagens/histograma_luminancia.png');

% 6. 'Escureça' a imagem de luminância multiplicando todos os valores por 0,8

canal_Y_escurecido = canal_Y * 0.8;

% 7. Exiba o histograma da imagem escurecida
figure;
hist(canal_Y_escurecido(:), 256);
title('Histograma de Luminância Escurecida');
saveas(gcf, 'imagens/histograma_luminancia_escurecida.png')

% 8. Salve o canal de luminância (Y) em um arquivo do tipo PNG
imwrite(uint8(canal_Y_escurecido), 'imagens/canal_Y_escurecido.png');

% 9. Faça subamostragem de cores (relação 2:1) nos canais de crominância (Cb e Cr)
canal_Cb_subamostrado = canal_Cb(1:2:end, 1:2:end);
canal_Cr_subamostrado = canal_Cr(1:2:end, 1:2:end);

% Exiba os canais de crominância subamostrados
figure;
subplot(1, 2, 1), imshow(canal_Cb_subamostrado), title('Canal Cb Subamostrado');
subplot(1, 2, 2), imshow(canal_Cr_subamostrado), title('Canal Cr Subamostrado');
saveas(gcf, 'imagens/subamostragem.png');

