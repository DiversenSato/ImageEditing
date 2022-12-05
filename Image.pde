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
  
  void flip(FlipAxis flipAxis) {
    p.loadPixels();
    if (flipAxis == FlipAxis.HORIZONTAL) {
      for (int row = 0; row < p.height; row++) {
        for (int column = 0; column < p.width / 2; column++) {
          color pixelColor = p.pixels[row * p.width + (p.width -1 - column)];
          p.pixels[row * p.width + (p.width -1 - column)] = p.pixels[row * p.width + column];
          p.pixels[row * p.width + column] = pixelColor;
        }
      }
    }
    
    if (flipAxis == FlipAxis.VERTICAL) {
    }
      
    p.updatePixels();
  }
}

enum FlipAxis {
  VERTICAL,
  HORIZONTAL
}

void printColor(color pixelColor) {
  println("Color ");
  println(red(pixelColor));
  println(green(pixelColor));
  println(blue(pixelColor));
}
