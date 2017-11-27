/**
 * The Class ColorRGB store information about color in RGB format.
 * @author: eccarrilloe
 * @version: 1.0
 */

public class ColorRGB extends ColorModel implements Comparable<ColorRGB> {
  
  public float r;
  public float g;
  public float b;
  public int count;
  
  public ColorRGB(float r, float g, float b) {
    this.r = r;
    this.g = g;
    this.b = b;

    this.count = 1;
  }
  
  @Override
  public int compareTo(ColorRGB otherColor) {
    return otherColor.count - this.count;
  }

  public void addOne() {
    this.count += 1;
  }
  
  @Override
  public boolean equals(Object other) {
    if (other == null) return false;
    if (other == this) return true;
    if (!(other instanceof ColorRGB)) return false;
    
    ColorRGB otherColor = (ColorRGB) other;
    boolean isEqual = true;

    isEqual = isEqual && abs(this.r - otherColor.r) < (Config.colorError / 255.0);
    isEqual = isEqual && abs(this.g - otherColor.g) < (Config.colorError / 255.0);
    isEqual = isEqual && abs(this.b - otherColor.b) < (Config.colorError / 255.0);

    return isEqual;
  }
  
  @Override
  public void printColor(int i) {
    if (this.count < 1000)
      return;

    String colorText = "";

    fill(this.r * 255, this.g * 255, this.b * 255);
    rect(0, i * 50, 50, 50);
    
    colorText += "RED: " + Float.toString(this.r * 255);
    colorText += " - GREEN: " + Float.toString(this.g * 255);
    colorText += " - BLUE: " + Float.toString(this.b * 255);
    colorText += " - COUNT: " + Integer.toString(this.count);
    fill(Config.textColor);
    text(colorText, 60, i * 50 + 25);
  }
}