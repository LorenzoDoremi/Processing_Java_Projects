PImage img1, img2;
int t = 0;
int[] noise = new int[800*1000 +1];
void setup() {
  size(800, 1000, FX2D);
  img1 = loadImage("paint1.jpeg");
  img2 = loadImage("paint2.jpg");
  img1.resize(800, 1000);
  img2.resize(800, 1000);
   for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      float val = value(i, j, 2);
      int omo = (int)map(val,0,8000,0,255);
      color k = img1.get(i,j);
      
      set(i, j, color(red(k)-omo, green(k)-omo, blue(k)-omo));
    }
  }
}

void draw() {



}

float value(int i, int j, int size) {
  int value = 0;
  for (int x = i-size; x < i+size*2; x++) {
    for (int y = j-size; y < j+size*2; y++) {

      value +=  abs(brightness(img1.get(i, j))-brightness(img1.get(x, y)));
    }
  }


  return value;
}
