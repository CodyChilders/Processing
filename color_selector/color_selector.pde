int i = 255;
int x = 0;
int y = 0;
int color1 = 255;
int redcontrol = 0;
int opacity = 255;

boolean reset = false;

void setup(){
  size(256, 256);
  smooth();
  background(0);
  frameRate(60);
}

void draw(){
  while (i < 256 && y <= 256){
    stroke(255 - redcontrol, color1, color1, opacity);
    point(x, y);
    color1 = color1 - 1;
    x = x + 1;
    i = i + 1;
  }

  if (i == 256){
    y = y + 1;
    x = 0;
    i = 0;
    color1 = 255;
    opacity = opacity - 1;
    redcontrol = redcontrol -1;
  }
}


