int lastTime = 0; 

void setup() {
  size(500, 500);
}

void draw() {

  int m = millis() - lastTime;

  if (m < 900)
  {
    background(255, 0, 0);
  }
  else if (m >900 && m < 1800)
  {
    background(0, 255, 0);
  }
  else if (m > 1801 && m < 2700)
  {
    background(0, 0, 255);
  }
  else if (m > 2701 && m < 3600)
  {
    background(100, 0, 255);
  }
  else if (m > 3601)
  {
    lastTime = millis();
  }

  println(m);
  println("lastTime is:", lastTime);
}

