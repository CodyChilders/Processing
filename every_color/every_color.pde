int r = 0,       //red component
    g = 0,       //green component
    b = 0,       //blue component
    counter = 0; //file number to write out
    
void setup(){
  size(130,130);
  background(0);
  frameRate(60);
}

void draw(){
  fill(r, g, b);
  rect(0, 0, width, height);
  
  //picture writing code
  String file = pictureName();
  saveFrame(file);
  counter++;
  
  //color modification code
  b++;
  if(b == 256){
    b = 0;
    g++;
  }
  if(g == 256){
    g = 0;
    r++;
  }
  if(r == 256){
    exit();
  }  
  //debug code
  println(r + " " + g + " " + b);
}

//makes sure the file name is always 8 character + .jpg
String pictureName(){
  String file = Integer.toString(counter);
  int strlng = file.length();
  String zeros = "";
  while( (zeros.length() + strlng) < 8){
    zeros += "0";
  }
  return( "images/" + zeros + file + ".jpg");
}`
