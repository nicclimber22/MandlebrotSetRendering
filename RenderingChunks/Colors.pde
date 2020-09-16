int[][] setupColors() {
  color[][] tempColors = new int[hueCount][itterations];
  float hueTravel = 0x2000/hueCount;
  float hueSpeed = 0x8;
  float hueOffset = 0x200;
  float satSpeed = 0xf;
  float satOffset = 0x0;
  float briSpeed = 0x6;
  float briOffset = 0x20;
  float satTaper = 0x20;
  float briTaper = 0x200;

  colorArray = createImage(itterations, hueCount, RGB);
  colorArray.loadPixels();
  for (int j = 0; j < hueCount; j++) {
    for (int i = 0; i < itterations; i++) {
      float satEndTaper = min(1, (itterations - i - 1)/satTaper);
      float briEndTaper = min(1, (itterations - i - 1)/briTaper);
      tempColors[j][i] = color( // HSB
        (i*hueSpeed + hueOffset + j*hueTravel)%0xfff, 
        min((i*satSpeed + satOffset), 0xff)*satEndTaper, 
        min((i*briSpeed + briOffset), 0xff)*briEndTaper);
      colorArray.pixels[i+itterations*j] = tempColors[j][i];
    }
  }
  colorArray.updatePixels();
  colorArray.save("data\\colorArray.png");
  return tempColors;
}
