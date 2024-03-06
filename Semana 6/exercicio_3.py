import cv2
import pywt
import numpy as np
import matplotlib.pyplot as plt

# Ler a imagem original
img_original = cv2.imread('imagens/barbara_gray.bmp', cv2.IMREAD_GRAYSCALE)

# Converter a imagem para double para processamento
img_double = img_original.astype(np.float64) / 255.0

# Decomposição com wavelet Haar
coeffs_haar_1 = pywt.dwt2(img_double, 'haar')
cA1_haar, (_, _, _) = coeffs_haar_1
img_restaurada_haar_1 = pywt.idwt2((cA1_haar, (None, None, None)), 'haar')
img_restaurada_haar_1 = cv2.resize(img_restaurada_haar_1, (img_original.shape[0], img_original.shape[1]), interpolation=cv2.INTER_CUBIC)

coeffs_haar_2 = pywt.dwt2(cA1_haar, 'haar')
cA2_haar, (_, _, _) = coeffs_haar_2
img_restaurada_haar_2 = pywt.idwt2((cA2_haar, (None, None, None)), 'haar')
img_restaurada_haar_2 = cv2.resize(img_restaurada_haar_2, (img_original.shape[0], img_original.shape[1]), interpolation=cv2.INTER_CUBIC)

# Decomposição com wavelet Daubechies10
coeffs_db10_1 = pywt.dwt2(img_double, 'db10')
cA1_db10, (_, _, _)  = coeffs_db10_1
img_restaurada_db10_1 = pywt.idwt2((cA1_db10, (None, None, None)), 'db10')
img_restaurada_db10_1 = cv2.resize(img_restaurada_db10_1, (img_original.shape[0], img_original.shape[1]), interpolation=cv2.INTER_CUBIC)

coeffs_db10_2 = pywt.dwt2(cA1_db10, 'db10')
cA2_db10, (_, _, _)  = coeffs_db10_2
img_restaurada_db10_2 = pywt.idwt2((cA2_db10, (None, None, None)), 'db10')
img_restaurada_db10_2 = cv2.resize(img_restaurada_db10_2, (img_original.shape[0], img_original.shape[1]), interpolation=cv2.INTER_CUBIC)

# Calcular PSNR e entropia para cada imagem restaurada
def calcular_PSNR(img1, img2):
    mse = np.mean((img1 - img2) ** 2)
    psnr = 10 * np.log10(255**2 / mse)
    return psnr

def calcular_entropia(img):
    hist = cv2.calcHist([img], [0], None, [256], [0, 256])
    hist /= hist.sum()
    entropia = -np.sum(hist * np.log2(hist + np.finfo(float).eps))
    return entropia

entropia_original = calcular_entropia(img_original)

psnr_haar_1 = calcular_PSNR(img_original, (img_restaurada_haar_1 * 255).astype(np.uint8))
entropia_haar_1 = calcular_entropia((img_restaurada_haar_1 * 255).astype(np.uint8))
psnr_haar_2 = calcular_PSNR(img_original, (img_restaurada_haar_2 * 255).astype(np.uint8))
entropia_haar_2 = calcular_entropia((img_restaurada_haar_2 * 255).astype(np.uint8))

psnr_db10_1 = calcular_PSNR(img_original, (img_restaurada_db10_1 * 255).astype(np.uint8))
entropia_db10_1 = calcular_entropia((img_restaurada_db10_1 * 255).astype(np.uint8))
psnr_db10_2 = calcular_PSNR(img_original, (img_restaurada_db10_2 * 255).astype(np.uint8))
entropia_db10_2 = calcular_entropia((img_restaurada_db10_2 * 255).astype(np.uint8))

# Exibir imagens e métricas
fig, axs = plt.subplots(1, 5)
axs[0].imshow(img_original, cmap='gray')
axs[0].set_title(f'Original\nEntropia: {entropia_original:.2f}', fontsize=8)

axs[1].imshow((img_restaurada_haar_1 * 255).astype(np.uint8), cmap='gray')
axs[1].set_title(f'Haar 1\nPSNR: {psnr_haar_1:.2f}\nEntropia: {entropia_haar_1:.2f}', fontsize=8)
axs[2].imshow((img_restaurada_haar_2 * 255).astype(np.uint8), cmap='gray')
axs[2].set_title(f'Haar 2\nPSNR: {psnr_haar_2:.2f}\nEntropia: {entropia_haar_2:.2f}', fontsize=8)
axs[3].imshow((img_restaurada_db10_1 * 255).astype(np.uint8), cmap='gray')
axs[3].set_title(f'Db10 1\nPSNR: {psnr_db10_1:.2f}\nEntropia: {entropia_db10_1:.2f}', fontsize=8)
axs[4].imshow((img_restaurada_db10_2 * 255).astype(np.uint8), cmap='gray')
axs[4].set_title(f'Db10 2\nPSNR: {psnr_db10_2:.2f}\nEntropia: {entropia_db10_2:.2f}', fontsize=8)

for ax in axs:
    ax.axis('off')

print(f'PSNR Haar 1: {psnr_haar_1:.2f}')
print(f'Entropia Haar 1: {entropia_haar_1:.2f}')
print(f'PSNR Haar 2: {psnr_haar_2:.2f}')
print(f'Entropia Haar 2: {entropia_haar_2:.2f}')
print(f'PSNR Db10 1: {psnr_db10_1:.2f}')
print(f'Entropia Db10 1: {entropia_db10_1:.2f}')
print(f'PSNR Db10 2: {psnr_db10_2:.2f}')
print(f'Entropia Db10 2: {entropia_db10_2:.2f}')

plt.savefig('imagens/exercicio_3.png', dpi=300)
