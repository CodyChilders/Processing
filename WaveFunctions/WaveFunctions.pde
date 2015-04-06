int width = 800;
int height = 500;
int base = 0;
final float inputScaleConstant = 0.009;
final int outputScaleConstant = round(0.45 * height);
final int baseIncrementConstant = 3;
final color w1 = color(255, 200, 200);
final color w2 = color(200, 255, 200);
final color w3 = color(200, 200, 255);

void setup(){
  size(width, height);
  strokeWeight(5);
}

void draw(){
  background(255);
  //first wave
  stroke(w1);
  float oldx = 0, oldy = rescale(wave1((base) * inputScaleConstant));
  for(int i = 1; i < width; i++){
    float y = rescale(wave1((i + base) * inputScaleConstant));
    line(oldx, oldy + height/2, i, y + height/2);
    oldx = i;
    oldy = y;
  }
  
  //second wave
  stroke(w2);
  oldx = 0;
  oldy = rescale(wave2((base) * inputScaleConstant));
  for(int i = 1; i < width; i++){
    float y = rescale(wave2((i + base) * inputScaleConstant));
    line(oldx, oldy + height/2, i, y + height/2);
    oldx = i;
    oldy = y;
  }
  
  //third wave
  stroke(w3);
  oldx = 0;
  oldy = rescale(wave3((base) * inputScaleConstant));
  for(int i = 1; i < width; i++){
    float y = rescale(wave3((i + base) * inputScaleConstant));
    line(oldx, oldy + height/2, i, y + height/2);
    oldx = i;
    oldy = y;
  }
  
  //increment for next frame
  base += baseIncrementConstant;
}

float wave1(float x){
  return -cos(x);
}

float wave2(float x){
  return -cos(0.7 * x);
}

float wave3(float x){
  return -cos(1.3 * x);
}

int rescale(float value){
  return round(value * outputScaleConstant);
}
