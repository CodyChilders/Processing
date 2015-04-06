float brush = 33;//brush size
int colorSelect1 = 0;//red
int colorSelect2 = 0;//green
int colorSelect3 = 0;//blue
boolean circle = true;//circular brush
boolean square = false;//square brush
boolean tri = false;//triangular brush
int R = 255;//red (gradient)
int G = 0;//green (gradient)
int B = 0;//blue (gradient)
int x = 0;//x coordinate of point
int y = 0;//y coordinate of point
int i = 0;//loop control variable
int opacity = 255;//opacity, fades as it goes down
boolean ready = false;

void setup(){
  frameRate(60);
  size (1100, 800);
  background(255);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw(){
  
  //brush
  if (mousePressed && ready == true){
    if (circle == true && square == false && tri == false && mouseX >= 300){
      noStroke();
      fill(colorSelect1, colorSelect2, colorSelect3);
      ellipse(mouseX, mouseY, brush, brush);
    }else if(circle == false && square == true && tri == false && mouseX >= 300){
      noStroke();
      fill(colorSelect1, colorSelect2, colorSelect3);
      rect(mouseX, mouseY, 2*brush, 2*brush);
    }else if(circle == false && square == false && tri == true && mouseX >= 300){
      noStroke();
      fill(colorSelect1, colorSelect2, colorSelect3);
      triangle(mouseX, mouseY - brush, mouseX - 2*brush/1.7, mouseY + brush, mouseX + 2*brush/1.7, mouseY + brush);
    }
  }
  
  //selection bar
  noStroke();
  fill(127);
  rect(278, height/2, 44, height);
  rect(150, 528, 300, 844);
 
  //add white & black buttons & master RGB and brushes
  stroke(255);
  fill(0);
  rect(25, 170, 50, 50);
  
  stroke(0);
  fill(255);
  rect(100, 170, 50, 50);
  //+red
  fill(255, 0, 0);
  rect(25, 250, 50, 50);
  //+green
  fill(0, 255, 0);
  rect(100, 250, 50, 50);
  //+blue
  fill(0, 0, 255);
  rect(175, 250, 50, 50);
  //-red
  fill(100, 0, 0);
  rect(25, 320, 50, 50);
  //-green
  fill(0, 100, 0);
  rect(100, 320, 50, 50);
  //-blue
  fill(0, 0, 100);
  rect(175, 320, 50, 50);
  
  //brushes
  fill(colorSelect1, colorSelect2, colorSelect3);
  ellipse(25, 390, 50, 50);
  rect(100, 390, 50, 50);
  triangle(175, 365, 150, 415, 200, 415);
  
  //brush size
  fill(0);
  ellipse (25, 460, 25, 25);
  ellipse (100, 460, 70, 70);
  
  //current brush
  if (circle == true && square == false && tri == false){
      noStroke();
      fill(colorSelect1, colorSelect2, colorSelect3);
      ellipse(150, 700, brush, brush);
    }else if(circle == false && square == true && tri == false){
      noStroke();
      fill(colorSelect1, colorSelect2, colorSelect3);
      rect(150, 700, 2*brush, 2*brush);
    }else if(circle == false && square == false && tri == true){
      noStroke();
      fill(colorSelect1, colorSelect2, colorSelect3);
      triangle(150, 700 - brush, 150 - 2*brush/1.7, 700 + brush, 150 + 2*brush/1.7, 700 + brush);
    }
  
  //add black and white and master RGB and brushes
  if (mousePressed){
    if (mouseX >= 0 && mouseX <= 50 && mouseY >= 145 && mouseY <= 195){
      colorSelect1 = colorSelect1 - 2;
      colorSelect2 = colorSelect2 - 2;
      colorSelect3 = colorSelect3 - 2;
    }
    
    if (mouseX >= 75 && mouseX <= 125 && mouseY >=145 && mouseY <= 195){
      colorSelect1 = colorSelect1 + 2;
      colorSelect2 = colorSelect2 + 2;
      colorSelect3 = colorSelect3 + 2;
    }
    
    if (mouseX >= 0 && mouseX <= 50 && mouseY >= 225 &&  mouseY <= 275){
      colorSelect1 = colorSelect1 + 1;
    }
    
    if (mouseX >= 75 && mouseX <= 125 && mouseY >= 225 &&  mouseY <= 275){
      colorSelect2 = colorSelect2 + 1;
    }
    
    if (mouseX >= 150 && mouseX <= 200 && mouseY >= 225 &&  mouseY <= 275){
      colorSelect3 = colorSelect3 + 1;
    }
    
    if (mouseX >= 0 && mouseX <= 50 && mouseY >= 295 && mouseY <= 345){
      colorSelect1 = colorSelect1 - 1;
    }
    
    if (mouseX >= 75 && mouseX <= 125 && mouseY >= 295 && mouseY <= 345){
      colorSelect2 = colorSelect2 - 1;
    }
    
    if (mouseX >= 150 && mouseX <= 200 && mouseY >= 295 && mouseY <= 345){
      colorSelect3 = colorSelect3 - 1;
    }
    
    if (mouseX >= 0  && mouseX <= 50 && mouseY >= 365 && mouseY <= 415){
      circle = true;
      square = false;
      tri = false;
    }
    
    if (mouseX >= 75 && mouseX <= 125 && mouseY >= 365 && mouseY <= 415){
      circle = false;
      square = true;
      tri = false;
    }
    
    if (mouseX >= 150 && mouseX <= 200 && mouseY >= 365 && mouseY <= 415){
      circle = false;
      square = false;
      tri = true;
    }
    if (mouseX >= 25/2 && mouseX <= 3*25/2 && mouseY >= 460-25/2 && mouseY <= 460+25/2){
      brush = brush - 1;
    }
    
    if (mouseX >= 75/2 && mouseX <= 3*75/2 && mouseY >= 460-75/2 && mouseY <= 460+75/2){
      brush = brush + 1;
    }
    
    colorSelect1 = constrain(colorSelect1, 0, 255);
    colorSelect2 = constrain(colorSelect2, 0, 255);
    colorSelect3 = constrain(colorSelect3, 0, 255);
    brush = constrain(brush, 1, 44);
  }
  
  // color selector
  if (x >= 0 && x < 256/6){
    R = 255;
    G = G + 6;
    B = 0;
  }
  
  if (x >= 256/6 && x < 2*256/6){
    R = R - 6;
    G = 255;
    B = 0;
  }
  
  if (x >= 2*256/6 && x < 3*256/6){
    R = 0;
    G = 255;
    B = B + 6;
  }
  
  if (x >= 3*256/6 && x < 4*256/6){
    R = 0;
    G = G - 6;
    B = 255;
  }
  
  if (x >= 4*256/6 && x < 5*256/6){
    R = R + 6;
    G = 0;
    B = 255;
  }
  
  if (x >= 5*256/6 && x < 256){
    R = 255;
    G = 0;
    B = B - 6;
  }
  
  if (i <= 256){
    stroke(R, G, B, opacity);
    line(x, 0, x, 105);
    x = x + 1;
    i = i + 1;
  }
  
  //don't start before colors are loaded
  if (i == 256){
    ready = true;
  }
  
  //selecting color on gradient
  if (mousePressed){
    if (mouseX >= 0 && mouseX < 256/6 && mouseY <= 105){
      colorSelect1 = 255;
      colorSelect2 = mouseX * 6;
      colorSelect3 = 0;
    }
  
    if (mouseX >= 256/6 && mouseX < 2*256/6 && mouseY <= 105){
      colorSelect1 = (86 - mouseX) * 6;
      colorSelect2 = 255;
      colorSelect3 = 0;
    }
  
    if (mouseX >= 2*256/6 && mouseX < 3*256/6 && mouseY <= 105){
      colorSelect1 = 0;
      colorSelect2 = 255;
      colorSelect3 = (mouseX - 86) * 6;
    }
  
    if (mouseX >= 3*256/6 && mouseX < 4*256/6 && mouseY <= 105){
      colorSelect1 = 0;
      colorSelect2 = (171 - mouseX) * 6;
      colorSelect3 = 255;
    }
  
    if (mouseX >= 4*256/6 && mouseX < 5*256/6 && mouseY <= 105){
      colorSelect1 = (mouseX - 171) * 6;
      colorSelect2 = 0;
      colorSelect3 = 255;
    }
  
    if (mouseX >= 5*256/6 && mouseX < 256 && mouseY <= 105){
      colorSelect1 = 255;
      colorSelect2 = 0;
      colorSelect3 = (256 - mouseX) * 6;
    }
  }
}
