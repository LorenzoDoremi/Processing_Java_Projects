PImage img;
void setup() {
  size(800, 700);
  img = loadImage("test.png");
  color b = color(125, 50, 10);
  color a = color(0, 155, 159);

  for (int x = 0; x<img.width; x++) {
    for (int y = 0; y<img.height; y++) {

      float br = brightness(img.get(x, y));
      set(
        x, y, color(
        map(br, 0, 255, red(a), red(b)), 
        map(br, 0, 255, green(a), green(b)), 
        map(br, 0, 255, green(a), green(b))
        )
        );
    }
  }
}
void draw() {
}
