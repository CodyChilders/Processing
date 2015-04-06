float maxVelocity = 6;
float x = 300, y = 300, xSpeed = random(-maxVelocity, maxVelocity), ySpeed = random(-maxVelocity, maxVelocity);
color c = color(random(0, 255), random(0, 255), random(0, 255));

void setup() {
  size(600, 600);
  noStroke();
  background(0);
}

void draw() {
  //background(0);
  fill(c);
  ellipse(x, y, 20, 20);
  x += xSpeed;
  y += ySpeed;
  if (x >= width || x <= 0) {
    xSpeed = -xSpeed;
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }
  if (y >= height || y <= 0) {
    ySpeed = -ySpeed;
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }
}

void keyPressed() {
  if (key == 'r') {
    background(0);
    x = random(1, height - 1);
    y = random(1, height - 1);
    xSpeed = random(-maxVelocity, maxVelocity);
    ySpeed = random(-maxVelocity, maxVelocity);
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }
}


