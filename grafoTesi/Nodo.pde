class Nodo {
  float x; // poszione di partenza
  float y ; // poszione di partenza
  float initsize; // dimensione standard
  float maxSize = 70;
  boolean main ; // tipo di nodo
  float size; // dimensione float iabile
  String artista;
  float posX; // posizione float iabile
  float posY ; // posizione float iabile
  boolean active ; // stato del nodo
  boolean conn;
  float time ; // tempo del nodo
  float seed;
  ArrayList<Arco> archi = new ArrayList();
  PImage immagine;
  Nodo( float x, float y, float size, String artista, boolean main) {
    this.x = x; // poszione di partenza
    this.y = y; // poszione di partenza
    this.initsize = size; // dimensione standard
    this.main = main; // tipo di nodo
    this.size = initsize; // dimensione float iabile
    this.artista = artista;
    this.posX = x; // posizione float iabile
    this.posY = y; // posizione float iabile
    this.active = false; // stato del nodo
    this.conn = false;
    this.time = 0; // tempo del nodo
    this.seed = random(0,1);
   
   

    if(main) {
      immagine = loadImage(dataPath("autori")+"\\"+artista+".jpg");
      this.maxSize = 220;
      immagine.filter(GRAY);
    }
    
    
  
  }
  void draw(float offsetx, float offsety) {
      // calcolo la posizione float iabile
      
    if (!main) {
      
      if(!active) {
      // calcolo il vettore direzionale
      PVector  dir = new PVector(x - width / 2, y - height / 2);
      dir.normalize();

      // calcolo la posizione float iabile
      posX = x + (offsetx * 10) / 20;
      posY = y + (offsety * 10) / 20 + dir.y;

      // calcolo l'andamento ondulatorio
      x -= dir.x * sin(time + seed);
      y -= dir.y * sin(time + seed);
      time += 0.02;
      }
    } else {
  // calcolo la posizione float iabile
      posX = x + (offsetx * 10) / 20;
      posY = y + (offsety * 10) / 20;
      // se è nodo main e active connetto tutti i nodi 
      for (int  i = 0; i < archi.size(); i++) {
        if (active) {
          archi.get(i).B.conn = true;
        } else {
            archi.get(i).B.conn = false;
        }
      }
      // lo posiziono staticamente 
     // calcolo la posizione float iabile
 
    }

    // disegno tutti gli archi del nodo
    for (int  a = 0; a < archi.size(); a++) {
      archi.get(a).draw();
    }
  
    push();
    noStroke();
    if (active || conn) {
      /*attivo */      fill(195, 205, 134);
    } else {
      /*non attivo*/      fill(218, 248, 248);
    }

   
    // gestisco dimensioni
     if ((active || conn) && size < this.maxSize) {
     
     size += 2;
     
     } else {
     if (size > initsize) {
     size -= 2;
     }
     }
   
    
  if(main) {  image(immagine,posX,posY,1+size,1+size);
  }
  else ellipse(posX, posY, 1 + size, 1 + size);
    pop();
  /*
    fill(0, 0, 0);
     text(
     active+"",
     posX,
     posY
     );
    */
  }
}
