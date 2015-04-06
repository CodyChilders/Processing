float x, y, x2, y2, dx, dy, dx2, dy2;

void setup(){
  size(500, 500);
  background(255);
  x = 50;
  y = 50;
  x2= width-50;
  y2= width-50;
  dx = random(-4, 4);
  dy = random(-4, 4);
  dx2= random(-4, 4);
  dy2= random(-4, 4);
}

void draw(){
  stroke(random(255), random(255), random(255));
  line(x, y, x2, y2);
  x += dx;
  y += dy;
  x2+= dx2;
  y2+= dy2;
  if(x < 0 || x > width){
    dx *= -1;
  }
  if(y < 0 || y > height){
    dy *= -1;
  }
  if(x2 < 0 || x2 > width){
    dx2 *= -1;
  }
  if(y2 < 0 || y2 > height){
    dy2 *= -1;
  }
}
