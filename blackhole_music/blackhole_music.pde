/**
 * This sketch demonstrates how to monitor the currently active audio input 
 * of the computer using an AudioInput. What you will actually 
 * be monitoring depends on the current settings of the machine the sketch is running on. 
 * Typically, you will be monitoring the built-in microphone, but if running on a desktop
 * it's feasible that the user may have the actual audio output of the computer 
 * as the active audio input, or something else entirely.
 * <p>
 * Press 'm' to toggle monitoring on and off.
 * <p>
 * When you run your sketch as an applet you will need to sign it in order to get an input.
 * <p>
 * For more information about Minim and additional features, 
 * visit http://code.compartmental.net/minim/ 
 */

import ddf.minim.*;

Minim minim;
AudioInput in;
ArrayList<float[]> hits = new ArrayList();
void setup()
{
  size(1200, 700);
  background(0);
  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  in.enableMonitoring();
  strokeWeight(3);
  noFill();
}
float max = 0;
int index = 0;
void draw()
{
   fill(0,0,0,10);
   rect(0,0,width,height);
  

  // draw the waveforms so we can see what we are monitoring
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {

    if (in.left.get(i) > max) {
      max = in.left.get(i);
      index = i;
    }
  
  }
  if (max > 0.07) {
    fill(255);
    float[] value = {(int)random(0, width), (int)random(0, height), 100, (max*10000)/index, index/10};
    hits.add(value);
    println(max + " --  " + index*20000/1024);
  }
  
  max = 0;

 for (int j = 0; j < hits.size(); j++) {
      stroke(255, 255, 255, hits.get(j)[2]);
      fill(0,0,0);
      ellipse(hits.get(j)[0], hits.get(j)[1], hits.get(j)[3], hits.get(j)[3] );
       hits.get(j)[2] -= 2;
    }
   
}

void keyPressed()
{
  if ( key == 'm' || key == 'M' )
  {
    if ( in.isMonitoring() )
    {
      in.disableMonitoring();
    } else
    {
      in.enableMonitoring();
    }
  }
}
