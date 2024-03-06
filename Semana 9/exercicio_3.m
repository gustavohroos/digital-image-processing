img = imread('imagens/barbara_gray.bmp');

threshold = 0.5;
img_bin = im2bw(img, threshold);

% Definir o elemento estruturante
diamante = cria_diamante(3);

% Chamar a função de abertura
img_abertura = abertura(img_bin, diamante);
imwrite(img_dilatada, 'imagens/barbara_gray_abertura.bmp');

% Chamar a função de fechamento
img_fechamento = fechamento(img_bin, diamante);
imwrite(img_fechamento, 'imagens/barbara_gray_fechamento.bmp');
