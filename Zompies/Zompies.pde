ArrayList<Zombie> zombies = new ArrayList<Zombie>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Crate> crates = new ArrayList<Crate>();
Player player = new Player(10, height/2);


PImage crate, zombie;
void setup() {
  
  crate = loadImage("box.jpg");
  zombie = loadImage("zombie.png");
  imageMode(CENTER);
  crate.resize(50,50);
  size(800, 600, P2D);
  noStroke();
  for (int i = 0; i < 30; i++) {
    zombies.add(new Zombie((int)random(width, width+100), (int)random(0, height), level));
  }
}
boolean up, down, left, right;
boolean shoot = false;
int time = 0;
int points = 0;
int life = 100;

float level = 0;
void draw() {

  if (time % 1000 == 0) {
    level+= 0.2;
  }
  background(0);
  if(player.ratioBonus <= 0) 
  player.ratioBonus = 1;
  if (shoot && time%player.ratioBonus == 0) {
    projectiles.add(
      new Projectile(
      new PVector(mouseX, mouseY), 
      player.x, 
      player.y, 
      4 + player.firespeedBonus, 
      40+ player.damageBonus ));
  }
  // creo nuovo zombie
  if (time%(int)(30-level*3)==0) {
    zombies.add(new Zombie((int)random(width, width+100), (int)random(0, height), level));
  }
  for (int i = projectiles.size() -1; i >=0; i--) {
    projectiles.get(i).move();
    projectiles.get(i).draw();
  }
  for (int i = zombies.size()-1; i >= 0; i--) {
    Zombie currZ =  zombies.get(i);
    currZ.move();
    currZ.draw();
    for (int j = projectiles.size()-1; j >=0; j--) {
      Projectile curr = projectiles.get(j);

      if (dist(curr.x, curr.y, currZ.x, currZ.y) < 30) {
        try {
          currZ.life -= curr.damage;

          projectiles.remove(j);
        } 
        catch(Exception e) {
        }
      }
      if (curr.x < 0 || curr.x > width || curr.y < 0 || curr.y > height) {
        projectiles.remove(j);
      }
    }
    if (currZ.x <= 0 || dist(currZ.x, currZ.y, player.x, player.y) < currZ.initlife/2 + 20) {
      life--;
    }
    if (currZ.x < 0 || currZ.y < 0 || currZ.y > height || currZ.life <= 0) {
      
        spawnCrate(currZ.x, currZ.y);
     
      if (life > 0) points += currZ.initlife;
      zombies.remove(i);
    }
  }
  for (int i = crates.size()-1; i >= 0; i--) {

    Crate currC = crates.get(i);
    currC.draw();
    if (dist(player.x, player.y, currC.x, currC.y) < 50) {
      if (currC.bonus == 0) {
        player.ratioBonus --;
      }
      if (currC.bonus == 1) {
        player.damageBonus += 5;
      }
      if (currC.bonus == 2) {
        player.firespeedBonus += 2;
      }
      crates.remove(i);
    }
  }
  player.draw();
  player.move(up, down, left, right);

  time++;
  fill(255, 255, 255);
  textSize(24);
  text("POINTS = "+points, 40, 40);
  text("LIFE = "+life, 40, height-40);
  text("LEVEL = "+level, width-320, height-40);
  text("TIME = "+time, width-320, height-80);
}







void spawnCrate(float x, float y) {
  
  if((int)random(0,30) == 0)
  crates.add(new Crate(x, y));
}


void mousePressed() {

  shoot = true;
}
void mouseReleased() {
  shoot = false;
}
void keyPressed() {
  print(key);
  if (key == 'w') {
    up = true;
  }
  if (key == 'd') {
    right = true;
  }
  if (key == 's') {
    down = true;
  }
  if (key == 'a') {
    left = true;
  }
}
void keyReleased() {

  if (key == 'w') {
    up = false;
  }
  if (key == 'd') {
    right = false;
  }
  if (key == 's') {
    down = false;
  }
  if (key == 'a') {
    left = false;
  }
}









class Projectile {
  float x, y;
  float damage;
  PVector direction;
  public Projectile(PVector direction, float x, float y, float speed, float damage) {
    this.x = x;
    this.y = y;
    this.direction = new PVector(direction.x - x, direction.y - y);
    this.direction.normalize().mult(speed);

    this.damage = damage;
  }
  void draw() {
    ellipse(x, y, 4, 4);
  }
  void move() {
    this.x += this.direction.x;
    this.y += this.direction.y;
  }
}

class Crate {
  
  float x, y;
  int bonus;
  public Crate(float x, float y) {
    this.x = x;
    this.y = y;
    this.bonus = (int)random(0, 3);
  }
  void draw() {
    fill(255, 0, 0);
    image(crate,this.x, this.y, 50, 50);
  }
}


class Zombie {


  float x, y;
  float life;
  float initlife;
  public Zombie(float x, float y, float level ) {
    this.x = x;
    this.y = y;
    this.life = (int)random(10+5*level, 100+(20*level*level));
    this.initlife = this.life;
  }

  void draw() {
    fill(220, 120, 50);
    
    image(zombie,this.x, this.y, initlife, initlife);
   

  }
  void move() {
    this.x -= 0.5*25/initlife + level*0.5;
  }
}
// PLAYER

public class Player {
  int x, y, speed;

  int ratioBonus = 10;
  int damageBonus = 0;
  int firespeedBonus = 0;
  public Player(int x, int y ) {
    this.x = x;
    this.y = y;
    speed = 5;
  }

  void draw() {
    fill(120, 220, 50);
    ellipse(this.x, this.y, 40, 40);
  }
  void move(boolean up, boolean down, boolean left, boolean right) {
    if (up) this.y-=speed;
    if (down) this.y+=speed;
    if (left) this.x-=speed;
    if (right) this.x+=speed;
  }
}
