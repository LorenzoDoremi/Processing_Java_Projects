public class Bullet extends PositionObject {

  PVector dir;
  public Bullet(PVector pos, PVector dir) {

    this.position = pos;
    this.dir = dir;
  }

  void draw() {
    ellipse(this.position.x, this.position.y, 10, 10);
    this.position.add(dir);
  }
}
