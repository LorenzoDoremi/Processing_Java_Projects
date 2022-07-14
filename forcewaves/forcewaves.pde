float[][][] values;
void setup() {
 
  size(400, 400, FX2D);
  values = new float[400][400][5];
  for (int x = 0; x < 400; x++) {
    for (int y = 0; y < 400; y++) {
      for (int z = 0; z < 4; z++) {
        values[x][y][z] = 0;
      }
    }
  }
}

void mouseClicked() {
  values[mouseX][mouseY][0] = random(128,255);
  values[mouseX][mouseY][1] = random(128,255);
  values[mouseX][mouseY][2] = random(128,255);
  values[mouseX][mouseY][3] = random(128,255);
}
void draw() {

  for (int x = 1; x < 400-1; x++) {
    for (int y = 1; y < 400-1; y++) {
      float max = 0;
      int index = 0;
      for (int z = 0; z < 4; z++) {
        if (values[x][y][z] > max) {
          max = values[x][y][z];
          index = z;
        }
      }
      if (index == 0) {
        values[x][y-1][0] = values[x][y][0];
      } else if (index == 1) { ues[x][y][1];
      } else if (index == 2) {
        values[x][y+1][2] = values[x][y][2];
      } else if (index == 3) {
        values[x-1][y][3] = values[x][y][3];
      }
      values[x][y-1][0] +=random(0,1);
      values[x][y+1][0] +=  random(0,1);
      values[x-1][y][0] +=  random(0,1);
      values[x+1][y-1][0] +=  random(0,1);
      
      
      values[x][y][4] = 
      (int)(values[x][y][0] + values[x][y][1]+values[x][y][2]+values[x][y][3]);
      set(x,y,color(values[x][y][4],12,12));
      values[x][y][4]--;
      
     
    }
  }

}
