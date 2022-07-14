class Arco {

  Nodo A, B;
  float alpha;
  Arco( Nodo nodoA, Nodo nodoB) {
    A = nodoA;
    B = nodoB;
    alpha = random(0, 1)*128;
  }

  void draw() {
    noFill();
    pushStyle();
    if ( A.active || B.active) { 
      stroke(165, 88, 88);
    } else stroke(53, 70, 103) ;

    //  bezier(A.posX ,A.posY, window.innerWidth/2, window.innerHeight/2, window.innerWidth/2, window.innerHeight/2, B.posX,B.posY);
 //   if(  true ) {  line(A.posX ,A.posY, B.posX,B.posY);} else  {};
  bezier(A.posX, A.posY, 
      (A.posX+B.posX)/2, (A.posY+B.posY)/2, 
      (A.posX*4+B.posX)/5, (A.posY+B.posY*4)/5, 
      B.posX, B.posY); 
       popStyle();
      
  }
 
}
