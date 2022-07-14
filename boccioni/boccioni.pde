PImage img;

void setup() {
  size(900, 900, P3D);
  img = loadImage("Boccioni.jpg");
  img.resize(900, 900);
}

void draw() {
  background(255,255,255);
  color X = color(205, 127, 50);
  fill(X);
  noStroke();
  sphereDetail(3);
  float tiles = 105;
  float tileSize = width/tiles;
  push();
  translate(width/2,height/2);
  rotateY(radians(frameCount));
  
  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      color c = img.get(int(x*tileSize),int(y*tileSize));
      float b = map(brightness(c),0,255,1,0);
      float z = map(b,0,1,-150,150);
      
      push();
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      sphere(tileSize*b/2);
      pop();
      
    }
  }
  pop();
}
