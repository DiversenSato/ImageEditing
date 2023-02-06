Image i;
UI ui;

void setup() {
  //size(800, 800);
  fullScreen();
  noSmooth();
  ui = new UI();
  i = new Image();
}

void draw() {
  background(0);
  if (i.p != null) image(i.p, 0, 0, width, height);
  ui.show();
}

void mousePressed() {
  if (mouseX >= 0 && mouseX <= ui.buttonWidth) {
    
    if (mouseY >= 0 && mouseY <= ui.buttonHeight) {
      selectInput("Select image to open: ", "imageSelected");
    }
    
    else if (mouseY >= ui.buttonHeight + 10 && mouseY <= ui.buttonHeight * 2 + 10) {
      i.flip(FlipAxis.HORIZONTAL);
    }
    
    else if (mouseY >= ui.buttonHeight * 2 + 20 && mouseY <= ui.buttonHeight * 3 + 20) {
      i.flip(FlipAxis.VERTICAL);
    }
    
    else if (mouseY >= ui.buttonHeight * 3 + 30 && mouseY <= ui.buttonHeight * 4 + 30) {
      i.grayScale();
    }
    
    else if (mouseY >= ui.buttonHeight * 4 + 40 && mouseY <= ui.buttonHeight * 5 + 40) {
      i.blur();
    }
    
    else if (mouseY >= height - ui.buttonHeight) {
      i.p.save("Output.jpg");
    }
  }
}

void imageSelected(File selection) {
  if (selection != null) {
    i.p = loadImage(selection.getAbsolutePath());
  }
}
