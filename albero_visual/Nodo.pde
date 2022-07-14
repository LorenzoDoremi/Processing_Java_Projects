class Nodo {

  int x, y, k;
  Nodo left = null;
  Nodo right = null;
  public Nodo(int k, int x, int y) {
    this.k = k;
    this.x = x;
    this.y = y;
  }

  void draw() {



    if (this.left != null) {
      line(this.x, this.y, this.left.x, this.left.y);
      this.left.draw();
     
    }
    if (right != null) {
      line(this.x, this.y, this.right.x, this.right.y);
      right.draw();
      
    }
    pushStyle();
    fill(255, 0, 0);
    ellipse(x, y, 40, 40);
    fill(255, 255, 255);
    text(k, x, y);
    popStyle();
  }
}
