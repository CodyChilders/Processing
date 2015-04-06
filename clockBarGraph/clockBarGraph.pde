void setup(){
  size(500, 500);
  frameRate(1);
  rectMode(CENTER);
}

void draw() {
  background(255);
  int second = second();  // Values from 0 - 59
  int minute = minute();  // Values from 0 - 59
  int hour = hour();      // Values from 0 - 23
  int day = day();        // Values from 1 - 31
  int month = month();    // Values from 1 - 12
  
  fill(255, 0, 0, 127);
  drawRectBottomCenter(50  , ((float) second) / 60.0 * height);//second
  fill(0, 255, 0, 127);
  drawRectBottomCenter(150 , ((float) minute) / 60.0 * height);//minute
  fill(0, 0, 255, 127);
  drawRectBottomCenter(250 , ((float) hour)   / 24.0 * height);//hour
  fill(255, 255, 0, 127);
  if(month == 2){
    drawRectBottomCenter(350 , ((float) day)    / 29.0 * height);//day
  }else if(month == 9 || month == 4 || month == 6 || month == 11){
    drawRectBottomCenter(350 , ((float) day)    / 30.0 * height);//day
  }else{
    drawRectBottomCenter(350 , ((float) day)    / 31.0 * height);//day
  }
  fill(255, 0, 255, 127);
  drawRectBottomCenter(450 , ((float) month)  / 12.0 * height);//month
  
  //println(second + " " + minute + " " + hour + " " + day + " " + month);
}

void drawRectBottomCenter(float x, float h){
  rect(x, height - h/2, 90, h);
}
