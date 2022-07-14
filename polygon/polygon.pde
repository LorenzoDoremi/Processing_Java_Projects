void setup() {
  size(800, 600);
  noLoop();
}

void draw() {
  background(0);
  polygon(width/2, height/2, 300, 160);
}

void polygon(int x, int y, float size, float vertices) {
  beginShape();
  fill(255, 0, 0);
  float angle = 360/vertices;
  for (int i = 0; i < vertices; i++) {

    float rand = random(size-20, size+20);
    int xx = (int)(x + rand*cos(radians(angle*i)));
    int yy = (int)(y + rand*sin(radians(angle*i)));
    vertex(xx, yy);
    // ellipse(xx,yy,20,20);
  }
  endShape();
}
