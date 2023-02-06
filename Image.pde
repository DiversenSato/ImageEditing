class Image {
  PImage p;
  
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
    
    else if (flipAxis == FlipAxis.VERTICAL) {
      for (int row = 0; row < p.height / 2; row++) {
        for (int column = 0; column < p.width; column++) {
          color pixelColor = p.pixels[(p.height - 1 - row) * p.width + column];
          p.pixels[(p.height - 1  - row) * p.width + column] = p.pixels[row * p.width + column];
          p.pixels[row * p.width + column] = pixelColor;
        }
      }
    }
      
    p.updatePixels();
  }
  
  void blur() {
    int ra = 5;
    
    int[] temp = new int[p.width * p.height];
    for (int y = 0; y < p.height; y++) {
      for (int x = 0; x < p.width; x++) {
        float r = 0;
        float g = 0;
        float b = 0;
        int count = 0;
        //Find average color around this pixel
        for (int dy = -ra; dy <= ra; dy++) {
          for (int dx = -ra; dx <= ra; dx++) {
            int fx = x+dx;
            int fy = y+dy;
            if (fx >= p.width || fx < 0 || fy >= p.height || fy < 0) {  //Make sure check is inside image bounds
              continue;
            }
            
            int i = fx + fy*p.width;
            r += red(p.pixels[i]);
            g += green(p.pixels[i]);
            b += blue(p.pixels[i]);
            count++;
          }
        }
        
        temp[x + y*p.width] = color(r / count, g / count, b / count);
      }
    }
    
    p.loadPixels();
    for (int i = 0; i < temp.length; i++) {
      p.pixels[i] = temp[i];
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
