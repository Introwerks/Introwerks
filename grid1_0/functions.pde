void fileSelected(File selection) {
  if (selection!= null)
  {
    path = split(selection.getAbsolutePath(), '.');

    if (path[1].equals("gif")) {
      println(path[1]);
      switch_1 = 0;
      animation = Gif.getPImages(this, path[0] + "." + path[1]); 
      W = animation[0].width;
      H = animation[0].height;
    } else {
      println(path[1]);
      switch_1 = 1;
      img_1  = loadImage(path[0] + "." + path[1]);    
      W = img_1.width;
      H = img_1.height;
      inputImage = img_1;
    }

    cols = W/pixel; 
    rows = H/pixel;
    FILE_LOADED = true;
  }
}

void gifPlayer() {
  for ( int i = 0; i < rows; i++ ) {
    for ( int j = 0; j < cols; j++ ) {
      extrude = knob_1;
      x = j*pixel ;
      y = i*pixel;
      pixel_get = x + y*W;
      c = animation[(int)play].pixels[pixel_get];
      z = (extrude/(float)width) * brightness(c);

      gifDisplay();

      pushMatrix();

      //extrude
      if (extrude_1 == 0) {
        translate(x + pixel/2, y+pixel/2, z -width/2);
      }
      //left
      if (extrude_1== 1) {
        translate(x + pixel/2 +z, y+pixel/2, 0);
      }
      //right
      if (extrude_1 == 2) {
        translate(x + pixel/2 - z, y+pixel/2, 0);
      }
      //top
      if (extrude_1 == 3) {
        translate(x + pixel/2, y+pixel/2 + z, 0);
      }
      //bottom
      if (extrude_1 == 4) {
        translate(x + pixel/2, y+pixel/2 - z, 0);
      }
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, pixel, pixel);
      popMatrix();
    }
  }
}

void imageDisplay() {  
  for ( int i = 0; i < rows; i++ ) {
    for ( int j = 0; j < cols; j++ ) {
      extrude = knob_1;
      x = j*pixel ;
      y = i*pixel ;
      pixel_get = x + y*W;
      c = img_1.pixels[pixel_get];
      z = (extrude/(float)width) * brightness(img_1.pixels[pixel_get]);

      pushMatrix();

      //extrude
      if (extrude_1 == 0) {
        translate(x + pixel/2, y+pixel/2, z -500);
      }
      //left
      if (extrude_1== 1) {
        translate(x + pixel/2 +z, y+pixel/2, 0);
      }
      //right
      if (extrude_1 == 2) {
        translate(x + pixel/2 - z, y+pixel/2, 0);
      }
      //top
      if (extrude_1 == 3) {
        translate(x + pixel/2, y+pixel/2 + z, 0);
      }
      //bottom
      if (extrude_1 == 4) {
        translate(x + pixel/2, y+pixel/2 - z, 0);
      }
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, pixel, pixel);
      popMatrix();
    }
  }
}

void gifDisplay() {

  play+=knob_2 + knob_3;

  if (play >= animation.length) {
    play = 0;
  }
}

