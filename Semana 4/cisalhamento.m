function cisalhada = cisalhamento(imagem, cv, ch)
   % Obtém as dimensões da imagem
   [altura, largura] = size(imagem);

   % Define a matriz de transformação afim para o cisalhamento
   transformacao = [1, cv, 0; ch, 1, 0; 0, 0, 1];
   transformacao

   % Inicializa a matriz para a imagem cisalhada com zeros
   cisalhada = zeros(altura, largura);

   % Itera sobre cada pixel da imagem original
   for i = 1:altura
     for j = 1:largura
            % Define as coordenadas do pixel atual (considerando índices baseados em 1)
            coordenadas = [i - 1; j - 1; 1];

            % Aplica a transformação afim às coordenadas do pixel
            transformadas = round(transformacao * coordenadas);

            % Corrige os índices para começarem a partir de 1
            transformadas(1) = transformadas(1) + 1;
            transformadas(2) = transformadas(2) + 1;

            % Verifica se as coordenadas transformadas estão dentro dos limites da imagem
            if transformadas(1) >= 1 && transformadas(1) <= altura && transformadas(2) >= 1 && transformadas(2) <= largura
              % Atribui o valor da imagem original à posição correspondente na imagem cisalhada
              cisalhada(transformadas(1), transformadas(2)) = imagem(i, j);
            end
        end
    end
end

