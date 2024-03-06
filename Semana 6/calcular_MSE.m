function MSE = calcular_MSE(img_1, img_2)

    if ~isequal(size(img_1), size(img_2))
        error('As imagens devem ter o mesmo tamanho.');
    end

    % Calcula o MSE
    diferenca = double(img_1) - double(img_2);
    quadrado = diferenca .^ 2;
    soma = sum(quadrado(:));
    MSE = soma / numel(img_1);
end
