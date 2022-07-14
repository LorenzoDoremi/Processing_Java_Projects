float[][] vals = new float[1000][4];
PImage img;
void setup() {
  size(1200, 800);
  img = loadImage("face.jpg");
  
  for (int i = 0; i < vals.length; i++) {
     vals[i][0] = radians(random(0,360));
     vals[i][1] = random(1,10);
     vals[i][2] = random(0,width);
     vals[i][3] = random(0,height);
  }
}
void draw() {
  background(0);
  fill(255,255,255);
  for(int i = 0; i < vals.length; i++) {
       
       rect(vals[i][2],vals[i][3], 20*cos(vals[i][0]),20*sin(vals[i][0]));
       vals[i][2] += vals[i][1]*cos(vals[i][0]);
       vals[i][3] += vals[i][1]*sin(vals[i][0]);
  
  
  }
}
