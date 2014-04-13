// Example of text wave pattern 

float a = 0.0;
float inc = TWO_PI/25.0;
float prev_x = 0, prev_y = 50, x, y;

void setup() {
  size(1000, 500);
  frameRate(15);
}

void draw() {
  background(255);

  for (int i=0; i<1000; i=i+10) {

    x = i+10;
    y = 280 + sin(a) * 90.0;
    fill(#371BF5);
    textAlign(CENTER);
    text("Hey, I'm a tweet, and I'm longer than you, well maybe not", prev_x, prev_y, x, y);
    fill(#1CE5FA);
    textAlign(CENTER);
    text("Hey, I'm a tweet, and I'm short", prev_x, prev_y+150, x, y);

    prev_x = x;
    prev_y = y;

    a = a + inc;
  }
  //if (a > 18000.00){
  //x= 0;
  //}
  println(a);
}

