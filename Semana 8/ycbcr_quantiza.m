function ycbcr_quantiza(entrada, saida, bitsY, bitsCb, bitsCr)
  % Carrega a imagem de entrada
  img = imread(entrada);

  % Converte a imagem de RGB para YCbCr
  imgYCbCr = rgb2ycbcr(img);

  % Define os níveis de quantização para cada canal baseado no número de bits
  niveisY = 2^bitsY;
  niveisCb = 2^bitsCb;
  niveisCr = 2^bitsCr;

  % Calcula os passos de quantização
  passoY = 256 / niveisY;
  passoCb = 256 / niveisCb;
  passoCr = 256 / niveisCr;

  % Realiza a quantização em cada canal
  quantizadoY = floor(double(imgYCbCr(:,:,1)) / passoY) * passoY + passoY / 2;
  quantizadoCb = floor(double(imgYCbCr(:,:,2)) / passoCb) * passoCb + passoCb / 2;
  quantizadoCr = floor(double(imgYCbCr(:,:,3)) / passoCr) * passoCr + passoCr / 2;

  % Combina os canais quantizados em uma nova imagem YCbCr
  imgYCbCrQuantizada = cat(3, uint8(quantizadoY), uint8(quantizadoCb), uint8(quantizadoCr));

  % Converte a imagem YCbCr quantizada de volta para RGB
  imgRGBQuantizada = ycbcr2rgb(imgYCbCrQuantizada);

  % Exibe e salva a imagem RGB quantizada
  imshow(imgRGBQuantizada);
  imwrite(imgRGBQuantizada, saida);
end

