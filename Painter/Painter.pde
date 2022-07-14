PImage img;
void setup() {

size(1600,800,P2D);
background(255,255,255);
noStroke();
noLoop();
  img = loadImage("painter.jpg");
  img.resize(1600,800);
}

color[] colors =  {

#F85252,
#BC2222,
#FFD749,
};

color[] colors2 =  {

#528AF8,
#82578C,
#FF4949,
};

void draw() {
 
  for(int i = 0; i < 10000; i++) {
  polygon((int)random(0,width), (int)random(0,height), random(4,130), (int)random(3,24));
}
}




void polygon(int x, int y, float size, float vertices) {
  beginShape();
 fill(colors2[(int)random(0,3)],random(0,30));
 
  float angle = 360/vertices;
  for (int i = 0; i < vertices; i++) {
    float ssize = brightness(img.get(x,y));
    float rand = random(size-20, size+20);
 
    int xx = (int)(x + rand*cos(radians(angle*i)));
    int yy = (int)(y + rand*sin(radians(angle*i)));
    vertex(xx, yy);
    // ellipse(xx,yy,20,20);
  }
  endShape();
}
