

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
  // fullScreen(FX2D);
  size(1200, 800);

  int BPM = 140;
  int battute = 2;
  // frameRate(BPM/60*battute);
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

  fill(0, 0, 0, 20);
  rect(0, 0, width, height);

  textSize( 18 );
  fftLin.forward( jingle.mix );
  // draw the full spectrum

  noStroke();
  max = 0;
 
  for (int i = 0; i < fftLin.specSize(); i++) {  

    // calcolo la potenza del segnale in tale posizione
    float power = pow(fftLin.getBand(i), 2);
    
     fill(0,255,0);
     ellipse((i*width/10)%width+40, i/10*40, 20, 20 );
    for (int j = i; j < fftLin.specSize(); j++) {
      float power2 = pow(fftLin.getBand(j), 2);
      if (abs(power-power2) < 0.001 && i != j) {
       fill(255,0,0);
       ellipse((i*width/10)%width+40, i/10*40, 20, 20 );
       ellipse((j*width/10)%width+40, j/10*40, 20, 20 ); 
      }
    }
  }
}
