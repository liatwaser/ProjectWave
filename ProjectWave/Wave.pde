class Wave
{
  float a = 0.0;
  float prev_x = 0, prev_y = 50, x, y;

  float waveHeight = 100;

  float movingUp = -2.0;
  float movingDown = 2.5;
  float movingDown2 = 2.5;

  float movingUp2 = -3.75;

  boolean startEnv = false;

  boolean mirrorEnv = false;

  float yOffset;

  float env;
  float envRange;

  int currentPosition = 0;
  int destination = int(random(width));

  float waveMagnitude;

  float waveInc;

  boolean timerSet = false;


  int initialTime = 0;


  int maxDesTime = 25000; //25 sec, for the waveDescend function  


  String waveText = "Hey, I'm a tweet.";
  color waveColour = color(0, 0, 255);

  Wave(float yOffset_, float waveMagnitude_, float waveInc_)
  {
    yOffset = yOffset_;
    waveMagnitude = waveMagnitude_;
    waveInc = waveInc_;

    envRange = 1000;
  }



  void setWaveText(String newWaveText)
  {
    waveText = newWaveText;
  }

  void setWaveColour(color c)
  {
    waveColour = c;
  }

  // ------------------------------------------------------------------//

  void waveAppear1() // wave1 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height- waveHeight)
    {
      movingUp = 0;
    }
  }

  void waveAppear2() // wave2 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height- waveHeight*2)
    {
      movingUp = 0;
    }
  }

  void waveAppear3() // wave3 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height- waveHeight*2.5)
    {
      movingUp = 0;
    }
  }

  void waveAppear4() // wave4 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height- waveHeight*3)
    {
      movingUp = 0;
    }
  }

  void waveAppear5() // wave5 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height- waveHeight*3.5)
    {
      movingUp = 0;
    }
  }

  void waveAppear6() 
  {
    yOffset += movingUp;
    if (yOffset == height-waveHeight*4)
    {
      movingUp = 0;
    }
  }

  void waveAppear7()  
  {
    yOffset += movingUp;
    if (yOffset == height-waveHeight*4.5)
    {
      movingUp = 0;
    }
  }

  void waveAppear8() // wave8 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height-waveHeight*5)
    {
      movingUp = 0;
    }
  }

  void waveAppear9() // wave9 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height-waveHeight*5.5)
    {
      movingUp = 0;
    }
  }

  void waveAppear10() // wave10 moves up 
  {
    yOffset += movingUp;
    if (yOffset == height-waveHeight*6)
    {
      movingUp = 0;
    }
  }

  // -----------------------------------------------------------------//

  void waveDescend() // waves move down 
  {
    yOffset += movingDown;
    if (!timerSet)
    {
      initialTime = millis();
      timerSet = true;
    } 
    else
    {
      if 
        ((millis() - initialTime) > maxDesTime)
      {
        movingDown = 0;
        startEnv = true;
        yOffset += movingUp2; // going up second time
      }
    }
  }

  void backToNormal() 
  {
    movingUp2 = 0;       //waves going up stop
    envRange = 1000;

    yOffset += movingDown2;

    startEnv = false;
  } 

  void resetAll() // function that resets all the variables 
  {
    movingUp = -2.0;
    movingDown = 2.5;
    movingDown2 = 2.5;

    movingUp2 = -4.0;
    timerSet = false;

    yOffset = height + 100;
  }

  void display()
  {
    float wavePos = getCurrentPosition();

    if (startEnv == true)
    {
      for (float i = 0.03; i<1.03; i= i+ 0.001)
      {
        a = a +  i;
      }
      //a += 1.02;
    } 
    else {
      a += 0.04; // higher value will speed up the wave
    }
    float z = a;
    for (int i=0; i<displayWidth; i=i+10) {
      env = abs(i-wavePos) / envRange;
      //println("env is:", env);
      x = i+10;

      // wave has regular motion as long as startEnv is false
      if (startEnv == true)
      {
        y = yOffset + sin(z) * waveMagnitude * env;
        // println("ENV RANGE IS : " + envRange);
        if (envRange > 51)
        {
          envRange = envRange - 0.1;
        }
      }
      else {
        y = yOffset + sin(z) * waveMagnitude; //* env;
      }

      fill(waveColour);
      textAlign(CENTER);
      text(waveText, prev_x, prev_y);

      prev_x = x;
      prev_y = y;

      z = z + waveInc;
    }
  }


  float getCurrentPosition()
  {
    //println("CURRENTPOS: " + currentPosition + "  DEST: " + destination);

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

