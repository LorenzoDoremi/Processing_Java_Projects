

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;  
AudioPlayer jingle;
FFT fftLin;
FFT fftLog;

float height3;
float height23;
float spectrumScale = 4;

PFont font;

void setup()
{
  size(900, 600);

  int BPM = 140;
  int battute = 2;
  frameRate(BPM/60*battute);
  minim = new Minim(this);
  jingle = minim.loadFile("jingle.mp3", 1024);
  // loop the file
  jingle.loop();
  noStroke();
  background(0);
  // create an FFT object that has a time-domain buffer the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fftLin = new FFT( jingle.bufferSize(), jingle.sampleRate() );





}
int padding = 40; // solo per tenere gli spazi vari
float index = 0; // default
int x = padding;
int y = padding;
int size = 20; // dimensione oggetti
float max = 0; // massima ampiezza misurata
void draw()
{



  textSize( 18 );
  fftLin.forward( jingle.mix );
  // draw the full spectrum

  noFill();
  max = 0;
  for (int i = 0; i < fftLin.specSize(); i++) {  

    // calcolo la potenza del segnale in tale posizione
    float power = fftLin.getBand(i);

    // se è il valore massimo lo salvo
    if (power > max) {

      max = power;
      println(max);
      // la banda fftLIn è di 512. 
      // ogni valore comprende quindi più o meno 20000/512 hertz.
      // index = frequenza con maggiore ampiezza
      index = 20000/512 * i + (20000/512)/2;
    }
  }

  pushStyle();
  fill(255, 255, 255);
  // se la frequenza del segnale massimo è inferiore a 100 quadrato
  if (index < 100) {
    rect(x, y, 20 +10*(max/500), 20+10*(max/500));
  } else {
   // altrimenti sfera
    fill(232, 232, 232);
    ellipse(x+10, y+10,  20 +10*(max/500),  20 +10*(max/500));
  }


  popStyle();



  x = x+padding;
  if ( x > width - padding) {
    x = padding;
    y= y+padding;
  }
  if (y > height- padding) {
    background(0);
    y = padding;
    x = padding;
  }
}
