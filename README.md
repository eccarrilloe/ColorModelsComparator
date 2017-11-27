# Color Models Comparator

**Author**: Edward Carrillo [[_eccarrilloe_](https://github.com/eccarrilloe)]

This project seeks to compare several color models from the creation of color palettes based on the predominance of colors in the logo of a company.

## How It Works

Given an initial image in PNG format, do the following steps:

1. Convert each pixel of the image from the RGB color space to the different color models we want to compare.
2. Categorize each color of the converted image based on a classification algorithm which compare the distance of each component of the color model for each pixel.
3. Using the resulting color array, the color palette is created, taking in account the predominant color in the image(the one most "repeated" within the image).
4. Compare all resulting palettes for each color model. Also the complexity is compared to take in account the performance of the algorithm for each color model.
