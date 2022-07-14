public class Grid {

  ArrayList<PositionObject>[][] grid;
  int size, gwidth, gheight;
  int sizey;

  public Grid(int size, int gwidth, int gheight) {
    this.sizey = size*gheight/gwidth;
    grid = new ArrayList[size][sizey];
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < sizey; y++) {
        grid[x][y] = new ArrayList<PositionObject>();
      }
    }
    this.size = size;
    this.gwidth = gwidth;
    this.gheight = gheight;
  }

  PVector getCell( PVector a) {
    return new PVector(
      (int)floor(a.x/(gwidth/size)), 
      (int)floor(a.y/(gheight/sizey)));
  }



  ArrayList<PositionObject> getObjectList(PVector a) {
    PVector pos = getCell(a);
    if (pos.x >= size || pos.x < 0 || pos.y >= sizey || pos.y < 0) {
      return null;
    } else return grid[(int)a.x][(int)a.y];
  }


  void update(PositionObject object) {
    // cancello oggetto già esistente
    int x = (int)object.lastPosition.x/(gwidth/size);
    int y = (int)object.lastPosition.y/(gheight/sizey);
    ArrayList<PositionObject> curr = grid[x][y];
    for (int i = 0; i < curr.size(); i++) {
      if (curr.get(i) == object) {
        curr.remove(i);
      }
    }
    // -------- riposiziono l'oggetto
    x = (int)object.position.x/(gwidth/size);
    y = (int)object.position.y/(gheight/sizey);
    try { 
      curr = grid[x][y];
      curr.add(object);
    }
    catch(Exception e) {
    }
  }

  void draw() {
    for (int i = 0; i < this.size; i++) {
      for (int j = 0; j < this.sizey; j++) {
        for (int z = 0; z < grid[i][j].size(); z++) {
          grid[i][j].get(z).draw();
        }
        // text(grid[i][j].size(), i*width/size, j*height/sizey);
      }
    }
  }
}
