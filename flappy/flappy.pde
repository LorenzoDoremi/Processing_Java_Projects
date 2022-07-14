int strength = 0;
int gravity = 5;
int x = 50, y; //posizione bird
int wallx; // posizione tubi
int topheight = (int)random(0, 200); // altezza muro sopra
int bottomheight = (int)random(0, 200); // altezza muro sotto
int speed = 4; // velocità gioco
boolean gameover = true;
int time = 0; // tempo e punteggio
float backgroundtime1 = 0;
float backgroundtime2;
PImage sfondo;

void setup() {

  size(800, 600, FX2D);
  wallx = width;
  textAlign(CENTER);
  textSize(40);
  sfondo = loadImage("back.jpg");
  backgroundtime2 = width;
}
void draw() {

  background(255, 255, 255);
  image(sfondo, backgroundtime1, 0, width, height);
  image(sfondo, backgroundtime2, 0, width, height);
  backgroundtime1-= 0.5;
  backgroundtime2-= 0.5;
  if (backgroundtime1 == -width) {
    backgroundtime1 = width;
  }
  if (backgroundtime2 == -width) {
    backgroundtime2 = width;
  }






  if (!gameover) {
    if (time%1000 == 0) {
      speed++;
    }
    fill(255, 255, 255);
    // tubo sopra
    rect(wallx, 0, 40, topheight );
    // tubo sotto
    rect(wallx, height-bottomheight, 40, bottomheight);

    // personaggino
    fill(100, 180, 180);
    ellipse(x, y, 50, 50);


    // modifiche temporali
    y += -strength + gravity;
    if (strength > 0) strength --;
    wallx -= speed;

    // rigenerazione tubo
    if (wallx <= -40) {
      int npos = (int)random(width, width+100);
      wallx = npos;
      topheight = (int)random(100, 250);
      bottomheight = (int)random(100, 250);
    }
    // collisioni
    if ((x>=wallx && x < wallx+40) && (y < topheight || y > height-bottomheight) || y < 0 || y > height) {
      gameover = true;
    }
    time++;
  }


  if (gameover) {
    fill(0);
    text("CLICK TO START ( a to fly)", width/2, height/2);
  }
  textSize(20);
  text("punteggio ="+time, width - 100, height - 30);
}
void keyPressed() {
  if (key == 'a' || key=='A') {
    if (!gameover) {
      strength = 15;
    }
  }
}
void mouseClicked() {
  if (gameover) {
    gameover = false;
    wallx = width;
    y = 20;
    time = 0;
    speed = 4;
  }
}
