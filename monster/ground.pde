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
