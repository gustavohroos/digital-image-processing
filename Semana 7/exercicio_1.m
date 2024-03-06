pkg load image;

% Function to scale image pixel values to 0-255
function scaled_img = scale_image(img)
    min_val = min(img(:));
    max_val = max(img(:));
    scaled_img = (img - min_val) * (255 / (max_val - min_val));
    scaled_img = uint8(scaled_img);
end

function plot_results(noisy_img, title_prefix)
    for N = [3, 5, 7]
        media_img = scale_image(restaura_media(noisy_img, N));
        mediana_img = scale_image(restaura_mediana(noisy_img, N));
        imwrite(media_img, ['imagens/', title_prefix, '_media_', int2str(N), '.png']);
        imwrite(mediana_img, ['imagens/', title_prefix, '_mediana_', int2str(N), '.png']);
    end
end

img = imread('imagens/barbara_gray.bmp');

img_gauss_1 = imnoise(img, 'gaussian', 0, 0.01);
img_gauss_2 = imnoise(img, 'gaussian', 0.30, 0.01);
img_gauss_3 = imnoise(img, 'gaussian', 0.50, 0.05);
img_poisson = imnoise(img, 'poisson');
img_sep_1 = imnoise(img, 'salt & pepper', 0.05);
img_sep_2 = imnoise(img, 'salt & pepper', 0.25);

imwrite(scale_image(img_gauss_1), 'imagens/gauss_1.png');
imwrite(scale_image(img_gauss_2), 'imagens/gauss_2.png');
imwrite(scale_image(img_gauss_3), 'imagens/gauss_3.png');
imwrite(scale_image(img_poisson), 'imagens/poisson.png');
imwrite(scale_image(img_sep_1), 'imagens/saltandpepper_1.png');
imwrite(scale_image(img_sep_2), 'imagens/saltandpepper_2.png');

plot_results(img_gauss_1, 'gauss_1');
plot_results(img_gauss_2, 'gauss_2');
plot_results(img_gauss_3, 'gauss_3');
plot_results(img_poisson, 'poisson');
plot_results(img_sep_1, 'salt_&_pepper_1');
plot_results(img_sep_2, 'salt_&_pepper_2');



