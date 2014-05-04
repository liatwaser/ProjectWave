
class Background
{
  int x;
  int y;

  float w;
  float h;

  color cMix1;
  color cMix2;

  int opacity;

  color currentColor;

  Background(int x_, int y_, float w_, float h_, color cMix1_, color cMix2_) 
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    cMix1 = cMix1_;
    cMix2 = cMix2_;
    opacity = 255;

    currentColor = color(255, 255, 255);
  }

  void setOpacity(int newOpacity)
  {
    opacity = newOpacity;
  }

  color getCurrentColor()
  {
    return currentColor;
  }

  void display()
  {
    for (int i = y; i <= y+h; i++) {   // setGradient function 
      float inter = map(i, y, y+h, 0, 1);
      currentColor = lerpColor(cMix1, cMix2, inter);
      stroke(currentColor, opacity);
      line(x, i, x+w, i);
    }
  }
};

