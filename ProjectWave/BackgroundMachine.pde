

class BackgroundMachine extends Thread {

  int bgDisplay1;
  int bgDisplay2;
  int bgAlpha1;
  int bgAlpha2;

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


  int[] timePoints;



  ArrayList <Background> background;

  int lastTime = 0; // lastTime will help restart m every 15 min


  BackgroundMachine()
  {
    bgDisplay1 = 0;
    bgDisplay2 = 0;
    bgAlpha1 = 255;
    bgAlpha2 = 0;

    background = new ArrayList();

    color bottom = color(#C6E7F7);
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

    b1 = new Background(0, 0, width, height, dayTop1, bottom);
    b2 = new Background(0, 0, width, height, dayTop2, bottom);
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

    timePoints = new int[13];

    timePoints[0] = 0;
    timePoints[1] = 90000;
    timePoints[2] = 180000;
    timePoints[3] = 270000;
    timePoints[4] = 360000;
    timePoints[5] = 405000;
    timePoints[6] = 450000;
    timePoints[7] = 495000;
    timePoints[8] = 540000;
    timePoints[9] = 630000;
    timePoints[10] = 720000;
    timePoints[11] = 810000;
    timePoints[12] = 900000;

    start();
  }

  void start()
  {
    super.start();
  }


  void run()
  {
    while (true)
    {
      updateBackground();

      delay(100);
    }
  }

  void displayBackground()
  {
    background.get(bgDisplay1).setOpacity(bgAlpha1);
    background.get(bgDisplay1).display();
    background.get(bgDisplay2).setOpacity(bgAlpha2);
    background.get(bgDisplay2).display();
  }

  int getCurrentBackgroundIndex()
  {
    return bgDisplay1;
  }  

  int getNumBackgrounds()
  {
    return background.size();
  }

  void updateBackground()
  {
    int m = millis() - lastTime; // var m counts millis from start of program

    if (m > timePoints[timePoints.length-1])
    {
      println("RESET!");
      lastTime = millis();
    }

    for (int  i =0;i < timePoints.length-1;i++)
    {

      //if ((m > (i*timeInterval)) && (m <= ((i+1)*timeInterval)))
      if ((m > timePoints[i]) && (m <= timePoints[i+1]))
      {
        float timeDiff = m - timePoints[i];

        float alpha = (timeDiff / float(timePoints[i+1]-timePoints[i]))*255.0;

        alpha = 255 - alpha;

        if (i < background.size()-1)
        {
          bgAlpha1 = int(alpha);
          bgAlpha2 = int(255-alpha);
          bgDisplay1 = i;
          bgDisplay2 = i+1;

          //          background.get(i).setOpacity(int(alpha));
          //          background.get(i).display();
          //          background.get(i+1).setOpacity(int(255-alpha));
          //          background.get(i+1).display();
        }
        else if (i == background.size()-1)
        {
          bgAlpha1 = int(alpha);
          bgAlpha2 = int(255-alpha);
          bgDisplay1 = i;
          bgDisplay2 = 0;

          //          background.get(i).setOpacity(int(alpha));
          //          background.get(i).display();
          //          background.get(0).setOpacity(int(255-alpha));
          //          background.get(0).display();
        }
      }
    }
  }
};

