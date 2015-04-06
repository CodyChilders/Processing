//constants for easy modification
static final int dim = 50;
static final int bigness = 10;
static final int frame = 5;
//variance is an int from -5 to 5 to determine imbalance
static final int variance = -4;

boolean[][] cells;
//true = alive, false = dead

void setup(){
  size(dim * bigness, dim * bigness);
  frameRate(frame);
  cells = new boolean[dim][dim];
  for(int i = 0; i < dim; i++){
    for(int j = 0; j < dim; j++){
      int x = round(random(-5, 5));
      if (x < variance){
        cells[i][j] = true;
      }else{
        cells[i][j] = false;
      }
    }
  }
}

void draw(){
  //refresh screen
  background(0);
  
  //loop over data
  for(int i = 0; i < dim; i++){
    for(int j = 0; j < dim; j++){
      //checks if it is alive or dead
      checkStatus(i, j);
      //draw based on status
      if (cells[i][j] == true){
        fill(0, 0, 125);
      }else{
        fill(125);
      }
      ellipse(i * bigness + bigness / 2, j * bigness +  bigness / 2, bigness, bigness);
    }
  }
}

void checkStatus(int a, int b){
  int livingNeighbors = 0;
  try{
    if(cells[a - 1][b - 1]){
      livingNeighbors++;
    }
  }catch(IndexOutOfBoundsException e){
    //println("edge of array");
  }
  try{
    if(cells[a - 1][b]){
      livingNeighbors++;
    }
  }catch(IndexOutOfBoundsException e){
    //println("edge of array");
  }
  try{
    if(cells[a - 1][b + 1]){
      livingNeighbors++;
    }
  }catch(IndexOutOfBoundsException e){
    //println("edge of array");
  }
  try{
    if(cells[a][b - 1]){
      livingNeighbors++;
    }
  }catch(IndexOutOfBoundsException e){
    //println("edge of array");
  }
  try{
    if(cells[a][b + 1]){
      livingNeighbors++;
    }
  }catch(IndexOutOfBoundsException e){
    //println("edge of array");
  }
  try{
    if(cells[a + 1][b - 1]){
      livingNeighbors++;
    }
  }catch(IndexOutOfBoundsException e){
    //println("edge of array");
  }
  try{
    if(cells[a + 1][b]){
      livingNeighbors++;
    }
  }catch(IndexOutOfBoundsException e){
    //println("edge of array");
  }
  try{
    if(cells[a + 1][b + 1]){
      livingNeighbors++;
    }
  }catch(IndexOutOfBoundsException e){
    //println("edge of array");
  }

  /*if( (a == 0 && b == 0) || (a == 0 && b == dim - 1) || (a == dim - 1 && b == 0) || (a == dim - 1 && b == dim - 1) ){
    println("frameCount = " + frameCount + " " + a + " " + b + " " + livingNeighbors);
  }*/
  if(livingNeighbors < 2){
    cells[a][b] = false;
    return;
  }
  if(livingNeighbors >=2 && livingNeighbors < 4){
    cells[a][b] = true;
    return;
  }
  if(livingNeighbors >= 4){
    cells[a][b] = false;
    return;
  }
}
