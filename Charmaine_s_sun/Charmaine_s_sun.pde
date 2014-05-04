PFont font;
int down = 0;
float x, y; 
float angle = 0.0;

float deg = 360;

float a = cos(TWO_PI) * 285;
float b = sin(TWO_PI) * 220;

double inc = 0.0041666*240; 

void setup() {
  background(192, 242, 247);
  size(1080, 600);
  smooth();
  font = loadFont("DialogInput.bold-48.vlw");
  textFont(font);
}

void draw() {
  sun();
}

void sun() {

  translate(a+200, b+200);

  rotate(angle);
  fill(#FFDC12);
  textSize(16);
  text("Charmaine's Sun", y, 10, 10);

  fill(#F8FC7D);
  text("Experience", width/600, height/100);
  angle += 0.01;

  rotate(angle);
  fill(#E8BD2C);
  textSize(12);
  text("Translated", x, y/2, 20, 10);
  angle -= 1;

  x = cos(radians(deg)) * 285;
  y = sin(radians(deg)) * 220;

  deg+=inc/0.5; // divided to be slower 

  if (deg>=360) // limit size
  {   
    deg=270;
  }
}

