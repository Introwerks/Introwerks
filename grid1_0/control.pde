ControlFrame addControlFrame(String theName, int theWidth, int theHeight) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(100, 100);
  f.setResizable(false);
  f.setVisible(true);
  return p;
}

public class ControlFrame extends PApplet {

  int w, h;
  Knob myKnobA;
  Textlabel myTextlabelA;
  Textarea myTextarea;

  void setup() {


    size(w, h);
    frameRate(25);
    cp5 = new ControlP5(this);
    myKnobA = cp5.addKnob("Amount")
      .plugTo(parent, "knob_1")
        .setRange(0, 3000)
          .setValue(0)
            .setPosition(width/2-19, 20)
              .setRadius(20)
                .setNumberOfTickMarks(2)
                  .setTickMarkLength(2)
                    .snapToTickMarks(false)
                      .setColorForeground(color(255))
                        .setColorBackground(color(95, 162, 219))
                          .setColorActive(color(255, 255, 255))
                            .setDragDirection(Knob.HORIZONTAL)
                              ;

    myKnobA = cp5.addKnob("gif speed")
      .plugTo(parent, "knob_2")
        .setRange(0, 0.00002 )
          .setValue(0.000005)
            .setPosition(width/2-60, 160)
              .setRadius(60)
                .setNumberOfTickMarks(2)
                  .setTickMarkLength(2)
                    .snapToTickMarks(false)
                      .setColorForeground(color(255))
                        .setColorBackground(color(95, 162, 219))
                          .setColorActive(color(255, 255, 255))
                            .setDragDirection(Knob.HORIZONTAL)
                              ;

    myKnobA = cp5.addKnob("ultra speed")
      .plugTo(parent, "knob_3")
        .setRange(0, 0.005)
          .setValue(0)
            .setPosition(width/1.5-15, 240)
              .setRadius(13)
                .setNumberOfTickMarks(2)
                  .setTickMarkLength(2)
                    .snapToTickMarks(false)
                      .setColorForeground(color(255))
                        .setColorBackground(color(95, 162, 219))
                          .setColorActive(color(255, 255, 255))
                            .setDragDirection(Knob.HORIZONTAL)
                              ;

    cp5.addButton("extrude")
      .setValue(0)
        .setPosition(width/2-131, 90)
          .setSize(50, 19)
            .setColorBackground(color(100))
              ;
    cp5.addButton("left")
      .setValue(1)
        .setPosition(width/2-78, 90)
          .setSize(50, 19)
            .setColorBackground(color(100))

              ;
    cp5.addButton("right")
      .setValue(2)
        .setPosition(width/2-25, 90)
          .setSize(50, 19)
            .setColorBackground(color(100))

              ;
    cp5.addButton("top")

      .setValue(3)
        .setPosition(width/2+28, 90)
          .setSize(50, 19)
            .setColorBackground(color(100))
              ;
    cp5.addButton("bottom")
      .setValue(4)
        .setPosition(width/2+81, 90)
          .setSize(50, 19)
            .setColorBackground(color(100))
              ;
    cp5.addButton("off")
      .setValue(1)
        .setPosition(186, 140)
          .setSize(30, 19)
            .setColorBackground(color(100))
              ;
    cp5.addButton("on")
      .setValue(0)
        .setPosition(153, 140)
          .setSize(30, 19)
            .setColorBackground(color(100))
              ;


    cp5.addSlider("BG greyscale")
      .plugTo(parent, "slider_1")

        .setPosition(172, 170)
          .setSize(20, 100)
            .setRange(0, 255)
              .setNumberOfTickMarks(5)
                .setColorForeground(color(255))
                  .setColorBackground(color(95, 162, 219))
                    .setColorActive(color(255, 255, 255))

                      ;
    myTextlabelA = cp5.addTextlabel("BACKGROUND")
      .setText("BACKGROUND")
        .setPosition(151, 125)
          .setColor(255)
            ;

    myTextlabelA = cp5.addTextlabel("GIF PLAYER")
      .setText("GIF PLAYER")
        .setPosition(width/2-29, 140)
          .setColor(255)
            ;


    myTextarea = cp5.addTextarea("txt")
      .setPosition(75, height-90)
        .setSize(width-40, 20)
          .setFont(createFont("arial", 10))
            .setLineHeight(14)
              .setColor(color(128))
                .hideScrollbar();
    ;
    myTextarea.setText("To export JPG - press 's' on image. To export GIF - Click on GIF to start recording, Click again to export."
      );
  }

  public void draw() {
    background(25);
    image(logo1, 130, 40);
    image(logo2, 400, 40);
  }


  public void extrude(int theValue) {
    extrude_1 = theValue;
  }

  public void left(int theValue) {
    extrude_1 = theValue;
  }

  public void right(int theValue) {
    extrude_1 = theValue;
  }

  public void top(int theValue) {
    extrude_1 = theValue;
  }

  public void bottom(int theValue) {
    extrude_1 = theValue;
  }

  public void on(int theValue) {
    bg = theValue;
  }

  public void off(int theValue) {

    bg = theValue;
  }


  private ControlFrame() {
  }

  public ControlFrame(Object theParent, int theWidth, int theHeight) {
    parent = theParent;
    w = theWidth;
    h = theHeight;
  }


  public ControlP5 control() {
    return cp5;
  }


  ControlP5 cp5;

  Object parent;
}

