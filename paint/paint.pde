float brush = 33;
int selectionX = 25;
int selectionY = 40;
int colorSelect1 = 0;
int colorSelect2 = 0;
int colorSelect3 = 0;
PImage b;
boolean circle = true;
boolean square = false;
boolean tri = false;

void setup(){
  frameRate(60);
  size (1100, 600);
  background(255);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  b = loadImage("color_code.jpg");
}

void draw(){
  if (keyPressed){  
    //keypressed color selections
    
    if (key == 'k' || key == 'K'){
      colorSelect1 = 0;
      colorSelect2 = 0;
      colorSelect3 = 0;
      selectionX = 25;
      selectionY = 40;
    }
  
    if (key == 'w' || key == 'W'){
      colorSelect1 = 255;
      colorSelect2 = 255;
      colorSelect3 = 255;
      selectionX = 75;
      selectionY = 40;
    }
  
    if (key == 'r' || key == 'R'){
      colorSelect1 = 255;
      colorSelect2 = 0;
      colorSelect3 = 0;
      selectionX = 25;
      selectionY = 90;
    }
  
    if (key == 'g' || key == 'G'){
      colorSelect1 = 0;
      colorSelect2 = 255;
      colorSelect3 = 0;
      selectionX = 75;
      selectionY = 90;
    }
  
    if (key == 'b' || key == 'B'){
      colorSelect1 = 0;
      colorSelect2 = 0;
      colorSelect3 = 255;
      selectionX = 25;
      selectionY = 140;
    }
  
    if (key == 'y' || key == 'Y'){
      colorSelect1 = 255;
      colorSelect2 = 255;
      colorSelect3 = 0;
      selectionX = 75;
      selectionY = 140;
    }
  
    if (key == 'p' || key == 'P'){
      colorSelect1 = 255;
      colorSelect2 = 0;
      colorSelect3 = 255;
      selectionX = 25;
      selectionY = 190;
    }
  
    if (key == 't' || key == 'T'){
      colorSelect1 = 0;
      colorSelect2 = 255;
      colorSelect3 = 255;
      selectionX = 75;
      selectionY = 190;
    }
  
    if (key == 'u' || key == 'U'){
      colorSelect1 = 125;
      colorSelect2 = 0;
      colorSelect3 = 100;
      selectionX = 25;
      selectionY = 240;
    }
  
    if (key == 'o' || key == 'O'){
      colorSelect1 = 255;
      colorSelect2 = 150;
      colorSelect3 = 0;
      selectionX = 75;
      selectionY = 240;
    }
    
    //change brush type
    if (key == '1'){
      circle = true;
      square = false;
      tri = false;
    }
    
    if (key == '2'){
      circle = false;
      square = true;
      tri = false;
    }
    
    if ( key == '3'){
      circle = false;
      square = false;
      tri = true;
    }
      
  
    //change brush size
  
    if ((key == 'z' || key == 'Z') && 1 < brush && brush <= 300){
      brush = brush - 1;
    }
  
    if ((key == 'x' || key == 'X') && 1 <= brush && brush < 300){
      brush = brush + 1;
    }
  }
  
  //brush
  if (mousePressed){
    if (circle == true && square == false && tri == false){
      noStroke();
      fill(colorSelect1, colorSelect2, colorSelect3);
      ellipse(mouseX, mouseY, brush, brush);
    }else if(circle == false && square == true && tri == false){
      noStroke();
      fill(colorSelect1, colorSelect2, colorSelect3);
      rect(mouseX, mouseY, 2*brush, 2*brush);
    }else if(circle == false && square == false && tri == true){
      noStroke();
      fill(colorSelect1, colorSelect2, colorSelect3);
      triangle(mouseX, mouseY - brush, mouseX - 2*brush/1.7, mouseY + brush, mouseX + 2*brush/1.7, mouseY + brush);
    }
  }
  
  //selection bar
  fill(150);
  noStroke();
  rect(50, height/2, 100, height);
  
  /*
  colors
  */
  
  //black
  fill(0);
  rect(25, 40, 40, 40);
  
  //white
  fill(255);
  rect(75, 40, 40,40);
  
  //red
  fill(255, 0, 0);
  rect(25, 90, 40, 40);
  
  //green
  fill(0, 255, 0);
  rect(75, 90, 40, 40);
  
  //blue
  fill(0, 0, 255);
  rect(25, 140, 40, 40);
  
  //yellow
  fill(255, 255, 0);
  rect(75, 140, 40, 40);
  
  //pink
  fill(255, 0, 255);
  rect(25, 190, 40, 40);
  
  //teal
  fill(0, 255, 255);
  rect(75, 190, 40, 40);
  
  //purple
  fill(125, 0, 100);
  rect(25, 240, 40, 40);
  
  //orange
  fill(255, 150, 0);
  rect(75, 240, 40, 40);
  
  //color selection box
  noFill();
  stroke(0, 0, 150);
  rect(selectionX, selectionY, 45, 45);
  
  image(b, 0, 262);
}
