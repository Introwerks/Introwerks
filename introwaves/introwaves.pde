//Christian Attard
//2015 @ introwerks 

PImage img;
int c, n, count;

String name = "maria"; // file name 
String type = "jpg"; // file type

int wSize = 10; // wave size
int exp = 10; // number of frames to export 

void settings() {
  img = loadImage(name + "." + type);
  size(img.width,img.height,P3D);
}
void setup() {
  println("christian attard, 2015 @ introwerks");
}

void draw() {
  for (int x=0; x<img.width; x+=wSize) {
    for (int y=0; y<img.height; y+=wSize) {
      wave(x, y);
    }
  }
  count = frameCount;

  saveFrame(name + "_" + exp + "/" + name + "_" + count + "." + type);

  if (frameCount==exp) {
    exit();
  }
}

void wave(int w, int h) {
  for (int i=0; i<wSize; i++) {
    for (int j=0; j<wSize; j++) {
      color c = img.pixels[i+w+j+(h*width)];
      n = int(sin(i*count)*wSize);
      pushMatrix();
      fill(c);
      noStroke();
      rect(i+w, j+h+n, 1, 1);
      popMatrix();
    }
  }
}