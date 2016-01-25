//Christian Attard
//2015 @ introwerks 


PImage img;
float c;
int m = 5; //what fucks things up  

String name = "frenchfries"; //file name 
String type = "jpg"; //file type
int count = int(random(666));


void settings() {
  img = loadImage(name + "." + type);
  size(img.width, img.height);
}

void setup() {
  println("christian attard, 2015 @ introwerks");
  image(img, 0, 0);

  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    c = color(pixels[i]);
    pixels[i] = int(c * m);
  }
  updatePixels();
  save(name + "_crushed_" + count + "." + type);
  println("done");
  exit();
}
