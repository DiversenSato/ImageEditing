Image i;

void setup() {
  size(800, 800);
  noSmooth();
  
  i = new Image("Thigh1.jpg");
  i.flip(FlipAxis.VERTICAL);
  i.grayScale();
  
  image(i.p, 0, 0, width, height);
}
