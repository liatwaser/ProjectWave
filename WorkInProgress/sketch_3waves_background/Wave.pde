
class Wave
{
  float a = 0.0; // angle 
  float prev_x = 0, prev_y = 50, x, y;

  float yOffset; // where the wave starts on screen (height)

  float waveMagnitude; // how high the wave is 

  float waveInc; // by how much it grows 

  String waveText;  
  color waveColour = color(0, 0, 255);

  // every wave has the following:
  Wave(float yOffset_, float waveMagnitude_, float waveInc_)
  {
    yOffset = yOffset_;
    waveMagnitude = waveMagnitude_;
    waveInc = waveInc_;
  }

  void setWaveText(String newWaveText)
  {
    waveText = newWaveText;
  }

  void setWaveColour(color c)
  {
    waveColour = c;
  }

  void display()
  {


    for (int i=0; i<width; i=i+10) {
      x = i; //i+10;
      y = yOffset + sin(a) * waveMagnitude; 
      fill(waveColour);
      textAlign(CENTER);
      text(waveText, prev_x, prev_y);

      prev_x = x;
      prev_y = y;

      a = a + waveInc/2;

      if (a > 20000) {
        a = 2000;
      }

      println("i is:", i);
      println("a is:", a);
    }
  }
};

