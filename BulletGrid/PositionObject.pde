abstract class PositionObject {

  PVector position;
  PVector lastPosition;
  Grid grid;
  public void setPos(PVector pos) {
    if (this.position != null) {
      this.lastPosition = this.position;
    } else this.lastPosition = pos;
    this.position = pos;
  }
  public PVector getPos() {
    return this.position;
  }
  void draw() {
  };
}

public class Monster extends PositionObject {
  int life, speed, damage;
  public Monster(PVector pos, Grid grid) {
    this.setPos(pos);
    life = 20;
    speed = 3;
    damage = 10;
    this.grid = grid;
  }

  void draw() {
   
    ellipse(this.position.x, this.position.y, 20, 20);
    this.setPos(new PVector(position.x+1, position.y+1));
    this.grid.update(this);
  }
}
