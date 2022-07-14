ArrayList<Particle> particles = new ArrayList();
public boolean pressed = false;
PImage img;
void setup() {

  size(800, 700, FX2D);
  noStroke();
  img = loadImage("paint.png");
  img.resize(800,700);


  for (int i = 0; i < 100000; i++) {
    particles.add(new Particle(new PVector(random(0, width), random(0, height))));
    color c = img.get((int)particles.get(i).pos.x, (int) particles.get(i).pos.y);
    particles.get(i).colorc = c;
  }
}
void draw() {
  background(0,0,0);
  PVector power = new PVector(mouseX, mouseY);
  for (int i = 0; i < particles.size(); i++) {
    Particle curr = particles.get(i);
    float dist = dist(power.x, power.y, curr.pos.x, curr.pos.y);
    if (dist < 1000) {
      curr.move(new PVector(power.x - curr.pos.x, power.y - curr.pos.y ).mult(10000/dist).normalize());
    }
    if(!(curr.pos.x > width || curr.pos.x < 0 || curr.pos.y > height || curr.pos.y < 0)) 
    curr.draw();
  }
  if (pressed) {
    particles.add(new Particle(new PVector(random(0, width), random(0, height))));
  }
}



class Particle {

  PVector pos;
  PVector force = new PVector(0, 0);
  color colorc;
  public Particle(PVector pos) {
    this.pos = pos;
  }
  void draw() {
    fill(colorc);
    ellipse(pos.x, pos.y, 6, 6);
  }
  void move(PVector force) {
   float dir = 1;
    if (pressed) {
      this.force = force;
      dir = 1;
    } else { 
      this.force = force;
      dir = -0.5;
    }
    pos.x -= this.force.x*dir;
    pos.y -= this.force.y*dir;
    // drag
    if (this.force.x > 0) {
      this.force.x -= 0.05;
    } else if (this.force.x < 0) { 
      this.force.x += 0.05;
    }
    if (this.force.y > 0) {
      this.force.y -= 0.05;
    } else if (this.force.y < 0) { 
      this.force.y += 0.05;
    }
  }
}
void mousePressed() {
  pressed = true;
}
void mouseReleased() {
  pressed = false;
}
