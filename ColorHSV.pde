/**
 * The Class ColorHSV store information about color in HSV format.
 * @author: eccarrilloe
 * @version: 1.0
 */

public class ColorHSV extends ColorModel implements Comparable<ColorHSV> {
  
  public float h;
  public float s;
  public float v;
  public int count;
  
  public ColorHSV(float h, float s, float v) {
    this.h = h;
    this.s = s;
    this.v = v;

    this.count = 1;
  }
  
  @Override
  public int compareTo(ColorHSV otherColor) {
    return otherColor.count - this.count;
  }
  
  public void addOne() {
    this.count += 1;
  }
  
  @Override
  public boolean equals(Object other) {
    if (other == null) return false;
    if (other == this) return true;
    if (!(other instanceof ColorHSV)) return false;
    
    ColorHSV otherColor = (ColorHSV) other;
    boolean isEqual = true;

    isEqual = isEqual && abs(this.h - otherColor.h) < Config.colorError;
    isEqual = isEqual && abs(this.s - otherColor.s) < Config.colorError;
    isEqual = isEqual && abs(this.v - otherColor.v) < Config.colorError;

    return isEqual;
  }
  
  @Override
  public void printColor(int i) {
    if (this.count < 1000)
      return;

    int hi = ((int) Math.floor(this.h / 60)) % 6;
    float f = ((h / 60) % 6) - hi;
    float p = this.v * (1 - this.s);
    float q = this.v * (1 - (f * this.s));
    float t = this.v * (1 - ((1 - f) * this.s));
    
    float r = 0;
    float g = 0;
    float b = 0;

    switch(hi) {
      case 0:
        r = this.v;
        g = t;
        b = p;
        break;
      case 1:
        r = 1;
        g = this.v;
        b = p;
        break;
      case 2:
        r = p;
        g = this.v;
        b = t;
        break;
      case 3:
        r = p;
        g = q;
        b = this.v;
        break;
      case 4:
        r = t;
        g = p;
        b = this.v;
        break;
      case 5:
        r = this.v;
        g = p;
        b = q;
        break;
      case 6:
        break;
      default:
        break;
    }

    String colorText = "";

    fill(r * 255, g * 255, b * 255);
    rect(0, i * 50, 50, 50);
    
    colorText += "HUE: " + Float.toString(this.h);
    colorText += " - SAT: " + Float.toString(this.s);
    colorText += " - VAL: " + Float.toString(this.v);
    colorText += " - COUNT: " + Integer.toString(this.count);
    fill(Config.textColor);
    text(colorText, 60, i * 50 + 25);
  }
}