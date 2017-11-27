# Color Models Comparator

**Author**: Edward Carrillo [[_eccarrilloe_](https://github.com/eccarrilloe)]

This project seeks to compare several color models from the creation of color palettes based on the predominance of colors in the logo of a company.

## How It Works

Given an initial image in PNG format, do the following steps:

1. Convert each pixel of the image from the RGB color space to the different color models we want to compare.
2. Categorize each color of the converted image based on a classification algorithm which compare the distance of each component of the color model for each pixel.
3. Using the resulting color array, the color palette is created, taking in account the predominant color in the image(the one most "repeated" within the image).
4. Compare all resulting palettes for each color model. Also the complexity is compared to take in account the performance of the algorithm for each color model.

## Instructions

To run the project, do the followings steps:

1. Open the file 'Project.pde' using Processing.
2. Run the project.
3. The first window displays the original image.
4. To switch to Palette view, use SPACE key.
5. To switch between color models in the Palette view, use the keys '1', '2', and '3'.

### Color Models

1. RGB Color Model
2. HSV Color Model
3. HSL Color Model
