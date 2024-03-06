img = imread('imagens/barbara_gray.bmp');

threshold = 0.5;
img_bin = im2bw(img, threshold);

% Definir o elemento estruturante
diamante = cria_diamante(3);

% Chamar a função de dilatação
img_dilatada = dilata(img_bin, diamante);
imwrite(img_dilatada, 'imagens/barbara_gray_dilatada.bmp');

