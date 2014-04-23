// Example of text wave pattern 

Wave w1;
Wave w2;

ArrayList<Wave> waves;


void setup() {
  size(1200, 800);
  frameRate(15);

  waves = new ArrayList();

  w1 = new Wave(height-100,90, TWO_PI/20.0);
  w2 = new Wave(100,30, TWO_PI/25.0);

  waves.add(w1);
  waves.add(w2);

  w1.setWaveText("Adam has changed this");
  w1.setWaveColour(color(255, 0, 255));

  w2.setWaveText("Liat has changed this");
  w2.setWaveColour(color(0, 0, 255));

  thread("getNewTweets");
  
  thread("setWaveAndBackgroundColours");
}

void draw() {
  background(255);

  float waveMagnitude = 90.0;

  // -----------------------------
  // THIS IS SINE WAVE MODULATION OF WAVE
  // create a parameter moving between 0 and 1
  //  float z = (sin(b) + 1)/2.0;
  //  float wavePos = z*width;
  //  
  //  b = b+inc2;
  // --------------------------


  for (int i = 0;i < waves.size();i++)
  {
    waves.get(i).display();
  }

  //w1.display();
  //w2.display();
  
}

//=========================================
void getNewTweets()
{
  while (true)
  {
    // FIRST GET NEW TWEETS
    
    
    // then set new tweets to each wave
    for (int i = 1; i < waves.size(); i++)
    {
      waves.get(i).setWaveText("This is wave " + i);
    }

    delay(30000);
  }
}

//=========================================
void setWaveAndBackgroundColours()
{
   while(true)
  {
     // update wave and background colours
     for (int i = 0;i < waves.size();i++)
    {
      waves.get(i).setWaveColour(color(random(255),random(255),random(255)));
    }
    
      delay(30000);
  } 
}
