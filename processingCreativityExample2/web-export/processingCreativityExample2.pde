color c = color(151, 255, 18);

void setup(){
  size(500, 500);
  background(0);
}

void draw(){
  noFill();
  stroke(c);
  ellipse(width/2, height/2, mouseX, mouseY);
  noStroke();
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
}

void mousePressed(){
  c = color(random(0, 255), random(0, 255), random(0, 255));
}

