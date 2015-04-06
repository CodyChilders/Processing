int width = 500;
int height = 500;
float x = -1*width/2;
float y = -1*height/2;
int i = 0;
float PX = 0;
float PY = 0;
int zoom = 250;

void setup(){
  size(width, height);
  frameRate(60);
  background(255);
}

void draw(){
  noFill();
  stroke(0);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
  float f = 300 * x * sin(x/75.0);
  
  if ( i <= width){
    y = f/zoom;
    if (i >= 1){
      line(width/2 + x, height/2 - y, width/2 + PX, height/2 - PY);
    }
    PX = x;
    PY = y;
    x += 1;
    i += 1;
  }
}

// shortcuts
/* * is multiply
/ is divide
+ and - .... duh
pow(a, b) = a^b
sqrt(a, b) = a^(1/b)
abs(a) = |a|
log(a) = ln(a)
log b (a) = log(a)/log(b)
*/
