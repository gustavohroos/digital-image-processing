function imagem_dilatada = dilata(imagem_bin, matriz_elemento_estruturante)
    [linhas, colunas] = size(imagem_bin);
    [linhas_ee, colunas_ee] = size(matriz_elemento_estruturante);
    pad_largura = floor(linhas_ee / 2);
    pad_altura = floor(colunas_ee / 2);

    % Adiciona borda à imagem para facilitar o processamento das bordas
    imagem_com_borda = padarray(imagem_bin, [pad_largura, pad_altura], 0, 'both');
    imagem_dilatada = zeros(size(imagem_bin));

    for i = 1:linhas
        for j = 1:colunas
            % Extrai a região de interesse
            regiao = imagem_com_borda(i:i+2*pad_largura, j:j+2*pad_altura);

            % Se pelo menos um pixel na região de interesse corresponder ao elemento estruturante, marque o pixel como 1
            if any(any(regiao & matriz_elemento_estruturante))
                imagem_dilatada(i, j) = 1;
            end
        end
    end
end

