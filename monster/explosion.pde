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
