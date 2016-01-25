//Christian Attard
//2015 @ introwerks 

PImage img;
String name = "maria"; //file name 
String type = "jpg"; //file type
int count = int(random(666));
color col;
int c;

int space =5; // space between lines
float weight = 1; // line weight
float depth = 0.9; // z depth
int zoom = 100; // zoom image

void settings() {
  img = loadImage(name + "." + type);
  size(img.width,img.height,P3D);
}
void setup() {
  background(0);
  println("christian attard, 2015 @ introwerks");

  for (int i = 0; i < img.width; i+=space) {
    beginShape();
    for (int j = 0; j < img.height; j+=space) {
      c = i+(j*img.width);
      col = img.pixels[c];
      stroke(red(col), green(col), blue(col), 255);
      strokeWeight(weight);
      noFill();
      vertex (i, j, (depth * brightness(col))-zoom);
    }
    endShape();
  }

  save(name + "_" + count + "." + type);
  println("done");
  exit();
}
