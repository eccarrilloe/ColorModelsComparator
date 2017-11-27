/**
 * The Class ImageAnalyzer process the logo using the specified color format T.
 * @author: eccarrilloe
 * @version: 1.0
 */

import java.util.*;

public class ImageAnalyzer<T extends Comparable<T>> {

  private Logo logo;
  private int colorModel;
  private List<T> colors;
  private final ColorConversor conversor = new ColorConversor();
  
  public ImageAnalyzer(Logo logo, int colorModel) {
    this.logo = logo;
    this.colorModel = colorModel;
    this.colors = new ArrayList();
  }
  
  public void analyzeImage() {
    this.colors = new ArrayList();
    
    PImage image = this.logo.getImage();
    image.loadPixels();
    
    if (image.width > Config.width) {
      image.resize(Config.width, image.height * Config.width / image.width);
    } else if (image.height > Config.height) {
      image.resize(image.width * Config.height / image.height, Config.height);
    }

    List<T> imagePixels = this.convertImageToFormat(image.pixels);

    for (int i = 0; i < imagePixels.size(); i++) {
      this.checkAndAddColor(imagePixels.get(i));
    }
    
    Collections.sort(this.colors);
  }
  
  private void checkAndAddColor(T pixel) {
    for (int i = 0; i < this.colors.size(); i++) {
      if (this.colors.get(i).equals(pixel)) {
        ColorModel duplicate = (ColorModel) this.colors.get(i);
        
        duplicate.addOne();
        return;
      }
    }

    this.colors.add(pixel);
  }
  
  private List<T> convertImageToFormat(int[] imagePixels) {
    List<T> convertedPixels = new ArrayList(imagePixels.length);

    if (this.colorModel == 0) {
      for (int i = 0; i < imagePixels.length; i++)
        convertedPixels.add((T) this.conversor.convertPixelToRGB(imagePixels[i]));
    } else if (this.colorModel == 1) {
      for (int i = 0; i < imagePixels.length; i++)
        convertedPixels.add((T) this.conversor.convertPixelToHSV(imagePixels[i]));
    } else if (this.colorModel == 2) {
      for (int i = 0; i < imagePixels.length; i++)
        convertedPixels.add((T) this.conversor.convertPixelToHSL(imagePixels[i]));
    }
    
    return convertedPixels;
  }
  
  public void draw() {
    background(Config.backgroundColor);
    
    for (int i = 0; i < (this.colors.size() < 5 ? this.colors.size() : 5); i++) {
      ColorModel currentColor = (ColorModel) this.colors.get(i);
      stroke(Config.strokeColor);
      
      currentColor.printColor(i);
    }
  }
}