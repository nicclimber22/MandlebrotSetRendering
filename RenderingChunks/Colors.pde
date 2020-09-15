int[] setupColors() {
  color[] tempColors = new int[itterations];
  for (int i = 0; i < itterations; i++) {
    float endTapper = min(1, (itterations - i)/0x40);
    tempColors[i] = color( // HSB
      (0x20*i - 0x200)%0xfff, 
      min(0x8*i*endTapper, 0xff), 
      min(0x8*i*endTapper, 0xff));
  }
  return tempColors;
}
