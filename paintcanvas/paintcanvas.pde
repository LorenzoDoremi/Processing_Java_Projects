import javax.swing.JColorChooser;
import java.awt.Color;
boolean lpressed = false;
color currColor = color(0, 0, 0, 3);
PGraphics canvas; 
void setup() {
  size(1200, 700, FX2D);
  background(255, 255, 255);
  noStroke();
  canvas = createGraphics(1000,700);
}
void draw() {
  background(255,255,255);
  
  canvas.beginDraw();
  if (lpressed) {
    polygon(mouseX, mouseY, 80, 30, currColor, canvas);
  }
  
  canvas.endDraw();
  
  image(canvas,0,0);
  stroke(0,0,0);
  noFill();
  ellipse(mouseX, mouseY, 80, 80);
 
  
}


void mousePressed() {
  lpressed = true;
}
void mouseReleased() {
  lpressed = false;
}





void polygon(int x, int y, float size, float vertices, color curcolor, PGraphics canvas) {
  canvas.noStroke();
  canvas.beginShape();
  canvas.fill(color(red(curcolor), green(curcolor), blue(curcolor), 3));
  float angle = 360/vertices;
  for (int i = 0; i < vertices; i++) {

    float rand = random(size-size/10, size+size/10);
    int xx = (int)(x + rand*cos(radians(angle*i)));
    int yy = (int)(y + rand*sin(radians(angle*i)));
    canvas.vertex(xx, yy);
    // ellipse(xx,yy,20,20);
  }
  canvas.endShape();
}
