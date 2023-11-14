function arquivo2 = redimensionar(arquivo1, tipo, num1, num2)
    imagem = imread(arquivo1);

    [altura, largura] = size(imagem);

    nova_altura = round(altura * num1);
    nova_largura = round(largura * num2);

    if tipo == 1
        imagem_redimensionada = imresize(imagem, [nova_altura, nova_largura], 'nearest');
    elseif tipo == 2
        imagem_redimensionada = imresize(imagem, [nova_altura, nova_largura], 'bilinear');
    else
        error('Tipo de interpolação inválido. Use 1 para vizinho mais próximo ou 2 para bilinear.');
    end

    [path, name, ext] = fileparts(arquivo1);
    novo_nome = ['imagens/', name, '_redimensionada', ext];
    imwrite(imagem_redimensionada, novo_nome);

    arquivo2 = novo_nome;
end

