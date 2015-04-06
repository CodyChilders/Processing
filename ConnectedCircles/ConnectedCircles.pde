Circle[] circles;

void setup() {
  size(500, 500);
  smooth();
  frameRate(60);
  circles = new Circle[20];
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle();
  }
}

void draw() {
  background(50);
  for (int i = 0; i < circles.length; i++) {
    //updates the values of the circles
    circles[i].newFrame();
    //display the circles
    circles[i].display();
  }
  //draw the lines connecting circles
  for(int i = 0; i < circles.length; i++){
    stroke(255);
    try{
      line(circles[i].getX(), circles[i].getY(), circles[i+1].getX(), circles[i+1].getY());
    }catch(ArrayIndexOutOfBoundsException e){
      line(circles[1].getX(), circles[1].getY(), circles[circles.length-1].getX(), circles[circles.length-1].getY());
    }
  }
}

class Circle {
  //variables
  private int posx = round(random(0, width));
  private int posy = round(random(0, height));
  private int r = round(random(10, 100));
  private int vx = round(random(1, 2));
  private int vy = round(random(1, 2));

  //draws the object
  public void display() {
    noStroke();
    fill(0, 0, 100, 192);
    ellipse(posx, posy, r, r);
  }

  public void newFrame() {
    //reverse x if necessary
    if (posx >= width || posx <= 0) {
      vx *= -1;
    }
    //update x
    posx += vx;
    //reverse y if necessary
    if (posy >= height || posy <= 0) {
      vy *= -1;
    }
    //update y
    posy += vy;
  }
  
  //return x position
  public int getX() {
    return posx;
  }

  //return y position
  public int getY() {
    return posy;
  }
}

