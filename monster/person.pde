class Person{
  
  private static final int bodyHeight = 22;
  private static final int headSize = 12;
  
  //base of the body above the ground
  private int core;
  private int staticCore;
  //x coordinate of the person
  private int x;
  private boolean jumping;
  private int jumpTimeRemaining;
  
  public Person(Ground g){
    this.core = height - g.getElevation() - 20;
    this.staticCore = this.core;
    this.x = 10;
    this.jumping = false;
    this.jumpTimeRemaining = maxDuration;
  }
  
  public int getX(){
    return this.x;
  }
  
  public int getY(){
    return this.core + 20;
  }
  
  public void update(boolean laserNotFiring, Projectile proj, Explosion expl){
    if(laserNotFiring){
      track();
    }else{
      jumping = true;
    }
    //println("jumping: " + jumping + "\ncore: " + core + "\nmousePressed: " + mousePressed);
    
    //println(jumping);
    if(jumping){
      jump(proj, expl);
    }
  }
  
  private void jump(Projectile p, Explosion e){
    //code to have the person jump
    if(p != null){
      if(p.getY() >= core - 5){
        //jumpTimeRemaining = maxDuration;
      }
    }
    --jumpTimeRemaining;
    //println("core pre: " + core);
    //println(jumpTimeRemaining + "\n" + maxDuration);
    //println(jumpTimeRemaining >= maxDuration / 2);
    if(jumpTimeRemaining >= maxDuration / 2){
      core--;
    }else{
      core++;
    }
    //println("core post: " + core);
    if(jumpTimeRemaining <= 0){
      jumping = false;
      jumpTimeRemaining = maxDuration;
    }
  }
  
  private void track(){
    //makes it follow the mouse but not snap to it
    if(mouseX > x){
      this.x += 2;
    }else{
      this.x -= 2;
    }
    //prevents it from going off the screen
    x = constrain(x, 15, width - 15);
  }
  
  public void render(){
    noFill();
    stroke(1);
    //body line
    line(x, core, x, core - bodyHeight);
    //head
    ellipse(x, core - bodyHeight - headSize + 5, headSize, headSize);
    //legs
    line(x, core, x + 5, core + 20);
    line(x, core, x - 5, core + 20);
    //arms
    line(x, core - 4*bodyHeight/5, x + 10, core - bodyHeight - 3);
    line(x, core - 4*bodyHeight/5, x - 10, core - bodyHeight - 3);
  }
}
