import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Monster monster;
Person person;
Ground ground;
Projectile laser;
Explosion boom;

Minim minim;
AudioPlayer ambientSound;
AudioPlayer fire;
AudioPlayer explode;

void setup(){
  size(500, 500);
  smooth();
  colorMode(RGB, 1);
  noCursor();
  frameRate(60);
  
  //create display objects
  ground = new Ground();
  monster = new Monster();
  person = new Person(ground);
  
  //load audio files and sound effects
  minim = new Minim(this);
  ambientSound = minim.loadFile("Low End Rumble Loop 02.wav");
  fire = minim.loadFile("Alien Wierdness Descending 01.wav");
  explode = minim.loadFile("Explosion with Metal Debris.wav");
  
  
  //start the sound
  ambientSound.play();
}

void draw(){
  background(0);
  //keep the background sound going
  if(!ambientSound.isPlaying()){
    ambientSound.loop(0);
  }
  
  //checks if it needs to fire the projectile
  if(mousePressed && laser == null && boom == null){
    laser = new Projectile(person, monster);
    fire.loop(0);
  }
  if(laser != null){
    if(laser.getY() >= height - 5){
      boom = new Explosion(laser, ground);
      laser = null;
      explode.loop(0);
    }
  }
  
  //update each object
  monster.update(person.getX());
  person.update(laser == null, laser, boom);
  if(laser != null){
    laser.update();
  }
  if(boom != null){
    boom.update();
    if(boom.isDone()){
      boom = null;
    }
  }
  
  //conditional objects
  if(laser != null){
    laser.render();
  }
  if(boom != null){
    boom.render();
  }
  
  //draw each object
  monster.render();
  person.render();
  
  //draw the ground
  ground.render();
  
  
  //debug
  //println("mouseX: " + mouseX + "\nmouseY: " + mouseY + "\nmousePressed: " + mousePressed);
}


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
