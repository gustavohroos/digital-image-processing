function diamante = cria_diamante(raio)
  tamanho = 2 * raio + 1;  % O diâmetro do diamante
  centro = raio + 1;  % O centro do diamante
  diamante = zeros(tamanho, tamanho);  % Inicializa a matriz do elemento estruturante

  for i = 1:tamanho
    for j = 1:tamanho
      if abs(i - centro) + abs(j - centro) <= raio
        diamante(i, j) = 1;
      end
    end
  end
end
