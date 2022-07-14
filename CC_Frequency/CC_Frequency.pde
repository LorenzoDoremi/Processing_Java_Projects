PImage img;
void setup() {

  size(800, 800, P2D);
  background(0);
//  stroke(32, 32, 32);
//  strokeWeight(2);
//  noLoop();
noStroke();
 img = loadImage("disp2.jpg");
 img.resize(3200,3200);
}

float magn = 1;
int padding = 200;
float frequency = 10;
float time = 0;
float noiseScale = 0.02;
void draw() {
  background(232, 232, 232);
  background(0);
  magn = 1;

  for (int i = padding; i < width-padding; i+=7) {
    for (int j = padding; j < width-padding; j+=7) {
    //  PVector force = new PVector(i-mouseX,j-mouseY);
    PVector  force = new PVector(10,10);
      force.normalize();
      float f = brightness(img.get(((int)(i+time))%img.width,((int)(j+time))%img.height));
      fill(f,f,f);
      ellipse(i + force.x*f/5, j + force.y*f/4, 3, 3);
    }
  }
  time+= 1;
}


/*for (int i = padding; i < width-padding; i++) {
 for (int j = padding; j < height-padding; j+=20) {
 stroke(dist(width/2,height/2,i,j),32,32);
 line(
 i , 
 j+magn*cos(radians(i*frequency)), 
 i, 
 j+magn*cos(radians((i+1)*frequency))
 );
 
 }
 magn+=0.03;
 }
 */
