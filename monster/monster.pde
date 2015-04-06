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


