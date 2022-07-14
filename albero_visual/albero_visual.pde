Tree tree = new Tree();
void setup() {

  size(1200, 800);
  for (int i = 0; i < 30; i++) {
    tree.insertNode((int)random(0, 100));
  }

  textAlign(CENTER);
}


void draw() {

  tree.draw();
}
