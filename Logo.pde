/**
 * The Class Logo store logos information and the PImage object.
 * @author: eccarrilloe
 * @version: 1.0
 */
 
public class Logo {

  private String imagePath;
  private PImage image;

  public Logo(String imagePath) {
    this.imagePath = imagePath;
    this.image = loadImage(imagePath);
  }
  
  public void draw() {
    background(Config.backgroundColor);
    if (this.image.width > Config.width) {
      image(this.image, 0, 0, Config.width, this.image.height * Config.width / this.image.width);
    } else if (this.image.height > Config.height) {
      image(this.image, 0, 0, this.image.width * Config.height / this.image.height, Config.height);
    } else {
      image(this.image, 0, 0);
    }
  }
  
  public PImage getImage() {
    return this.image;
  }
}