import os
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
from PIL import Image

def prettify_title(title):
    title_parts = title.split('_')
    if 'media' in title_parts or 'mediana' in title_parts:
        filter_type = 'Median' if 'mediana' in title_parts else 'Mean'
        n_value = title_parts[-1]
        base_title = ' '.join(title_parts[:-2]).replace('&', '&').title()
        pretty_title = f"{base_title} ({filter_type}, N={n_value})"
    else:
        pretty_title = title.replace('_', ' ').replace('&', '&').title()
    return pretty_title

def main():
    image_folder = 'imagens/'
    
    image_rows = [
        ['gauss_1.png', 'gauss_1_media_3.png', 'gauss_1_media_5.png', 'gauss_1_media_7.png'],
        ['gauss_1.png', 'gauss_1_mediana_3.png', 'gauss_1_mediana_5.png', 'gauss_1_mediana_7.png'],
        ['gauss_2.png', 'gauss_2_media_3.png', 'gauss_2_media_5.png', 'gauss_2_media_7.png'],
        ['gauss_2.png', 'gauss_2_mediana_3.png', 'gauss_2_mediana_5.png', 'gauss_2_mediana_7.png'],
        ['gauss_3.png', 'gauss_3_media_3.png', 'gauss_3_media_5.png', 'gauss_3_media_7.png'],
        ['gauss_3.png', 'gauss_3_mediana_3.png', 'gauss_3_mediana_5.png', 'gauss_3_mediana_7.png'],
        ['poisson.png', 'poisson_media_3.png', 'poisson_media_5.png', 'poisson_media_7.png'],
        ['poisson.png', 'poisson_mediana_3.png', 'poisson_mediana_5.png', 'poisson_mediana_7.png'],
        ['salt_&_pepper_1.png', 'salt_&_pepper_1_media_3.png', 'salt_&_pepper_1_media_5.png', 'salt_&_pepper_1_media_7.png'],
        ['salt_&_pepper_1.png', 'salt_&_pepper_1_mediana_3.png', 'salt_&_pepper_1_mediana_5.png', 'salt_&_pepper_1_mediana_7.png'],
        ['salt_&_pepper_2.png', 'salt_&_pepper_2_media_3.png', 'salt_&_pepper_2_media_5.png', 'salt_&_pepper_2_media_7.png'],
        ['salt_&_pepper_2.png', 'salt_&_pepper_2_mediana_3.png', 'salt_&_pepper_2_mediana_5.png', 'salt_&_pepper_2_mediana_7.png'],
    ]

    rows_per_page = 2
    image_scale_factor = 1

    with PdfPages('images_plot.pdf') as pdf:
        for i in range(0, len(image_rows), rows_per_page):
            num_cols = max(len(row) for row in image_rows[i:i+rows_per_page])
            fig, axs = plt.subplots(rows_per_page, num_cols, figsize=(11.7 * image_scale_factor, 8.3 * image_scale_factor))
            fig.subplots_adjust(hspace=0.3, wspace=0.1)

            for row_idx, row in enumerate(image_rows[i:i+rows_per_page]):
                for col_idx, image_name in enumerate(row):
                    image_path = os.path.join(image_folder, image_name)
                    if os.path.exists(image_path):
                        image = Image.open(image_path).convert('L')
                        axs[row_idx, col_idx].imshow(image, cmap='gray')
                        prettified_title = prettify_title(image_name.replace('.png', ''))
                        axs[row_idx, col_idx].set_title(prettified_title, fontsize=12 * image_scale_factor)
                        axs[row_idx, col_idx].axis('off')
                    else:
                        axs[row_idx, col_idx].axis('off')

                for col_idx in range(len(row), num_cols):
                    axs[row_idx, col_idx].axis('off')

            pdf.savefig(fig)
            plt.close(fig)

if __name__ == '__main__':
    main()
