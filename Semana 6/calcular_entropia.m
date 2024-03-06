function entropia = calcularEntropia(imagem)
    % Calcular o histograma da imagem
    [counts, ~] = imhist(imagem);

    % Normalizar o histograma para obter as probabilidades
    probabilidades = counts / numel(imagem);

    % Remover as probabilidades iguais a zero
    probabilidades = probabilidades(probabilidades > 0);

    % Calcular a entropia
    entropia = -sum(probabilidades .* log2(probabilidades));
end
