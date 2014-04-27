class Wave
{
  float a = 0.0;
  float prev_x = 0, prev_y = 50, x, y;

  float movingUp = -1.0;
  float movingDown = 2.5;

  boolean startEnv = false;

  float yOffset;

  float env;
  float envRange;

  int currentPosition = 0;
  int destination = int(random(width));

  float waveMagnitude;

  float waveInc;


  String waveText = "Hey, I'm a tweet, and I'm longer than you, well maybe not";
  color waveColour = color(0, 0, 255);

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

  void waveAppear1() // wave1 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height- 140)
    {
      movingUp = 0;
    }
  }

  void waveAppear2() // wave2 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height- 330)
    {
      movingUp = 0;
    }
  }

  void waveAppear3() // wave3 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height-460)
    {
      movingUp = 0;
    }
  }

  void waveAppear4() // wave4 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height-540)
    {
      movingUp = 0;
    }
  }

  void waveDescend() // wave moves down 
  {
    yOffset += movingDown ;
    if (yOffset == height-50)
    {
      movingDown = 0;
      startEnv = true;
    }
  }

  void waveEnvRight() {
    envRange = 1000;
    for (float i = 1000; i > 250; i= i-0.5)
    {
      envRange= i -0.5;
    }
    println(envRange);
  }

  void run() { // run all the functions 
    display();
  }



  void display()
  {
    float wavePos = getCurrentPosition();
    envRange = 1000;

    for (int i=0; i<displayWidth; i=i+10) {
      //env = abs(i-wavePos) / float(1000);
      env = abs(i-wavePos) / envRange;
      println("env is:", env);
      x = i+10;

      // wave has regular motion as long as startEnv is false
      if (startEnv == true)
      {
        waveEnvRight();
        y = yOffset + sin(a) * waveMagnitude * env;
      } 
      else {
        y = yOffset + sin(a) * waveMagnitude; //* env;   // waves with same effect (waterfall)
      }


      fill(waveColour);
      textAlign(CENTER);
      text(waveText, prev_x, prev_y);

      prev_x = x;
      prev_y = y;

      a = a + waveInc/2;
      //a = a + waveInc;

      if (a > 25000)
      {
        a = 3000;
      }
      println("a is:", a );
    }
  }

  float getCurrentPosition()
  {
    println("CURRENTPOS: " + currentPosition + "  DEST: " + destination);

    if (currentPosition == destination)
    {
      //destination = int(random(height));
      destination = int(width);
    }
    //else if (currentPosition < destination)
    //{
    //currentPosition++;
    //}
    else if (currentPosition > destination)
    {
      currentPosition--;
    }

    return float(currentPosition);
  }
};

