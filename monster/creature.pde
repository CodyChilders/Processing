
class Monster{
  
  private static final int monsterSize = 125;
  
  private int x;
  private float blinkAngle;
  private boolean blinking;
  private float blinkIncrement;
  private float eyeAngle;
  
  public Monster(){
    this.x = width/2;
    blinkAngle = 1;
    blinking = false;
    blinkIncrement = -0.05;
    eyeAngle = 0.0;
  }
  
  public int getX(){
    return this.x;
  }
  
  public int getY(){
    return monsterSize/2 + 25;
  }
  
  public void update(int personX){
    //sets the eye to start blinking
    if(frameCount % 400 == 0){
      blinking = true;
    }
    
    //controls the blinking
    if(blinking){
      blinkAngle += blinkIncrement;
      if(blinkAngle <= 0 || blinkAngle >= 1){
        blinkIncrement *= -1;
      }
      blinkAngle = constrain(blinkAngle, 0, 1);
      if(blinkAngle == 1){
        blinking = false;
      } 
    }
    //move the eye in accordance with the person
    track(personX);
    
    //calculate what angle to draw the arc
    this.eyeAngle = atan((this.x - personX)/87.5) + blinkAngle/2;
    this.eyeAngle = constrain(eyeAngle, PI/4, 3*PI/4);
    
    //debug
    //println("blinking:" + blinking + "\nblinkAngle: " + blinkAngle + "\nblinkIncrement: " + blinkIncrement + "\nframe: " + frameCount);
    //println("this.x: " + x);
  }
  
  private void track(int a){
    if(this.x < a){
      this.x++;
    }else if(this.x > a){
      this.x--;
    }
    x = constrain(x, 75, width - 75);
    //println("it got here");
    //println("personX: " + a + "\nthis.x: " + this.x);
  }
  
  public void render(){
    fill(0);
    stroke(1);
    //draw the body
    ellipse(x, monsterSize/2 + 25, monsterSize, monsterSize);
    noStroke();
    fill(1);
    //draw the arc for the eye
    drawEye();
    noFill();
    stroke(1);
    ellipse(x, monsterSize/2 + 25, monsterSize, monsterSize);
  }
  
  private void drawEye(){
    ellipseMode(CENTER);
    pushMatrix();
    translate(x, monsterSize/2 + 25);
    rotate(eyeAngle);
    arc(0, 0, monsterSize, monsterSize, 0, blinkAngle);
    //arc(0, 0, monsterSize, monsterSize, 0, -1 * blinkAngle/2);
    //draw pupil
    fill(0);
    noStroke();
    rotate(blinkAngle/2);
    ellipse(monsterSize/2, 0, 20, 20);
    popMatrix();
  }
}
