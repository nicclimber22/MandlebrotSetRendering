int itterations = 1024;

MainIterator mainIterator;

void setup() {
  size(1024, 1024);
  frameRate(144);
  colorMode(HSB, 0xfff, 0xff, 0xff);
  mainIterator = new MainIterator(-.75, 0, 2);
  mainIterator.renderIterations();
}

void draw() {
  mainIterator.renderIterations();
}
