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
