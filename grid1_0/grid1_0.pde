//christian attard & etienne richan
// 2014 @ introwerks
// exported files are saved in the sketch folder


import java.awt.Frame;
import java.awt.BorderLayout;
import controlP5.*;
import gifAnimation.*;

private ControlP5 cp5;
GifMaker gifExport;

ControlFrame cf;

//grid
int pixel = 1; // pixel size 
int cols, rows; 
float extrude;
int x;
int y;
int pixel_get;
color c;
float z;

//image/gif 
PImage img_1;
String[] path;
int W, H;
PImage inputImage;
PImage[] animation;
float play = 0;
PImage logo1;
PImage logo2;

//control
int switch_1 = -1;
float knob_1 = 0;
float knob_2 = 0;
float knob_3 = 0;
int extrude_1;
int gif_export;
int slider_1;
int slider_2;
int slider_3;
int bg = 0;

//gif export
boolean FILE_LOADED = false;
boolean EXPORT_ON = false;
boolean FIRST_RUN = true;

void setup() {
  frame.setTitle("Grid1.0 --> 's' to save, mouse click to record/export gif ");
  frame.setResizable(true);
  size(100, 100, OPENGL);
  selectInput("load image or gif:", "fileSelected");
  frameRate(30);
  smooth();
  logo1 = loadImage("introwerks_logo.png");
  logo2 = loadImage("grid_logo.png");
  cf = addControlFrame("control", 600, 400);
  println("christian attard & etienne richan, 2014 @ introwerks");
}

void draw() {
  if (!FILE_LOADED) {
    loop();
  } else
  {
    if (FIRST_RUN)
    {
      size(W, H, P3D);
      frame.setSize(W, H);
      FIRST_RUN = false;
    }
    if (bg == 0) {
      background(slider_1);
    } 
    switch(switch_1) {
    case 0:
      gifPlayer(); 
      break;
    case 1:
      imageDisplay();
      break;
    }
    if (EXPORT_ON)
    {
      gifExport.addFrame();
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("image-######.jpg");
  }
}
void mouseReleased() {
  EXPORT_ON = !EXPORT_ON;
  if (EXPORT_ON) {
    println("Export started");
    gifExport = new GifMaker(this, int(random(1000, 100000))+ "finalgif.gif");
    gifExport.setRepeat(0);
  } else {
    gifExport.finish();
    println("Export ended");
  }
}

