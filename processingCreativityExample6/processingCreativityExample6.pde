float theta = 0;
float rotationalVelocity = 0.03;
float otherTheta = 0;

float x, y, dx, dy;

float r = random(255), g = random(255), b = random(255);
float dr = random(-5, 5), dg = random(-5, 5), db = random(-5, 5);

void setup(){
  size(500, 500);
  x = width/2;
  y = height/2;
  dx = random(-5, 5);
  dy = random(-5, 5);
  background(0);
}

void draw(){
  translate(width/2, height/2);
  rotate(otherTheta);
  translate(-width/2, -height/2);
  translate(x, y);
  rotate(theta);
  stroke(r, g, b);
  line(0, 0, 50, 0);
  x += dx;
  y += dy;
  if(x < 0 || x > width){
    dx = -dx;
  }
  if(y < 0 || y > height){
    dy = -dy;
  }
  theta += rotationalVelocity;
  if(r < 0 || r > 255){
    dr = -dr;
  }
  if(g < 0 || g > 255){
    dg = -dg;
  }
  if(b < 0 || b > 255){
    db = -db;
  }
  r += dr;
  g += dg;
  b += db;
  otherTheta += 0.01;
}
  
