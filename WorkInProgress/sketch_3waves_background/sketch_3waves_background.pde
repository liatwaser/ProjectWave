Background b1; 
Background b2;   // declaring 13 background objects
Background b3; 
Background b4; 
Background b5; 
Background b6; 
Background b7; 
Background b8; 
Background b9; 
Background b10;
Background b11;
Background b12; 
Background b13; 

Wave w1;
Wave w2;
Wave w3;


ArrayList <Background> background;
ArrayList <Wave> waves;

int lastTime = 0; // lastTime will help restart m every 15 min

void setup() {
  size (displayWidth, 800);
  frameRate(15);


  background = new ArrayList(); // arraylist for background colours

  color bottom = color(#C6E7F7); // adding colours to variables 
  color dayTop1 = color(#FDF9EB);
  color dayTop2 = color(#FBF2CF);
  color dayTop3 = color(#F9E59A);
  color dayTop4 = color(#F9E186);
  color midTop1 = color(#FBDB62);
  color midTop2 = color(#EBC540);
  color midTop3 = color(#BE9E21);
  color midTop4 = color(#CB8F27);
  color eveTop1 = color(#906315);
  color eveTop2 = color(#091D5E);
  color eveTop3 = color(#091744);
  color eveTop4 = color(#030C29); 

  b1 = new Background(0, 0, width, height, dayTop1, bottom);  // mixing background colours for 
  b2 = new Background(0, 0, width, height, dayTop2, bottom);  // every b object 
  b3 = new Background(0, 0, width, height, dayTop3, bottom);
  b4 = new Background(0, 0, width, height, dayTop4, bottom);
  b5 = new Background(0, 0, width, height, midTop1, bottom);
  b6 = new Background(0, 0, width, height, midTop2, bottom);
  b7 = new Background(0, 0, width, height, midTop3, bottom);
  b8 = new Background(0, 0, width, height, midTop4, bottom);
  b9 = new Background(0, 0, width, height, eveTop1, bottom);
  b10 = new Background(0, 0, width, height, eveTop2, bottom);
  b11 = new Background(0, 0, width, height, eveTop3, bottom);
  b12 = new Background(0, 0, width, height, eveTop4, bottom);
  //same as b12 to fix array size problem
  b13 = new Background(0, 0, width, height, eveTop4, bottom); 


  background.add(b1);
  background.add(b2);
  background.add(b3);
  background.add(b4);
  background.add(b5);
  background.add(b6);
  background.add(b7);
  background.add(b8);
  background.add(b9);
  background.add(b10);
  background.add(b11);
  background.add(b12);
  background.add(b13);

  waves = new ArrayList();

  w1 = new Wave (height- 50, 120, (TWO_PI/20.0)/1.8);
  w2 = new Wave (height - 190, 120, (TWO_PI/20.0)/ 1.8);
  w3 = new Wave (height - 340, 120, (TWO_PI/20.0)/ 1.8);

  waves.add(w1);
  waves.add(w2);
  waves.add(w3);

  w1.setWaveText("#tweetwave It's a big family outing that day. I was trying to get to where my sister was swimming when a big wave swept me... and my shorts.");
  w1.setWaveColour(color(#0D2570));

  w2.setWaveText("#tweetwave: It's another tweet from Twitter, this time shorter");
  w2.setWaveColour(color(#4B69CB));

  w3.setWaveText("#tweetwave: It's another tweet, this time it is really really really really really really really long");
  w3.setWaveColour(color(#47AFD1));
}
void draw() {
  // --------------- calling background gradient function ---------------- //

  int m = millis() - lastTime; // var m counts millis from start of program

  if (m < 90000)
  {
    background.get(1).display();
  }
  else if (m >90000 && m < 180000)
  {
    background.get(2).display();
  }
  else if (m > 180000 && m < 270000)
  {
    background.get(3).display();
  }
  else if (m > 270000 && m < 360000)
  {
    background.get(4).display();
  }
  else if (m >360000 && m < 405000)
  {
    background.get(5).display();
  }
  else if (m > 405000 && m < 450000)
  {
    background.get(6).display();
  }
  else if (m > 450000 && m < 495000)
  {
    background.get(7).display();
  }
  else if (m > 495000 && m < 540000)
  {
    background.get(8).display();
  }
  else if (m > 540000 && m < 630000)
  {
    background.get(9).display();
  }
  else if (m > 630000 && m < 720000)
  {
    background.get(10).display();
  }
  else if (m > 720000 && m < 810000)
  {
    background.get(11).display();
  }
  else if (m > 810000 && m < 900000)
  {
    background.get(12).display();
  }
  else if (m > 900000)
  {
    lastTime = millis();
  }
  println(m);
  println("lastTime is:", lastTime);
  // ----------------------------------------------------------------------- //

  // ------------- Calling waves ------------ //

  for (int i = 0; i <waves.size(); i++)
  {
    waves.get(i).display();
  }
  // --------------------------------------- //
}

