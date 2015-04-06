float x = 1;

void setup(){
  size (1000,1000);
  background(255);
  smooth();
  noStroke();
  frameRate(60);
}

void draw(){
  fill (random(255), random(255), random(255), random(255));
  x = random(200);
  ellipse (random(1000), random(1000), x, x);
}
