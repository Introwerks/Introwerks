//Christian Attard
//2015 @ introwerks 

PImage img;
String name = "statue"; //file name 
String type = "jpg"; //file type
int count = int(random(666));


int size =20; //block size


void settings() {
  img = loadImage(name + "." + type);
  size(img.width,img.height,P3D);
}

void setup() {
  println("christian attard, 2015 @ introwerks");

  img.loadPixels();
  for (int i = 0; i < img.width; i+=size) {
    for (int j = 0; j < img.height; j+=size) {

      copy(img, int(random(i)), int(random(j)), size, size, i, j, size, size);
    }
  }
  img.updatePixels();
  
  save(name + "_" + count + "." + type);
  println("done");
  exit();
}