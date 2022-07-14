import processing.video.*;

Capture cam;
boolean detected = false;
PVector position = new PVector();
void setup() {
  size(1200, 800, FX2D);
  noStroke();
  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {

  if (cam.available() == true) {
    cam.read();
  }

  image(cam, 0, 0);
  detect();
  fill(255, 255, 255);
  ellipse(position.x, position.y, 50, 50);
  text(frameRate, 20, 20);
}

void detect() {
  int sumX = 0;
  int sumY = 0;
  int tot = 1;
  for (int i = 0; i < cam.width; i+=1) {
    for (int j = 0; j < cam.height; j+=1) {
      color c = cam.get(i, j);
      if (green(c) > 180 && blue(c) < 100) {
        sumX+=i;
        sumY+=j;
        tot++;
      }
    }
  }
  position = new PVector( sumX/tot * width/cam.width, sumY/tot * height/cam.height);
}
