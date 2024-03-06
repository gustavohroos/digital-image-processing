function figura_out = restaura_mediana(figura_in, N)
    % Obter as dimensões da imagem e do filtro
    [altura_img, largura_img] = size(figura_in);
    altura_filtro = N;
    largura_filtro = N;

    % Calcular os deslocamentos para o centro do filtro
    deslocamento_vertical = floor(altura_filtro / 2);
    deslocamento_horizontal = floor(largura_filtro / 2);


    % Adicionar linhas e colunas extras à imagem (padding)
    img_padded = zeros(altura_img + 2 * deslocamento_vertical, largura_img + 2 * deslocamento_horizontal);
    img_padded(1 + deslocamento_vertical:altura_img + deslocamento_vertical, 1 + deslocamento_horizontal:largura_img + deslocamento_horizontal) = figura_in;

    % Replicação das bordas (copiando os pixels das bordas para evitar bordas pretas)
    for i = 1:deslocamento_vertical
      img_padded(i, 1 + deslocamento_vertical:deslocamento_vertical + largura_img) = figura_in(1, :);
      img_padded(deslocamento_vertical + altura_img + i, 1 + deslocamento_vertical:deslocamento_vertical + largura_img) = figura_in(end, :);
    endfor

    for i = 1:deslocamento_horizontal
      img_padded(:, i) = img_padded(:, 1 + deslocamento_horizontal);
      img_padded(:, deslocamento_horizontal + largura_img + i) = img_padded(:, end - deslocamento_horizontal);
    endfor

    imshow(img_padded)


    % Inicializar a imagem de saída com zeros
    figura_out = zeros(altura_img, largura_img);

    % Realizar a convolução
    for i = 1:altura_img
        for j = 1:largura_img
            % Obter a região da imagem correspondente ao tamanho do filtro
            regiao = img_padded(i:i + N - 1, j:j + N - 1);

            % Aplicar a convolução entre a região e o filtro
            resultado = median(regiao(:));

            % Atribuir o resultado à posição correspondente na imagem de saída
            figura_out(i, j) = resultado / 255;
        end
    end
end

