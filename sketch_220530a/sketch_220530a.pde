
void setup() {
  size(800,600);
  Robot x = new Robot();
  Human a = new Human();
  Human[] humans = {a,x};
  for(int i = 0; i < humans.length; i++) {
  print(humans[i].getAge());}
}

void draw() {
}
