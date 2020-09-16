int[][] setupColors() {
  color[][] tempColors = new int[hueCount][itterations];
  float hueTravel = 0x2000/hueCount;
  float hueSpeed = 0x8;
  float hueOffset = 0x200;
  float satSpeed = 0xf;
  float satOffset = 0x0;
  float briSpeed = 0x6;
  float briOffset = 0x20;

  for (int j = 0; j < hueCount; j++) {
    for (int i = 0; i < itterations; i++) {
      float endTapper = min(1, (itterations - i)/0x40);
      tempColors[j][i] = color( // HSB
        (i*hueSpeed + hueOffset + j*hueTravel)%0xfff, 
        min((i*satSpeed + satOffset)*endTapper, 0xff), 
        min((i*briSpeed + briOffset)*endTapper, 0xff));
    }
  }
  return tempColors;
}
