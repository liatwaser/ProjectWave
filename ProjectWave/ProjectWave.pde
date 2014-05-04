/* Project Wave 
written by Liat Wassershtrom with contributions by Adam Stark 
for Charmaine Cabancla's project
May 2014
*/

BackgroundMachine bm;

TweetMachine tweetMachine;

Wave w1;  // 10 Wave objects 
Wave w2;
Wave w3;
Wave w4;
Wave w5;
Wave w6;
Wave w7;
Wave w8;
Wave w9;
Wave w10;

ArrayList<Wave> waves;

float lasTime = 0;

void setup() {
  size(displayWidth, displayHeight);
  frameRate(15);

  bm = new BackgroundMachine(); 

  tweetMachine = new TweetMachine("#tweetwave"); // change this for different search results

  waves = new ArrayList();

  // object num = of Wave class( y_offset, magnitude, incrementation);
  // to get different curves change the incremenation 

  w1 = new Wave(height+100, 65, (TWO_PI/20.0)/1.8); 

  w2 = new Wave(height+100, 75, (TWO_PI/25.0)/1.8);
  w3 = new Wave(height+100, 90, (TWO_PI/20.0)/1.8);

  w4 = new Wave(height+100, 55, (TWO_PI/20.0)/1.8);

  w5 = new Wave(height+100, 75, (PI/25.0)/1.8);

  w6 = new Wave(height+100, 70, (TWO_PI/20.0)/1.8);

  w7 = new Wave(height+100, 85, (PI/25.0)/1.8);
  w8 = new Wave(height+100, 90, (TWO_PI/20.0)/1.8);

  w9 = new Wave(height+100, 90, (PI/25.0)/1.8);

  w10 = new Wave(height+100, 90, (PI/25.0)/1.8);

  waves.add(w1);
  waves.add(w2);
  waves.add(w3);
  waves.add(w4);
  waves.add(w5);
  waves.add(w6);
  waves.add(w7);
  waves.add(w8);
  waves.add(w9);
  waves.add(w10);

  setWaveColours(color(#0D2570), color(#4B69CB), color(#47AFD1));

  w1.setWaveText("#tweetwave It's a big family outing that day. I was trying to get to where my sister was swimming when a big wave swept me... and my shorts.");
  w2.setWaveText("#tweetwave It's a big family outing that day #sun #yes.");
  w3.setWaveText("#tweetwave I was trying to get to where my sister was swimming when a big wave swept me.");
  w4.setWaveText("#tweetwave Liat has changed this many times before, wonderful");
  w5.setWaveText("#tweetwave");
  w6.setWaveText("#tweetwave  tweet tweet tweet tweet tweet tweet tweet tweet tweet tweet tweet tweet tweet tweet tweet tweet tweet tweet tweet  ");
  w7.setWaveText("#tweetwave Liat has changed this.");
  w8.setWaveText("#tweetwave, skfh whynot surely tweet yes nope maybe @him & her now");
  w9.setWaveText("#tweetwave It's another tweet.");
  w10.setWaveText("#tweetwave It's a big family outing that day. I was trying to get to where my sister was swimming when a big wave swept me... and my shorts.");

  thread("updateTweets");
}

void draw() {
  float sec = millis() /1000.0 - lasTime; //timer

  bm.displayBackground();

  float currentBg = bm.getCurrentBackgroundIndex();
  float numBackgrounds = bm.getNumBackgrounds();

  float progress = currentBg / numBackgrounds;

  if (progress < 0.333)
  {
    setWaveColours(color(#0D2570), color(#4B69CB), color(#47AFD1));
  }
  else if ((progress >= 0.333) && (progress < 0.6667))
  {
    setWaveColours(color(#264ab8), color(#599be4), color(#40f3f4));
  }
  else
  {
    setWaveColours(color(#06102f), color(#1b4d85), color(#257da2));
  }

  if (sec > 1.0)
  {

    for (int i = 0; i < 3; i++)
    {
      waves.get(i).display();
    }
    w1.waveAppear1();
    w2.waveAppear2();
    w3.waveAppear3();

    for (int i = 3; i < 7; i++)
    {
      waves.get(i).display();
    }
    w4.waveAppear4();
    w5.waveAppear5();
    w6.waveAppear6();
    w7.waveAppear7();

    for (int i = 7; i < 10; i++)
    {
      waves.get(i).display();
    }
    w8.waveAppear8();
    w9.waveAppear9();
    w10.waveAppear10();
  }

//set to start after 15min, change this if you want it to happen sooner/later
    if (sec >900.0) {  
    for (int i = 0; i < waves.size(); i++)
    {
      waves.get(i).waveDescend();
    }
  }
  
 // gap of 40 secs between the two functions - backToNormal stops the former function
// if you change the timing on the previous if statement make sure to change this too
// leaving 40 seconds between the two.
    if  (sec >940.0) {   
    for (int i = 0; i < waves.size(); i++)
    {
      waves.get(i).backToNormal();
    }
  }
  
  // restart sec timer after 980 secs. This will restart the waves 
 if (sec > 980.0) 
  {
    for (int i = 0; i < waves.size(); i++)
    {
      waves.get(i).resetAll();
    }

    lasTime = millis()/1000;
  }   
  //println("sec is:", sec);
  //println("lasTime is:", lasTime);
} 


//---------------------------------------

void setWaveColours(color c1, color c2, color c3)
{
  w1.setWaveColour(c1); // b color
  w2.setWaveColour(c1); // b color
  w3.setWaveColour(c1); // b color
  w4.setWaveColour(c2); // m color 
  w5.setWaveColour(c2); // m color 
  w6.setWaveColour(c2); // m color 
  w7.setWaveColour(c2); // m color 
  w8.setWaveColour(c3); // t color 
  w9.setWaveColour (c3); // t color 
  w10.setWaveColour (c3); // t color
}

//=========================================


void updateTweets()
{
  while (true)
  {

    if (tweetMachine.tweetsAvailable)
    {
      ArrayList latestTweets = tweetMachine.tweets;

      for (int i = 1;i < waves.size();i++)
      {
        int tweetNum = i % latestTweets.size();
        Status t = (Status) latestTweets.get(tweetNum);
        String msg = t.getText();

        waves.get(i).setWaveText(msg);
      }
    }

    delay(30000);
  }
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

