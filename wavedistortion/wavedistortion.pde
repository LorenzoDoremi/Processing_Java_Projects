PImage img;
PImage grunge;
int time = 0;
void setup() {
  size(400, 800, FX2D);
  img = loadImage("Hotpot.png");
  grunge = loadImage("gr.png");
  img.resize(width,height);
  
}


void draw() {
  soundwave();
  time=time+10;
}



void wave() {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int bright = (int)brightness(
      grunge.get(
      (i+time)%grunge.width,
      (j+time)%grunge.height)
      )/10;
      color c = img.get(
      (i+bright)%img.width,
      (j+bright)%img.height);
      set(i,j,c);
    }
  }
}
void soundwave() {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      float distance = dist(i,j,width/2,height/2);
      float strength = 1*(600)/(abs(distance-time%600)+1) ;
      map(strength,0,100,0,30);
      strength = strength*100/(10+time%600);
      color c = img.get(
      (i+(int)strength)%img.width,
      (j+(int)strength)%img.height);
      set(i,j,c);
    }
  }
}
