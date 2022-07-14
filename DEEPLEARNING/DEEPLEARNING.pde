PVector position = new PVector(2, 2);


float up = random(0, 1);
float down = random(0, 1);
float left = random(0, 1);
float right = random(0, 1);
float[] dirs = {up, down, left, right};
PImage map;
float fitness = 0;
float lastfitness = 0;

float lastdist = 1000;
int time = 0;
void setup() {


  size(256, 256);
  frameRate(200);
  map = loadImage("map.png");
  map.resize(256, 256);
}

void draw() {
  time++;
  image(map, 0, 0);
  fill(255, 0, 0);


  float d = -1000;
  int index = 0;
  int r = (int)random(0, dirs.length);
  for (int i = 0; i < dirs.length; i++) {
    if (i==r) {
     
    }
    if (dirs[i] > d) {

      d = dirs[i];
      index = i;
    }
  }


  //float[] dirs = {up, down, left, right};
  // up
  if (index == 0) { 
    position.y --;
  }
  // down
  else if (index == 1) { 
    position.y++;
  }
  // left
  else if (index == 2) { 
    position.x--;
  }
  // right
  else if (index == 3) { 
    position.x++;
  }



  // calcolo la distanza se migliora
  if (lastdist > dist(position.x, position.y, width-4, height -4) ) {

    fitness += 0.01;
  } else fitness -= 0.01;

  lastdist = position.dist(new PVector(width-4, height-4));


  // calcolo il miglioramento
  if (fitness > lastfitness) {

    dirs[index] += 0.1;
  } else { 
    dirs[index] -= 0.1;
  }

  lastfitness = fitness;
  // up
  if (brightness(get((int)position.x, (int)position.y-1)) < 128) {
    dirs[0] -= 100;
  }
  // down
  if (brightness(get((int)position.x, (int)position.y+1)) < 128) {
    dirs[1] -= 100;
  }
  // left
  if (brightness(get((int)position.x-1, (int)position.y)) < 128) {
    dirs[2] -= 100;
  }
  // right
  if (brightness(get((int)position.x+1, (int)position.y)) < 128) {
    dirs[3] -= 100;
  }


  if (position.x <= 1 || position.y <= 1 || position.x > width || position.y > height) {
    position = new PVector(2, 2);
    dirs[index] -= 0.6;
  }

  println("up: "+dirs[0]+" - down: "+dirs[1]+" - left: "+dirs[2]+" - right: "+dirs[3]);
  rect(position.x, position.y, 4, 4);
}
