pkg load image;

# Carrega a imagem
img = imread('imagens/barbara_gray.bmp');

# Aplica a Transformada de Fourier usando a função fft2
F = fft2(double(img));

# Posiciona a frequência zero no centro com fftshift
F_shifted = fftshift(F);

# Visualiza o resultado (de acordo com o código do PDF)
imshow(log(abs(F_shifted)), []);


