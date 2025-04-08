color black =#000000;
color red =#FF051A;
color yellow =#F6FF05;
color orange =#FFB905;
color green =#05FF5A;
color blue =#1295FC;
color grey =#939393;
color white =#FCF7F7;
color purple =#B705FF;
color bg;
boolean mouseReleased;
boolean wasPressed;
Button[] myButton;

void setup() {
  size(800, 800);
  myButton = new Button [4];
  myButton[1] = new Button("red", 200, 200, 400, 300, blue, green);
  myButton[2] = new Button("yellow", 300, 500, 200, 300, red, orange);
  myButton[3] = new Button("grey", 400, 500, 300, 200, white, blue);
}
void draw() {
  click();
  background(bg);
  int i = 0;
  while (i<4) {
    myButton[i].show();
    if (myButton[i].clicked) {
      bg = myButton[i].normal;
    }
    i++;
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
      if (mouseX > x-w/2 &&mouseX < x+w/2 && mouseY > y-h/2 && mouseY <y+h/2) {
        fill(highlight);
      } else {
        fill(normal);
      }
      stroke(0);
      strokeWeight(4);
      rect(x, y, w, h, 30);

      textAlign(CENTER, CENTER);
      if (mouseX > x-w/2 &&mouseX < x+w/2 && mouseY > y-h/2 && mouseY <y+h/2) {
        fill(highlight);
      } else {
        fill(normal);
      }
      textSize(w/4);
      text(text, x, y);

      if (mouseReleased && mouseX > x-w/2 &&mouseX < x+w/2 && mouseY > y-h/2 && mouseY <y+h/2) {
        clicked = true;
      } else {
        clicked = false;
      }
    }
  }
