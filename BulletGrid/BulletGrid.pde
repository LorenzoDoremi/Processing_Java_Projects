Grid mygrid;
ArrayList<Monster> monsters = new ArrayList<Monster>();
ArrayList<Bullet> bullets;
boolean clicked = false;
void setup() {
  size(800, 600);
  mygrid = new Grid(40, width, height);
  for (int i = 0; i < 100; i++) {
    Monster monster = new Monster(new PVector(random(0, width), random(0, height)), mygrid);
    monsters.add(monster);
  }
  for (int i = 0; i < monsters.size(); i++) {
    mygrid.update(monsters.get(i));
  }
  bullets = new ArrayList<Bullet>();

  noStroke();
}
void draw() {
  background(0);
  mygrid.draw();


  for (int i = 0; i < bullets.size(); i++) {
    check(bullets.get(i));
    if (bullets.get(i).position.x > width || bullets.get(i).position.y < 0) { 
      bullets.remove(i);
    }

    try {
      bullets.get(i).draw();
    }
    catch(Exception e) {
    }
  }

  text(frameRate+"", 20, 20);
  if (clicked) {
    bullets.add(new Bullet(
      new PVector(0, height-1), 
      new PVector(random(0, 4), random(-4, 0)))) ;
  }
}

void mousePressed() {
  clicked = true;
}
void mouseReleased() {
  clicked = false;
}

void check(Bullet a) {

  PVector cell = mygrid.getCell(a.position);
  ArrayList<PositionObject> items = mygrid.getObjectList(cell);
  if(items != null) {
  for (int i = 0; i < items.size(); i++) {
    if (dist(a.position.x, a.position.y, items.get(i).position.x, items.get(i).position.y) < 20) {
      items.remove(i);
    }
  }
  }
}
