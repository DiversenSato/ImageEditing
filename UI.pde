class UI {
  int buttonWidth = 200;
  int buttonHeight = 70;
  color buttonColor = #dddddd;
  
  void show() {
    noStroke();
    fill(buttonColor);
    textSize(buttonWidth / 7);
    rectMode(CORNER);
    textAlign(CENTER, CENTER);
    
    rect(0, 0, buttonWidth, buttonHeight);
    rect(0, (buttonHeight + 10) * 1, buttonWidth, buttonHeight);
    rect(0, (buttonHeight + 10) * 2, buttonWidth, buttonHeight);
    rect(0, (buttonHeight + 10) * 3, buttonWidth, buttonHeight);
    rect(0, (buttonHeight + 10) * 4, buttonWidth, buttonHeight);
    rect(0, height - buttonHeight, buttonWidth, buttonHeight);
    
    fill(255);
    text("Open Image", buttonWidth / 2, buttonHeight / 2);
    text("Horizontal Flip", buttonWidth / 2, buttonHeight / 2 + (buttonHeight + 10) * 1);
    text("Vertical Flip", buttonWidth / 2, buttonHeight / 2 + (buttonHeight + 10) * 2);
    text("Grayscale", buttonWidth / 2, buttonHeight / 2 + (buttonHeight + 10) * 3);
    text("Blur", buttonWidth / 2, buttonHeight / 2 + (buttonHeight + 10) * 4);
    text("Save Image", buttonWidth / 2, height - buttonHeight / 2);
  }
}
