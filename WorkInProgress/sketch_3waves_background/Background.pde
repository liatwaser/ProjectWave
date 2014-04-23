
class Background
{
  /*
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
   */

  int x;
  int y;

  float w;
  float h;

  color cMix1;
  color cMix2;

  Background(int x_, int y_, float w_, float h_, color cMix1_, color cMix2_) 
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    cMix1 = cMix1_;
    cMix2 = cMix2_;
  }

  void display()
  {
    for (int i = y; i <= y+h; i++) {   // setGradient function 
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(cMix1, cMix2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
};

