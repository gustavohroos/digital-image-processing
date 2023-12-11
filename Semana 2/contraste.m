function nova_figura = contraste(figura)
    figura = 'imagens/lena_contraste.bmp';
    % Carregar a imagem
    img = imread(figura);

    rows = 3;
    columns = 4;

    % Apresentar o histograma da imagem original
    figure;
    subplot(rows, columns, 1);
    imshow(img);
    title('Imagem Original', 'FontSize', 8);
    subplot(rows, columns, 2);
    imhist(img);
    title('Histograma Original', 'FontSize', 8);
    set(gca, 'FontSize', 4);

    % Alargamento de contraste com transformação de intensidade linear identidade
    img_linear_identidade = imadjust(img, [0 1], [0 1]);

    % Apresentar a imagem com contraste alargado
    subplot(rows, columns, 3);
    imshow(img_linear_identidade);
    title('Linear Identidade', 'FontSize', 8);
    % Gerar o histograma da imagem com contraste alargado
    subplot(rows, columns, 4);
    imhist(img_linear_identidade);
    title('Histograma Linear Identidade', 'FontSize', 8);
    set(gca, 'FontSize', 4);

    % Alargamento de contraste com transformação de intensidade linear com ajuste variando entre max e min
    img_linear_ajustado = imadjust(img, stretchlim(img), [0 1]);
    % Salvar a nova imagem
    [~, nome, extensao] = fileparts(figura);
    nova_figura = ['imagens/' nome '_contraste_alargado' extensao];
    imwrite(img_linear_ajustado, nova_figura);

    % Apresentar a imagem com contraste alargado
    subplot(rows, columns, 5);
    imshow(img_linear_ajustado);
    title('Linear Ajustado', 'FontSize', 8);
    % Gerar o histograma da imagem com contraste alargado
    subplot(rows, columns, 6);
    imhist(img_linear_ajustado);
    title('Histograma Linear Ajustado', 'FontSize', 8);
    set(gca, 'FontSize', 4);

    % Alargamento de contraste com transformação de intensidade com correção gama
    gamma_values = [0.5, 1, 2];

    for i = 1:length(gamma_values)
        img_gama = imadjust(img, [], [], gamma_values(i));

        % Apresentar a imagem com contraste alargado
        subplot(rows, columns, 4 + columns/2 * i + 1);
        imshow(img_gama);
        title(['Gama = ' num2str(gamma_values(i))], 'FontSize', 8);

        % Gerar o histograma da imagem com contraste alargado
        subplot(rows, columns, 4 + columns/2 * i + 2);
        imhist(img_gama);
        title(['Histograma Gama = ' num2str(gamma_values(i))], 'FontSize', 8);
        set(gca, 'FontSize', 4);
    end

    print('imagens/plot_ajustes_de_contraste.png', '-dpng', '-r300');
end

