/**
 * This project seeks to compare several color models from the creation of color schemes
 * based on the predominance of colors in the logo of a company.
 * @author: eccarrilloe
 * @version: 1.0
 */

import java.util.*;

/*
 * State:
 * 0. Show Original Image
 * 1. Show Color Analysis
 * 2. Show Color Scheme
 */
int state;

/*
 * ColorModel:
 * 0. RGB
 * 1. HSV
 * 2. HSL
 */
int colorModel;

Logo logo;
ImageAnalyzer<ColorRGB> imageAnalyzerRGB;
ImageAnalyzer<ColorHSV> imageAnalyzerHSV;
ImageAnalyzer<ColorHSL> imageAnalyzerHSL;

void setup() {
  size(640, 480);
  background(Config.backgroundColor);
  imageMode(CORNER);
  state = 0;
  colorModel = 0;
  
  logo = new Logo("unal.png");
  imageAnalyzerRGB = new ImageAnalyzer(logo, 0);
  imageAnalyzerHSV = new ImageAnalyzer(logo, 1);
  imageAnalyzerHSL = new ImageAnalyzer(logo, 2);

  imageAnalyzerRGB.analyzeImage();
  imageAnalyzerHSV.analyzeImage();
  imageAnalyzerHSL.analyzeImage();
}

void draw() {
  background(Config.backgroundColor);
  
  switch (state) {
    case 0:
      logo.draw();
      break;
    case 1:
      switch(colorModel) {
        case 0:
          imageAnalyzerRGB.draw();
          break;
        case 1:
          imageAnalyzerHSV.draw();
          break;
        case 2:
          imageAnalyzerHSL.draw();
          break;
        default:
          break;
      }
      break;
    default:
      state = 0;
  }
}

void keyPressed() {
  if (key == ' ') {
    state = (state + 1) % 2;  
  } else{
    switch(key) {
      case '1':
        colorModel = 0;
        break;
      case '2':
        colorModel = 1;
        break;
      case '3':
        colorModel = 2;
        break;
      default:
        break;
    }
  }
}