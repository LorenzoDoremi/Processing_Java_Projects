void setup() {
  size(1200, 700);
  noLoop();
  noStroke();
  background(255, 255, 255);
}

color[] colors =  {
  color(212, 120, 20), 
  color(120, 212, 120), 
  color(30, 160, 250)};
void draw() {
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      fill(colors[(int)(random(0, 3))], 10);
      polygon(i*width/100, j*height/100, random(20, 200), random(8, 24));
    }
  }
  saveFrame();
}



void polygon(int x, int y, float size, float vertices) {
  beginShape();

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
