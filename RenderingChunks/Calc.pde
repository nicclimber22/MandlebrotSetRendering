int calc(float X, float Y) {
  return calc(X, Y, itterations);
}

int calc(float X, float Y, int max) {
  int itt = -1;
  float I = 0;
  float Z = 0;
  float IZ = 0;
  while (itt < max - 1 & I*I + Z*Z < 4) {
    Z = Z*Z - I*I + X;
    I = IZ + Y;
    IZ = 2*I*Z;
    itt++;
  }
  return itt;
}
