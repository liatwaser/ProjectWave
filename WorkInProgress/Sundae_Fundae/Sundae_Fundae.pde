// Project Wave 


Wave w1;
Wave w2;
Wave w3;
Wave w4;


ArrayList<Wave> waves;

// these keys are temporary  

boolean key1 = false;
boolean key2 = false;
boolean key3 = false;
boolean key4 = false;
boolean key5 = false;


void setup() {
  size(displayWidth, 800);
  frameRate(15);

  waves = new ArrayList();

  // object num = of Wave class( y_offset, magnitude, incremation);

  w1 = new Wave(height+130, 150, (TWO_PI/20.0)/1.8);
  w2 = new Wave(height+130, 120, (TWO_PI/20.0)/1.8);
  w3 = new Wave(height+130, 90, (TWO_PI/20.0)/1.8);

  w4 = new Wave(height+130, 90, (TWO_PI/20.0)/1.8);





  // positions 
  //w1 = new Wave(height-80, 150, (TWO_PI/20.0)/1.8);
  //w2 = new Wave(height-210, 120, (TWO_PI/20.0)/1.8);
  //w3 = new Wave(height-330, 80, (TWO_PI/20.0)/1.8);

  waves.add(w1);
  waves.add(w2);
  waves.add(w3);
  waves.add(w4);



  w1.setWaveText("#tweetwave It's a big family outing that day. I was trying to get to where my sister was swimming when a big wave swept me... and my shorts.");
  w1.setWaveColour(color(#0D2570));

  w2.setWaveText("#tweetwave Liat has changed this many times before, wonderful");
  w2.setWaveColour(color(#4B69CB));

  w3.setWaveText("#tweetwave, skfh whynot surely tweet yes nope maybe @him & her now");
  w3.setWaveColour(color(#47AFD1));

  w4.setWaveText("#tweetwave It's another tweet.");
  w4.setWaveColour(color(#0D2570));


  //thread("getNewTweets");
}

void draw() {
  background(255);

  //for (int i = 0;i < waves.size();i++)
  //{
  //waves.get(i).run();
  //}

  //w1.display();
  //w2.display();



  if (key1)
  {
    w1.run();
    w1.waveAppear1();
  }
  if (key2)
  {
    w2.run();
    w2.waveAppear2();
  }
  if (key3)
  {
    w3.run();
    w3.waveAppear3();
  }

  if (key4)
  {
    w4.run();
    w4.waveAppear4();
  }

  if (key5)
  {
    for (int i = 0; i < waves.size(); i++)
    {
      waves.get(i).waveDescend();
    }
  }
}

//delay(50);


//=========================================


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) key1 = true;
    if (keyCode == DOWN) key2 = true;
    if (keyCode == RIGHT) key3 = true;
    if (keyCode == LEFT) key4 = true;
    if (keyCode == SHIFT) key5 = true;
  }
}

void getNewTweets()
{
}

//=========================================
void setWaveAndBackgroundColours()
{
  while (true)
  {
    // update wave and background colours
    for (int i = 0;i < waves.size();i++)
    {
      waves.get(i).setWaveColour(color(random(255), random(255), random(255)));
    }

    delay(30000);
  }
}

