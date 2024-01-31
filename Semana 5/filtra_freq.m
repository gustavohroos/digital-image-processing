function img_filtrada = filtra_freq(img, mascara, nome_filtro)
    pkg load image;

    % Transforma a imagem para o domínio de Fourier e posiciona a frequência zero no centro
    F = fft2(double(img));
    F_shifted = fftshift(F);

    % Exibe e salva o espectro de Fourier
    figure, imshow(log(abs(F_shifted) + 1), []), title('Espectro de Fourier');
    espectro_fourier_nome = strcat('imagens/espectro_fourier_', nome_filtro, '.png');
    imwrite(mat2gray(log(abs(F_shifted) + 1)), espectro_fourier_nome);

    % Aplica a máscara/filtro
    F_filtered = F_shifted .* mascara;

    % Coloca o espectro novamente na posição original
    F_filtered = ifftshift(F_filtered);

    % Reconstrói a imagem filtrada
    img_filtered = ifft2(F_filtered);
    img_filtered = real(img_filtered);

    % Exibe a nova imagem filtrada
    figure, imshow(img_filtered, []), title(strcat('Imagem Filtrada - ', nome_filtro));

    % Salva a imagem filtrada com o nome do filtro aplicado
    img_filtrada_nome = strcat('imagens/imagem_filtrada_', nome_filtro, '.png');
    imwrite(mat2gray(img_filtered), img_filtrada_nome);

    % Retorne o nome do arquivo gerado com a nova imagem
    img_filtrada = img_filtrada_nome;
end

