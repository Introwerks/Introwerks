//Christian Attard
//2015 @ introwerks 

PImage img;
int c;
String name = "maria"; //file name 
String type = "jpg"; //file type
int count = int(random(666));

int v;
int t;

void settings() {
  img = loadImage(name + "." + type);
  size(img.width,img.height,P3D);
}
void setup() {
  println("christian attard, 2015 @ introwerks");

  img.loadPixels();
  for (int i = 0; i < img.width-1; i++) {
    for (int j = 0; j < img.height-1; j++) {
      v = img.pixels[i+(j*img.width)];
      t = img.pixels[i+(j+1)*img.width];

      if (v > t) { 
        color c = v;
        img.pixels[(i+1)+((j+1)*img.width)] = c;
      }
    }
  }

  img.updatePixels();
  image(img, 0, 0); 
  save(name + "_" + count + "." + type);
  println("done");
  exit();
}