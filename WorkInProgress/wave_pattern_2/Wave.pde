
class Wave
{
  float a = 0.0;
  float prev_x = 0, prev_y = 50, x, y;
  
  float yOffset;

  int currentPosition = 0;
  int destination = int(random(width));

  float waveMagnitude;
  
  float waveInc;
  
  String waveText = "Hey, I'm a tweet, and I'm longer than you, well maybe not";
  color waveColour = color(0,0,255);

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
    float wavePos = getCurrentPosition();


    for (int i=0; i<1000; i=i+10) {
      float env = abs(i-wavePos) / float(250);
      x = i+10;
      y = yOffset + sin(a) * waveMagnitude * env;
      fill(waveColour);
      textAlign(CENTER);
      text(waveText, prev_x, prev_y, x, y);
      
      prev_x = x;
      prev_y = y;

      a = a + waveInc;
    }
  }

  float getCurrentPosition()
  {
    //println("CURRENTPOS: " + currentPosition + "  DEST: " + destination);

    if (currentPosition == destination)
    {
      destination = int(random(width));
    }
    else if (currentPosition < destination)
    {
      currentPosition++;
    }
    else if (currentPosition > destination)
    {
      currentPosition--;
    }

    return float(currentPosition);
  }
};

