pkg load image

% Carregar imagem original
img = imread('imagens/barbara_gray.bmp');

% Adicionar ruídos às imagens
img_c_ruido_gaussiano = imnoise(img, 'gaussian');
img_c_ruido_salt_e_pepper = imnoise(img, 'salt & pepper', 0.05);

% Calcular métricas para ruído gaussiano
MSE_gauss = calcular_MSE(img, img_c_ruido_gaussiano);
PSNR_gauss = calcular_PSNR(img, img_c_ruido_gaussiano);

% Calcular métricas para ruído salt & pepper
MSE_sp = calcular_MSE(img, img_c_ruido_salt_e_pepper);
PSNR_sp = calcular_PSNR(img, img_c_ruido_salt_e_pepper);

% Plotar imagens e métricas
figure;
subplot(1,3,1);
imshow(img);
title('Imagem Original', 'FontSize', 8);

subplot(1,3,2);
imshow(img_c_ruido_gaussiano);
title(sprintf('Gaussiano\nMSE: %.2f, PSNR: %.2f dB', MSE_gauss, PSNR_gauss), 'FontSize', 8);

subplot(1,3,3);
imshow(img_c_ruido_salt_e_pepper);
title(sprintf('Salt & Pepper\nMSE: %.2f, PSNR: %.2f dB', MSE_sp, PSNR_sp), 'FontSize', 8);

print('imagens/plot_mse_psnr.png', '-dpng', '-r300');
