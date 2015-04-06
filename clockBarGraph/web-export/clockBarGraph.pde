/*
void setup(){
  size(500, 500);
  frameRate(10);
}

void draw() {
  background(255);
  int second = second();  // Values from 0 - 59
  int minute = minute();  // Values from 0 - 59
  int hour = hour();      // Values from 0 - 23
  int day = day();        // Values from 1 - 31
  int month = month();    // Values from 1 - 12
  
  fill(255, 0, 0);
  drawRectBottomCenter(50  , round( (float) second / 59.0) * height);//second
  drawRectBottomCenter(150 , round( (float) minute / 59.0) * height);//minute
  drawRectBottomCenter(250 , round( (float) hour   / 59.0) * height);//hour
  drawRectBottomCenter(350 , round( (float) day    / 59.0) * height);//day
  drawRectBottomCenter(450 , round( (float) month  / 59.0) * height);//month
  ellipse(width/2, height/2, 50, 50);
  println("working...");
}

void drawRectBottomCenter(int x, int h){
  
}
*/
void setup() {

  PFont metaBold;

  metaBold = loadFont("fonts/Meta-Bold.ttf"); 

  setFont(metaBold, 44); 

  noLoop();

}



void draw() {

  int d = day();    // Values from 1 - 31

  int m = month();  // Values from 1 - 12

  int y = year();   // 2003, 2004, 2005, etc.

  String s = String.valueOf(d);

  text(s, 10, 28);

  s = String.valueOf(m);

  text(s, 10, 56); 

  s = String.valueOf(y);

  text(s, 10, 84);

}

