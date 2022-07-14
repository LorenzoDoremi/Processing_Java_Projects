void setup() {

  size(1900, 800, P2D);
  // fullScreen();
 background(0);
  noStroke();
}
int time = 0;
void draw() {

  
   // aa = color(random(0, 255), random(0, 255), random(0, 255));
  //  ab = color(random(0, 255), random(0, 255), random(0, 255));
    gradientObject(width/2 + time/20*cos(radians(time)), height/2+ time/20*sin(radians(time)), 10);
   time+=10;
}
color aa = color(255, 0, 0);
color ab = color(212, 224, 0);
// returns a sphere with a gradient
void gradientObject(float x, float y, float radius) {

  for (int i = (int)(x-radius); i < x+radius; i++) {
    for (int j = (int)(y-radius); j < y+radius; j++) {
      if (dist(x, y, i, j) <= radius) {

        color c = gradientInterpolation(aa, ab, j, y-radius, y+radius);
        set(i, j, c);
      }
    }
  }
}

color gradientInterpolation(color a, color b, float curr, float start, float end) {
  float range = end-start;
  float rr = (red(b) - red(a))/range;
  float rg = (green(b) - green(a))/range;
  float rb = (blue(b) - blue(a))/range;

  float red = red(a) + rr*(curr-start);

  float green = green(a) + rg*(curr-start);
  float blue = blue(a) + rb*(curr-start);
  return color(red, green, blue);
}
