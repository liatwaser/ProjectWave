/*
Project Wave, April 2014
 written by Liat Wassershtrom 
 for Charmaine Cabancla
 */


/// Shiffman's sine wave tweak
int xspacing = 50;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 65.0;  // Height of wave
float period = 400.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
///

//declare an array as palceholder for future tweets 
String [] futureTweets = new String [10];

// decalre font 
PFont font; 

// declare colour for background gradient 
color a1, a2, b1, d1;


void setup() {
  //size of screen
  size( 1200, 800);

  // Define background gradient colors
  a1 = color(#ABF3F5);
  a2 = color(255);
  b1 = color(#DEB441);
  d1 = color(#02044B);

  // example for initializing manually (for now) tweets data with #tweetWave 
  futureTweets[0] = "SXSW: Vimeo Pledges $10 Million for Content Distribution http://bit.ly/1hfO871  #SXSW ";
  futureTweets[1] = "Edward Snowden discusses NSA leaks at SXSW: 'I would do it again' http://bit.ly/1kJi6iG  #SXSW ";
  futureTweets[2] = "Austin Public Safety Commission talks SXSW, downtown crime http://bit.ly/1qjdL79  #SXSW";
  futureTweets[3] = "SXSW Exclusive: Watch a Scene From Screwball Murder Mystery 'Wild Canaries' http://bit.ly/OoE5R6  #SXSW ";
  futureTweets[4] = "SXSW Exclusive: Horror Flick 'Home' is the House Hunt From Hell http://bit.ly/1igvhEV  #SXSW ";
  futureTweets[5] = "Vais-je en revenir un madné... #TweetWave ";
  futureTweets[6] = "The Growing Pains of SXSW: An Interview with Brian Solis by @murraynewlands http://bit.ly/Ppa5FR  #SXSW ";
  futureTweets[7] = "SXSW crash: fourth person dies of injuries http://bit.ly/1q1lgl7  #SXSW ";
  futureTweets[8] = "Twitter Adds Emoji Support On The Web - Ubergizmo http://bit.ly/PoYlmw  ";
  futureTweets[9] = "Tweetwave coming to a timeline near you.. ";

  //Setting text style
  font = loadFont("DialogInput-48.vlw");
  textLeading(15);
  textAlign(LEFT);

  ///Shiffman's sine wave
  w = width+5;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  ///
}


void draw() {
  //background(192, 242, 247);

  // calling background gradient function
  setGradient(0, 0, width, height, a1, a2);

  ///Shiffman's sine wave 
  calcWave();
  renderWave();
  ///
}

///Shiffman's sine wave 
void calcWave() {
  // Increment theta (try different values for 'angular velocity' here)
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  for (int x = 0; x < yvalues.length; x++) {
    fill(0, 0, 255);
    text(futureTweets[0], x*2*xspacing, height/1.5+yvalues[x], 140, 140);
    fill(10, 0, 100);
    text(futureTweets[1], x*2*xspacing, height/1.3+yvalues[x], 140, 140);
    fill(0, 20, 250);
    text(futureTweets[2], x*2*xspacing, height/1.1+yvalues[x], 140, 140);
  }
  ///
}

void setGradient(int x, int y, float w, float h, color c1, color c2) {
  for (int i = y; i <= y+h; i++) {
    float inter = map(i, y, y+h, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, i, x+w, i);
  }
}

