color black = #000000;
color red = #FF051A;
color yellow = #F6FF05;
color orange = #FFB905;
color green = #05FF5A;
color blue = #1295FC;
color grey = #939393;
color white = #FCF7F7;
color purple = #B705FF;

color bg = white;
boolean wasPressed;
boolean mouseReleased;
Button[] myButton;

void setup() {
  size(800, 800);
  myButton = new Button[3];

  // ✅ Correct Indexing (Starts from 0)
  myButton[0] = new Button("Red", 200, 200, 400, 300, blue, green);
  myButton[1] = new Button("Yellow", 600, 500, 200, 300, red, orange);
  myButton[2] = new Button("Grey", 300, 500, 300, 200, white, blue);
}

void draw() {
  background(bg);

  for (int i = 0; i < myButton.length; i++) {  // ✅ Fixed Loop
    myButton[i].show();
  }
}

class Button {
  int x, y, w, h;
  boolean clicked;
  color highlight, normal;
  String text;

  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }

  void show() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);


    if (isHovered()) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);


    fill(black);
    textSize(w / 6);
    text(text, x, y);


    if (mouseReleased && isHovered()) {
      bg = normal;
    }
  }

  boolean isHovered() {
    return (mouseX > x - w / 2 && mouseX < x + w / 2 &&
      mouseY > y - h / 2 && mouseY < y + h / 2);
  }
}

void mousePressed() {
  wasPressed = true;
}

void mouseReleased() {
  if (wasPressed) {
    wasPressed = false;
    for (int i = 0; i < myButton.length; i++) {
      if (myButton[i].isHovered()) {
        bg = myButton[i].normal;
        break;
      }
    }
  }
}
