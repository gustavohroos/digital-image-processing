% Leitura da imagem

imagem = imread('imagens/borboleta.png');

% Função para substituir uma cor por outra na imagem

function imagem_modificada = substituir_cores(imagem, cor_substituida, cor_substituta)

    [x, y] = find(imagem(:,:,1) == cor_substituida(1) & imagem(:,:,2) == cor_substituida(2) & imagem(:,:,3) == cor_substituida(3));

    for i = 1:length(x)
        imagem(x(i), y(i), 1) = cor_substituta(1);
        imagem(x(i), y(i), 2) = cor_substituta(2);
        imagem(x(i), y(i), 3) = cor_substituta(3);
    end

    imagem_modificada = imagem;
end

% Definição das cores como variáveis para serem usadas como parâmetros

cor_laranja = [246, 127, 0];
cor_bege = [255, 246, 227];
cor_verde = [34, 139, 34];
cor_rosa = [255, 20, 147];

imagem_modificada = substituir_cores(imagem, cor_laranja, cor_verde);

imagem_modificada = substituir_cores(imagem_modificada, cor_bege, cor_rosa);

imshow(imagem_modificada);

imwrite(imagem_modificada, 'imagens/nova_borboleta.png');
