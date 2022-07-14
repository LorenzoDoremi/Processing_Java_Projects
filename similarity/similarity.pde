PImage img;
void setup() {
  size(1600, 900);
  img = loadImage("img.jpg");
  similar();
}
void draw() {
  image(img,0,0);
}

void similar() {

  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int sum = 0;
      color[] colors = {
        img.get(x, y), 
        img.get(x+1, y), 
        img.get(x-1, y), 
        img.get(x, y+1), 
        img.get(x, y-1)
      };
      for (int i = 0; i < colors.length; i++) {
        sum += abs(brightness(colors[0]) - brightness(colors[i]));
      }
      img.set(x, y, sum);
    }
  }
}
