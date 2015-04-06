int R = 255;//red
int G = 0;//green
int B = 0;//blue
int x = 0;//x coordinate of point
int y = 0;//y coordinate of point
int i = 0;//loop control variable
int opacity = 255;//opacity, fades as it goes down

void setup(){
  size(256, 256);
  background(255);
  frameRate(100000);
  smooth();
}

void draw(){
  if (x >= 0 && x < width/6){
    R = 255;
    G = G + 6;
    B = 0;
  }
  
  if (x >= width/6 && x < 2*width/6){
    R = R - 6;
    G = 255;
    B = 0;
  }
  
  if (x >= 2*width/6 && x < 3*width/6){
    R = 0;
    G = 255;
    B = B + 6;
  }
  
  if (x >= 3*width/6 && x < 4*width/6){
    R = 0;
    G = G - 6;
    B = 255;
  }
  
  if (x >= 4*width/6 && x < 5*width/6){
    R = R + 6;
    G = 0;
    B = 255;
  }
  
  if (x >= 5*width/6 && x < width){
    R = 255;
    G = 0;
    B = B - 6;
  }
  
  if (i == width){
    y = y + 1;
    x = 0;
    opacity = opacity - 1;
    i = 0;
  }
  
  if (i < 256 && y <= 256){
    stroke(R, G, B, opacity);
    point (x, y);
    x = x + 1;
    i = i + 1;
  }
}
