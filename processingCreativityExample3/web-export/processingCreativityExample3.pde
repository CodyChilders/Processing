float x, y, dx, dy;

void setup(){
  size(500, 500);
  background(255);
  x = width/2;
  y = height/2;
  dx = random(-4, 4);
  dy = random(-4, 4);
}

void draw(){
  stroke(random(255), random(255), random(255));
  line(x, y, mouseX, mouseY);
  x += dx;
  y += dy;
  if(x < 0 || x > width){
    dx *= -1;
  }
  if(y < 0 || y > height){
    dy *= -1;
  }
}

