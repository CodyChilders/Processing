float r = random(255);
float g = random(255);
float b = random(255);

float dr = random(-5, 5);
float dg = random(-5, 5);
float db = random(-5, 5);

float x1, x2, y1, y2;
float dx1, dx2, dy1, dy2;

void setup(){
  size(500, 500);
  //frameRate(10);
  noFill();
  background(0);
  x1 = 5;
  y1 = 5;
  x2 = width - 5;
  y2 = height - 5;
  dx1 = random(-3, 3);
  dx2 = random(-3, 3);
  dy1 = random(-3, 3);
  dy2 = random(-3, 3);
}

void draw(){
  //update positions
  x1 += dx1;
  x2 += dx2;
  y1 += dy1;
  y2 += dy2;
  //update directions
  if(x1 > width || x1 < 0){
    dx1 = -dx1;
  }
  if(x2 > width || x2 < 0){
    dx2 = -dx2;
  }
  if(y1 > height || y1 < 0){
    dy1 = -dy1;
  }
  if(y2 > height || y2 < 0){
    dy2 = -dy2;
  }
  //update colors
  r += dr;
  g += dg;
  b += db;
  if(r > 255 || r < 0){
    dr = -dr;
  }
  if(g > 255 || g < 0){
    dg = -dg;
  }
  if(b > 255 || b < 0){
    db = -db;
  }
  stroke(r, g, b);
  line(x1, y1, x2, y2);
}
