#include "helpers.h"
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    // Loop over all pixels
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int grayscale = round(
                (float) (image[i][j].rgbtGreen + image[i][j].rgbtRed + image[i][j].rgbtBlue) / 3);
            image[i][j].rgbtRed = grayscale;
            image[i][j].rgbtGreen = grayscale;
            image[i][j].rgbtBlue = grayscale;
        }
    }
    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    // Loop over all pixels
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            // Compute sepia values
            int sepiaRed =
                round((float) (.393 * image[i][j].rgbtRed + .769 * image[i][j].rgbtGreen +
                               .189 * image[i][j].rgbtBlue));
            if (sepiaRed > 255)
            {
                sepiaRed = 255;
            }
            int sepiaGreen =
                round((float) (.349 * image[i][j].rgbtRed + .686 * image[i][j].rgbtGreen +
                               .168 * image[i][j].rgbtBlue));
            if (sepiaGreen > 255)
            {
                sepiaGreen = 255;
            }
            int sepiaBlue =
                round((float) (.272 * image[i][j].rgbtRed + .534 * image[i][j].rgbtGreen +
                               .131 * image[i][j].rgbtBlue));
            if (sepiaBlue > 255)
            {
                sepiaBlue = 255;
            }
            image[i][j].rgbtRed = sepiaRed;
            image[i][j].rgbtGreen = sepiaGreen;
            image[i][j].rgbtBlue = sepiaBlue;
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    // Loop through each row
    for (int i = 0; i < height; i++)
    {
        // Loop through the first half of the row
        for (int j = 0; j < width / 2; j++)
        {
            // Swap the pixel at j with the pixel at (width - 1 - j)
            RGBTRIPLE temp = image[i][j];
            int averageGreen = round((float) sumGreen / count);
            image[i][j].rgbtRed = averageRed;
            image[i][j].rgbtGreen = averageGreen;
            image[i][j].rgbtBlue = averageBlue;
        }
    }
    return;
}

// 1. every instance of the copy needs to be proofed against ivalid memory.
// if (i + 1 < height && j + 1 < width && i - 1 >= 0 && j - 1 >= 0)
// 2. if the COPY is valid it needs to be added to the R value, otherwise ommited.
// 3. this needs to be done for R G and B separately.
// 4. therefore temporary R value needs to be created which would be averaged out once addition is
// completed.
