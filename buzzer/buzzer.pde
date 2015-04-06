import processing.video.*;
boolean p1 = false;
boolean p2 = false;
boolean p3 = false;
boolean p4 = false;
boolean p5 = false;
PImage guide;
//Movie movie;

void setup(){
  size (800, 600);
  smooth();
  background(255);
  rectMode(CENTER);
  guide = loadImage("jeapordy_key_guide.jpg");
  //movie = new Movie (this, "jeapordy theme.wav");
}

void draw(){
  image(guide, width/2 - 125, 40);
  
  noStroke();
  fill(255, 0, 0);
  
  //bottom far left
  ellipse(width/4 - 50, 2*height/3, 200, 200);
  
  //bottom middle
  ellipse(width/2, 2*height/3, 200, 200);
  
  //bottom far right
  ellipse(3*width/4 + 50 , 2*height/3, 200, 200);
  
  //top right
  ellipse(3*width/4 + 50, height/3 - 50, 200, 200);
  
  //top left
  ellipse(width/4 -50, height/3 - 50, 200, 200);
  
  if (keyPressed){
    if (key == 'q' && p2 == false && p3 == false && p4 == false && p5 == false){
      p1 = true;
    }
    
    if (key == 'z' && p1 == false && p3 == false && p4 == false && p5 == false){
      p2 = true;
    }
    
    if (key == 'v' && p1 == false && p2 == false && p4 == false && p5 == false){
      p3 = true;
    }
    
    if (key == 'm' && p1 == false && p2 == false && p3 == false && p5 == false){
      p4 = true;
    }
    
    if (key == 'p' && p1 == false && p2 == false && p3 == false && p4 == false){
      p5 = true;
    }
    
    if (key == 'r'){
      p1 = false;
      p2 = false;
      p3 = false;
      p4 = false;
      p5 = false;
    }
    
    /*if (key == '1'){
      movie.stop();
      movie.play();
    }*/
  }
  
  if (p1 == true){
    fill(0, 255, 0);
    ellipse(width/4 -50, height/3 - 50, 200, 200);
  }
  
  if (p2 == true){
    fill(0, 255, 0);
    ellipse(width/4 - 50, 2*height/3, 200, 200);
  }
  
  if (p3 == true){
    fill(0, 255, 0);
    ellipse(width/2, 2*height/3, 200, 200);
  }
  
  if (p4 == true){
    fill(0, 255, 0);
    ellipse(3*width/4 + 50 , 2*height/3, 200, 200);
  }
  
  if (p5 == true){
    fill(0, 255, 0);
    ellipse(3*width/4 + 50, height/3 - 50, 200, 200);
  }
}
