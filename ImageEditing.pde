Image i;

void setup() {
  size(800, 800);
  
  i = new Image("Thigh1.jpg");
  i.grayScale();
  
  image(i.p, 0, 0, width, height);
}
