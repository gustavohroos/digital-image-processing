img = imread('imagens/barbara_gray.bmp');

threshold = 0.5;
img_bin = im2bw(img, threshold);

% Definir o elemento estruturante
diamante = cria_diamante(3);

% Chamar a função de erosão
img_erodida = erosao(img_bin, diamante);
imwrite(img_erodida, 'imagens/barbara_gray_erodida.bmp');

