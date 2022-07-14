class Tree {


  Nodo root;

  public Tree() {
  }

  void insertNode(int k) {
    if (this.root != null) {

      rec_insert(root, k, 1);
    } else {
      this.root = new Nodo(k, width/2, 20);
    }
  }

  void rec_insert(Nodo curr, int k, int level) {
    int l = level;
   
    if (curr.k > k) {
      if (curr.left == null) {
        curr.left = new Nodo(k, curr.x - 200/l, curr.y + 60);
      } else rec_insert(curr.left, k, l+1);
    } else {
      if (curr.right == null) {
        curr.right = new Nodo(k, curr.x + 200/l, curr.y + 60);
      } else rec_insert(curr.right, k, l+1);
    }
  }

  void draw() {
    root.draw();
  }
}
