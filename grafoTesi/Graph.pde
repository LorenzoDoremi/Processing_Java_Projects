class Graph {
  ArrayList<Nodo> nodi = new ArrayList();
  ArrayList<Arco> archi = new ArrayList();
  int active = 0;
  Graph() {
  }
  void draw(float offsetx, float offsety) {
    
    
    for (int  i = 0; i < nodi.size(); i++) {
      
      // tocco di un nodo 
      if (dist(mouseX, mouseY, nodi.get(i).posX, nodi.get(i).posY) < nodi.get(i).size + 10 && active==0) {
        nodi.get(i).active = true;
       
        
      } else {
        nodi.get(i).active = false;
        
      }
    }
    // disegna tutti in nodi 
    for (int  i = 0; i < nodi.size(); i++) {

      nodi.get(i).draw(offsetx, offsety);
    }
  }
  void  pushNodo(Nodo nuovoNodo) {
    nodi.add(nuovoNodo);
  }
  void  generaArchi(Graph Grafo) {
    for (int  i = 0; i < nodi.size(); i++) {
      for (int  j = 0; j < Grafo.nodi.size(); j++) {
        if (nodi.get(i).artista == Grafo.nodi.get(j).artista) {
          // il nodo A possiede l'arco 
          Grafo.nodi.get(j).archi.add(new Arco(Grafo.nodi.get(j), nodi.get(i) ));
        }
      }
    }
  }
  void generaRel() {
    for (int  i = 0; i < nodi.size(); i++) {
      for (int j = i; j < nodi.size(); j++) {
        if (nodi.get(i).artista == nodi.get(j).artista) {
          nodi.get(i).archi.add(new Arco(nodi.get(i), nodi.get(j)));
        }
      }
    }
  }
}
