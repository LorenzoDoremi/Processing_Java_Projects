PImage img;
ArrayList buckets = new ArrayList();
int bucketNum = 40;
float side = 0;
void setup() {

  size(900, 900);
  img = loadImage("img.png");
  img.resize(900, 900);
  side = sqrt(bucketNum);

  for (int x = 0; x < width; x+=  width/side) {
    for (int y = 0; y < height; y+= (height/side)) {

      color r = img.get(x, y);

      buckets.add(new PVector(red(r), green(r), blue(r)));
    }
  }
  print(buckets.size());
}
void draw() {

  image(img, 0, 0);
}
