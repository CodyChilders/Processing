float theta = 0;
float distance = 275;
float r = random(255), g = random(255), b = random(255);
float dr = random(-5, 5), dg = random(-5, 5), db = random(-5, 5);

void setup(){
  size(500, 500);
  background(0);
  frameRate(15);
  strokeWeight(3);
}

void draw(){
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
  translate(width/2, height/2);
  rotate(theta);
  stroke(r, g, b);
  if(distance > 0){
    line(0, 0, 0, distance);
  }else{
    noLoop();
  }
  distance -= 0.3;
  theta += 0.05;
}
