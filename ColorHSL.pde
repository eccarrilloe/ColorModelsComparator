/**
 * The Class ColorHSL store information about color in HSL format.
 * @author: eccarrilloe
 * @version: 1.0
 */

public class ColorHSL extends ColorModel implements Comparable<ColorHSL> {
  
  public float h;
  public float s;
  public float l;
  public int count;
  
  public ColorHSL(float h, float s, float l) {
    this.h = h;
    this.s = s;
    this.l = l;

    this.count = 1;
  }
  
  @Override
  public int compareTo(ColorHSL otherColor) {
    return otherColor.count - this.count;
  }
  
  public void addOne() {
    this.count += 1;
  }
  
  @Override
  public boolean equals(Object other) {
    if (other == null) return false;
    if (other == this) return true;
    if (!(other instanceof ColorHSL)) return false;
    
    ColorHSL otherColor = (ColorHSL) other;
    boolean isEqual = true;

    isEqual = isEqual && abs(this.h - otherColor.h) < (Config.colorError / 360.0);
    isEqual = isEqual && abs(this.s - otherColor.s) < (Config.colorError / 100.0);
    isEqual = isEqual && abs(this.l - otherColor.l) < (Config.colorError / 100.0);

    return isEqual;
  }
  
  @Override
  public void printColor(int i, int totalPixels) {
    if (this.count < 1000)
      return;  
    
    float c = (1 - abs((2 * this.l) - 1)) * this.s;
    float x = c * (1 - abs((this.h / 60) % 2 - 1));
    float m = this.l - (c / 2);
    
    float _r = 0;
    float _g = 0;
    float _b = 0;
    
    if (this.h >= 0 && this.h < 60) {
      _r = c; _g = x; _b = 0;
    } else if (this.h >= 60 && this.h < 120) {
      _r = x; _g = c; _b = 0;
    } else if (this.h >= 120 && this.h < 180) {
      _r = 0; _g = c; _b = x;
    } else if (this.h >= 180 && this.h < 240) {
      _r = 0; _g = x; _b = c;
    } else if (this.h >= 240 && this.h < 300) {
      _r = x; _g = 0; _b = c;
    } else if (this.h >= 300 && this.h < 360) {
      _r = c; _g = 0; _b = x;
    }
    
    float r = _r + m;
    float g = _g + m;
    float b = _b + m;
    
    String colorText = "";

    fill(r * 255, g * 255, b * 255);
    rect(10, i * 60 + 10, 50, 50);
    
    colorText += "HUE: " + Float.toString(this.h);
    colorText += " - SAT: " + Float.toString(this.s);
    colorText += " - LIGHT: " + Float.toString(this.l);
    colorText += " - COUNT: " + Float.toString(((float) this.count) / ((float) totalPixels) * 100);
    colorText += "%";
    
    fill(Config.textColor);
    text(colorText, 70, i * 60 + 30);
   
  }
}