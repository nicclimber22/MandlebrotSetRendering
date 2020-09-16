int itterations = 1024;
int hueCount = 1024;

MainIterator mainIterator;

void setup() {
  /** / // Use to switch between windowed and fullscreen
  size(1024, 1024);/*/
  fullScreen();//*/
  frameRate(144);
  colorMode(HSB, 0xfff, 0xff, 0xff);
  mainIterator = new MainIterator(0, 0, 4);
  mainIterator.renderIterations();
}

void draw() {
  mainIterator.renderIterations();
}
