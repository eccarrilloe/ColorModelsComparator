public class ColorConversor {
  
  public ColorConversor() { }
  
  public ColorRGB convertPixelToRGB(int colorPixel) {
    float r = red((int) colorPixel) / 255.0;
    float g = green((int) colorPixel) / 255.0;
    float b = blue((int) colorPixel) / 255.0;

    return new ColorRGB(r, g, b);
  }
  
  public ColorHSV convertPixelToHSV(int colorPixel) {
    float r = red((int) colorPixel) / 255.0;
    float g = green((int) colorPixel) / 255.0;
    float b = blue((int) colorPixel) / 255.0;
    
    float max = max(new float[]{r, g, b});
    float min = min(new float[]{r, g, b});
    float delta = max - min;
     
    float v = max;
    float s = max != 0 ? delta / max : 0;
    float h = 0;
    
    if (delta == 0) {
      h = 0;
    } else if (max == r) {
      h = (g - b) / delta;
    } else if (max == g) {
      h = 2.0 + (b - r) / delta;
    } else if (max == b) {
      h = 4.0 + (r - g) / delta;
    }
    
    h *= 60;
    
    if (h < 60)
      h += 360;
    
    return new ColorHSV(h, s, v);
  }
  
  public ColorHSL convertPixelToHSL(int colorPixel) {
    float r = red((int) colorPixel) / 255.0;
    float g = green((int) colorPixel) / 255.0;
    float b = blue((int) colorPixel) / 255.0;
    
    float max = max(new float[]{r, g, b});
    float min = min(new float[]{r, g, b});
    float delta = max - min;
    
    float l = (max + min) / 2;
    float s = delta != 0 ? (delta / (1 - abs((2 * l) - 1))) : 0;
    float h = 0;

    if (delta == 0) {
      h = 0;
    } else if (max == r) {
      h = ((60 * (((g - b) / delta) % 6)) + 360) % 360;
    } else if (max == g) {
      h = (60 * (((b - r) / delta) + 2)) % 360;
    } else if (max == b) {
      h = (60 * (((r - g) / delta) + 4)) % 360;
    }
    
    return new ColorHSL(h, s, l);
  }
}