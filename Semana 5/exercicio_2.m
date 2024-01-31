pkg load image;

# Carrega a imagem
img = imread('imagens/barbara_gray.bmp');

# Aplica a Transformada de Fourier usando a função fft2
F = fft2(double(img));

# Posiciona a frequência zero no centro com fftshift
F_shifted = fftshift(F);

# Aplica a Transformada de Fourier Inversa
F_inverse_shifted = ifftshift(F_shifted); # Desfaz o deslocamento do zero-frequency para a posição original
img_reconstructed = ifft2(F_inverse_shifted); # Aplica a Transformada de Fourier Inversa

# A função ifft2 pode retornar valores complexos devido a erros de arredondamento, então pegamos apenas a parte real
img_reconstructed = real(img_reconstructed);

# Exibe a imagem reconstruída
imshow(img_reconstructed, []);

