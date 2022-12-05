class Image {
  PImage p;
  
  Image(String fileName) {
    p = loadImage(fileName);
  }
  
  void grayScale() {
    p.loadPixels();
    
    for (int y = 0; y < p.height; y++) {
      for (int x = 0; x < p.width; x++) {
        int i = x + y*p.width;
        
        color c = p.pixels[i];
        p.pixels[i] = color(((float)red(c) + (float)green(c) + (float)blue(c)) / 3f);
      }
    }
    
    p.updatePixels();
  }
}
