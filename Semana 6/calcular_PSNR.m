function PSNR = calcular_PSNR(img_1, img_2)

    if ~isequal(size(img_1), size(img_2))
        error('As imagens devem ter o mesmo tamanho.');
    end

    % Calcula o Mean Squared Error (MSE)
    MSE = calcular_MSE(img_1, img_2);

    % Encontra o valor máximo possível para um pixel
    maxPixel = double(max(img_1(:)));

    % Calcula o PSNR
    PSNR = 10 * log10((maxPixel^2) / MSE);
end
