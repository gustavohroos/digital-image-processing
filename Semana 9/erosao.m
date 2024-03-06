function imagem_erodida = erosao(imagem_binaria, matriz_elemento_estruturante)
    [linhas, colunas] = size(imagem_binaria);
    [linhas_ee, colunas_ee] = size(matriz_elemento_estruturante);
    largura_borda = floor(linhas_ee / 2);
    altura_borda = floor(colunas_ee / 2);

    % Adiciona borda à imagem para tratar as bordas
    imagem_com_borda = padarray(imagem_binaria, [largura_borda, altura_borda], 0, 'both');
    imagem_erodida = zeros(size(imagem_binaria));

    for i = 1:linhas
        for j = 1:colunas
            % Extrai a região de interesse
            regiao = imagem_com_borda(i:i+2*largura_borda, j:j+2*altura_borda);

            % Realiza a operação E lógico e verifica se o resultado corresponde ao elemento estruturante
            if all(all((regiao & matriz_elemento_estruturante) == matriz_elemento_estruturante))
                imagem_erodida(i, j) = 1;
            end
        end
    end
end

