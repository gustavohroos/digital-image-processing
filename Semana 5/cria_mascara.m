function mascara = cria_mascara(largura, altura, tipo, parametros)
    [X, Y] = meshgrid(-floor(altura/2):ceil(altura/2)-1, -floor(largura/2):ceil(largura/2)-1);

    % Distância do centro da imagem (frequência zero)
    D = sqrt(X.^2 + Y.^2);

    switch tipo
        case 'eliminar_bordas_verticais'
            mascara = ones(largura, altura); % Inicia com uma máscara toda branca
            mascara(:, floor(altura/2)-parametros:ceil(altura/2)+parametros) = 0; % Bloqueia as bordas verticais

        case 'passa_baixas'
            D0 = parametros; % Frequência de corte
            mascara = D <= D0; % Cria um círculo no centro

        case 'passa_altas'
            D0 = parametros; % Frequência de corte
            mascara = D > D0; % Inverte o filtro passa-baixas

        case 'passa_faixa'
            D0 = parametros(1); % Frequência central
            W = parametros(2); % Largura da faixa
            mascara = (D >= (D0-W/2)) & (D <= (D0+W/2)); % Cria uma faixa

        case 'rejeita_faixa'
            D0 = parametros(1); % Frequência central
            W = parametros(2); % Largura da faixa
            mascara = ~((D >= (D0-W/2)) & (D <= (D0+W/2))); % Inverte o filtro passa-faixa

        otherwise
            error('Tipo de filtro não reconhecido.');
    end
end

