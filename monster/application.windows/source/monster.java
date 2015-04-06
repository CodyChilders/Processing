import processing.core.*; 
import processing.xml.*; 

import ddf.minim.*; 
import ddf.minim.signals.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class monster extends PApplet {






Monster monster;
Person person;
Ground ground;
Projectile laser;
Explosion boom;

Minim minim;
AudioPlayer ambientSound;
AudioPlayer fire;
AudioPlayer explode;

public void setup(){
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

public void draw(){
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
    blinkIncrement = -0.05f;
    eyeAngle = 0.0f;
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
    this.eyeAngle = atan((this.x - personX)/87.5f) + blinkAngle/2;
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
//max duration of explosion animation
final int maxDuration = 50;

class Explosion{
  
  class Shrapnel{
    
    public float dx;
    public float dy;
    
    public Shrapnel(float a, float b){
      this.dx = a;
      this.dy = b;
    }  
  }
  
  //x coordinate of the explosion, y is always ground level
  private int x;  
  private int y;
  
  //counter of the explosion
  private int time;
  //keeps track of shrapnel
  Shrapnel[] fragments;
  
  public Explosion(Projectile p, Ground g){
    this.x = (int)p.getX();
    this.y = height - g.getElevation();
    this.time = 0;
    this.fragments = new Shrapnel[25];
    for(int i = 0; i < fragments.length; i++){
      fragments[i] = new Shrapnel(random(-2, 2), random(0, 2));
    }
  }
  
  public void update(){
    time++;
  }
  
  public void render(){
    noFill();
    stroke(1);
    ellipse(x, y, time, time);
    for(int i = 0; i < fragments.length; i++){
      //println("i: " + i);
      line(x, y, x - (fragments[i].dx * time / 2), y - (fragments[i].dy * time / 2));
      //println("i: " + i + " time: " + time + " dx: " + fragments[i].dx + " dy: "  + fragments[i].dy);
    }
  }
  
  public boolean isDone(){
    return time == maxDuration;
  }
}
class Ground{
  
  private static final int elevation = 5;
  
  public int getElevation(){
    return elevation;
  }
  
  public void render(){
    stroke(1);
    line(0, height-elevation, width, height-elevation);
  }
}

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
class Projectile{
  
  private static final int ballSize = 10;
  
  private float x;
  private float y;
  private int targetX;
  private int targetY;
  private float dx;
  
  public Projectile(Person p, Monster m){
    this.x = (float)m.getX();
    this.y = (float)m.getY();
    this.targetX = p.getX();
    this.targetY = p.getY();
    this.dx = this.x - this.targetX;
  }
  
  public float getY(){
    return this.y;
  }
  
  public float getX(){
    return this.x;
  }
  
  public void update(){
    this.y += 5;
    this.x += (targetX - x) / 18;
    
  }
  
  public void render(){
    noStroke();
    fill(1);
    ellipse(x, y, ballSize, ballSize);
  }
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#C4DAE8", "monster" });
  }
}
