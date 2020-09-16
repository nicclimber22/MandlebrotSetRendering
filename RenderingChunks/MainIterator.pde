class MainIterator {


  float zoomPosX, zoomPosY, zoomScale;
  color[][] colors;
  int[] iterationMap; 
  int chunksIterated, chunkSize, chunksWidth, chunksHeight;

  MainIterator(float posX, float posY, float scale) {
    zoomPosX = posX;
    zoomPosY = posY;
    zoomScale = scale/height;
    colors = setupColors();
    iterationMap = new int[width*height]; // Stores the itteration values for every sample point (ex: every pixel's numerical location)
    chunksIterated = 0;
    chunkSize = 16;
    chunksWidth = ceil(width/float(chunkSize));
    chunksHeight = ceil(height/float(chunkSize));
  }


  void renderIterations() { // Renders image by iterating through rendering chunks
    int startTime = millis();
    int chunkTime = 0;

    while (chunksIterated < chunksWidth*chunksHeight && chunkTime < 1000/frameRate) {
      int x = (chunksIterated % chunksWidth) * chunkSize;
      int y = floor(chunksIterated / chunksWidth) * chunkSize;
      iterateChunk(x, y, chunkSize, chunkSize);
      chunkTime = millis() - startTime;
      chunksIterated++;
    }
    renderIterationMap();
  }


  void iterateChunk(int xMin, int yMin, int xWidth, int yHeight) {
    mainIterator(zoomPosX, zoomPosY, zoomScale, xMin, yMin, xWidth, yHeight);
  }


  void mainIterator(float posX, float posY, float ratio, int xMin, int yMin, int xWidth, int yHeight) {
    float[] xValues = new float[width];
    float[] yValues = new float[height];
    int xMax = min(xMin + xWidth, width);
    int yMax = min(yMin + yHeight, height);

    for (int x = xMin; x < xMax; x++) { // Generates chunk's numberical x values from pixel indices
      xValues[x] = (x - width/2.0)*ratio + posX;
    }
    for (int y = yMin; y < yMax; y++) { // Generates chunk's numberical y values from pixel indices
      yValues[y] = (height/2.0 - y)*ratio + posY;
    }
    
    for (int x = xMin; x < xMax; x++) { // Iterates through chunk pixel indicies and passes numberical cordinates to the itteration calculator
      for (int y = yMin; y < yMax; y++) { 
        iterationMap[x+width*y] = calc(xValues[x], yValues[y]);
      }
    }
  }


  void renderIterationMap() {
    loadPixels();
    for (int i = 0; i < width*height; i++) {
      pixels[i] = colors[frameCount%hueCount][iterationMap[i]];
    }
    updatePixels();
  }
}
