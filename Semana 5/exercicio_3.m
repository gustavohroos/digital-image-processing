% Carrega a imagem e obtém suas dimensões para criar as máscaras
img = imread('imagens/barbara_gray.bmp');
[largura, altura] = size(img);

% Eliminar bordas verticais
mascara_eliminar_bordas_verticais = cria_mascara(largura, altura, 'eliminar_bordas_verticais', 10);
filtra_freq(img, mascara_eliminar_bordas_verticais, 'elimina_bordas_verticais');

% Passa baixas
mascara_passa_baixas = cria_mascara(largura, altura, 'passa_baixas', 30); % 30 é o raio do círculo para o filtro passa-baixas
filtra_freq(img, mascara_passa_baixas, 'passa_baixas');

% Passa altas
mascara_passa_altas = cria_mascara(largura, altura, 'passa_altas', 30); % 30 é o raio do círculo para o filtro passa-altas
filtra_freq(img, mascara_passa_altas, 'passa_altas');

% Passa faixa
mascara_passa_faixa = cria_mascara(largura, altura, 'passa_faixa', [50, 20]); % 50 é a frequência central, 20 é a largura da faixa
filtra_freq(img, mascara_passa_faixa, 'passa_faixa');

% Rejeita faixa
mascara_rejeita_faixa = cria_mascara(largura, altura, 'rejeita_faixa', [50, 20]); % 50 é a frequência central, 20 é a largura da faixa
filtra_freq(img, mascara_rejeita_faixa, 'rejeita_faixa');

