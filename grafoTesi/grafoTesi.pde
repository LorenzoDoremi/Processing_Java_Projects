Graph grafoProgetti = new Graph();
Graph grafoAutori = new Graph(); 
float offsetX = 0;
float offsetY = 0;
PImage distortion;
public int num = 0;
boolean pressed = false;
String[] autori = {
  // "Michele", 
  "davide", 
  "lorenzo", 
  "gianluca", 
  //  "Alessio", 
  //  "Francesco", 
  //  "Giuseppe", 
  // "Elena", 
  // "Mario", 
  //  "Lorenzo Marchese", 
  // "Sara Ciutto", 
  "giorgia", 
};
int time = 0;
float  roseSize = 350;
float  rotation = 360;
float  nodi = 150;
void  setup() {
  size(800, 600, P2D);
  textAlign(CENTER);
  imageMode(CENTER);
  noStroke();
  distortion = loadImage("perlin.jpg");
  distortion.resize(800, 600);
  // noLoop();
  /** generatore casuale progetti */
  for (float  i = 0; i < nodi; i++) {
    float  randomX = random(0, 1) * width*3/2;
    float  randomY = random(0, 1) * height*3/2;
    Nodo  temp = new Nodo(
      width / 2 + roseSize * cos(radians((i * rotation) / nodi)), 
      height / 2 + roseSize * sin(radians((i * rotation) / nodi)), 
      5 + random(0, 1) * 20, 
      autori[floor(random(0, 1) * autori.length)], 
      false
      );

    temp = new Nodo(randomX, randomY, 20, autori[floor(random(0, 1) * autori.length)], false );

    grafoProgetti.pushNodo(temp);
  }
  /** generatore autori */
  for (int  j = 0; j < autori.length; j++) {

    Nodo temp = new Nodo(
      width / 2 +
      roseSize*2 * cos(radians((j * rotation) / (autori.length))), 
      height / 2 +
      roseSize*2 * sin(radians((j * rotation) / (autori.length))), 
      80, 
      autori[j%autori.length], 
      true
      );

    grafoAutori.pushNodo(temp);
  }
  /** generatori archi */
  grafoProgetti.generaArchi(grafoAutori);
}

boolean start = true;
void draw() {
 if (pressed) { 
    PVector direction = new PVector(mouseX - width/2, mouseY - height/2 ).normalize().mult(8);
    offsetX -= direction.x;
    offsetY -= direction.y;
  }
  if (offsetX > 0) {
    offsetX --;
  }
  if (offsetY > 0) {
    offsetY --;
  }
  time++;

  background(43, 50, 63);
  grafoAutori.draw(offsetX, offsetY);
  grafoProgetti.draw(offsetX, offsetY);
  runDistort();
  fill(0, 0, 0);
  text(frameRate, 200, 200);
}

/** float erazione con il sito e click */
void mouseClicked() {
  // clicco su un progetto
  for (int i = 0; i < grafoProgetti.nodi.size(); i++) {
    if (grafoProgetti.nodi.get(i).active) {
    }
  }

  // clicco su un autore
  for (int  i = 0; i < grafoAutori.nodi.size(); i++) {
    if (grafoAutori.nodi.get(i).active) {
    }
  }
}
void mousePressed() {
  pressed = true;
}
void mouseReleased() {
  pressed = false;
}





// azione di distorsione
public void runDistort() {

  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int pow = (int)brightness(distortion.get(i, j))/4;
      set(i, j, get((i+pow + time)%width, (j+pow + time)%height));
    }
  }
}
