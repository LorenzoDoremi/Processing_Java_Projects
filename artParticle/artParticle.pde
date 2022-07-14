import processing.video.*;
ArrayList<Particle> particles = new ArrayList();
public boolean pressed = false;
PImage img;
PImage mirror;
Movie movie;
void setup() {

  size(1280, 720, FX2D);
  noStroke();
  img = loadImage("paint.png");
  img.resize(1600,900);
  movie = new Movie(this, "video.mp4");

  movie.loop();
  for (int i = 0; i < 100000; i++) {
    particles.add(new Particle(new PVector(random(0, width), random(0, height))));
  //  particles.get(i).colorc = c;
  }
}
void draw() {
  background(0,0,0);
  PVector power = new PVector(mouseX, mouseY);
  for (int i = 0; i < particles.size(); i++) {
    Particle curr = particles.get(i);
    curr.colorc = movie.get((int)curr.pos.x,(int)curr.pos.y);
    float dist = dist(power.x, power.y, curr.pos.x, curr.pos.y);
   
    if (dist < 1000) {
      curr.move(new PVector(power.x - curr.pos.x, power.y - curr.pos.y ).mult(10000/dist).normalize());
    }
    if(!(curr.pos.x > width || curr.pos.x < 0 || curr.pos.y > height || curr.pos.y < 0)) 
    
    if(red(curr.colorc) > 5){
     curr.draw();}
    
    
  }
  if (pressed) {
    particles.add(new Particle(new PVector(random(0, width), random(0, height))));
  }
}

void movieEvent(Movie movie) {
  movie.read();
  mirror = movie;

}

class Particle {

  PVector pos;
  PVector force = new PVector(0, 0);
  color colorc;
  float seed = random(1,4);
  public Particle(PVector pos) {
    this.pos = pos;
  }
  void draw() {
    fill(colorc);
    ellipse(pos.x, pos.y, 2, 2);
  }
  void move(PVector force) {
   float dir = 1;
   if (!pressed) {
      this.force = force.mult(2);
      dir = 1;
    } else { 
    //   this.force = force;
    //  dir = -0.5; 
    }
    pos.x -= this.force.x*dir;
    pos.y -= this.force.y*dir;
    pos.y += seed;
    if(pos.y >= height) {
     pos.y = 0;
     pos.x = random(0,width);
   }
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
