//Christian Attard
//2015 @ introwerks 


PImage img;
int c;
String name = "maria"; //file name 
String type = "jpg"; //file type
int count = int(random(666));
color col;


final static int RED = 0;
final static int GREEN = 1;
final static int BLUE = 2;
final static int HUE = 3;
final static int SATURATION = 4;
final static int BRIGHTNESS = 5;
final static int NRED = 6;
final static int NGREEN = 7;
final static int NBLUE = 8;
final static int NHUE = 9;
final static int NSATURATION = 10;
final static int NBRIGHTNESS = 11;

// channels for depth: RED, GREEN, BLUE, HUE, SATURATION, BRIGHTNESS, NRED, NGREEN, NBLUE, NHUE, NSATURATION, NBRIGHTNESS. 
int channel = BRIGHTNESS;
// channel weight.
float channel_weight = 0.1;

float getChannel(color c) {
  int ch = channel>5?channel-6:channel;
  float cc;

  switch(ch) {
  case RED: 
    cc = red(c); 
    break;
  case GREEN: 
    cc = green(c); 
    break;
  case BLUE: 
    cc = blue(c); 
    break;
  case HUE: 
    cc = hue(c); 
    break;
  case SATURATION: 
    cc = saturation(c); 
    break;
  default: 
    cc= brightness(c); 
    break;
  }

  return channel_weight * (channel>5?255-cc:cc);
}

void settings() {
  img = loadImage(name + "." + type);
  size(img.width,img.height,P3D);
}

void setup() {
  println("christian attard, 2015 @ introwerks");
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      c = i+(j*width);
      col = img.pixels[c];
      fill(col);
      noStroke();
      rect(i, j+getChannel(col), 1, getChannel(col));
    }
  }

  save(name + "_" + count + "." + type);
  println("done");
  exit();
}