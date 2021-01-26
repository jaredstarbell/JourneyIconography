class BGrid {
  float x, y;
  float w;
  int dim;
  int[] vals;

  // common simple glyphs
  int[] c0 = {1,1,1, 0,0,1, 1,0,1};    // corner dot with L
  int[] c1 = {1,1,1, 1,0,0, 1,1,1};    // C
  int[] c2 = {1,1,1, 0,0,0, 1,0,1};    // face
  int[] c3 = {0,0,1, 0,1,1, 1,1,1};    // stairstep
  int[] c4 = {1,0,0, 1,1,0, 1,1,1};    // stairstep reverse
  int[] c5 = {1,1,1, 1,0,1, 1,0,0};    // P
  int[] c6 = {1,1,1, 1,0,1, 0,0,1};    // P reverse
  int[] c7 = {1,0,1, 1,0,1, 1,0,0};    // bars, one short
  int[] c8 = {1,0,1, 1,0,1, 0,0,1};    // bars, one short reverse
  int[] c9 = {1,0,1, 1,0,1, 1,0,1};    // two equal bars
  int[] c10 = {1,1,1, 1,0,1, 1,1,1};    // box
  int[] c11= {1,1,1, 1,1,0, 1,0,1};    // arrow
  int[] c12= {1,0,1, 0,0,0, 1,0,1};    // corner dots
  int[] c13= {1,0,0, 1,0,0, 1,1,1};    // L
  int[] c14= {1,1,1, 0,1,0, 0,1,0};    // T
  int[] c15= {1,0,1, 1,1,1, 1,0,1};    // H
  int[] c16= {0,1,1, 0,1,0, 1,1,0};    // S
  int[] c17= {1,1,1, 0,1,0, 1,0,1};    // invader
  int[] c18= {1,1,1, 0,0,0, 1,0,0};    // bar and dot
  int[] c19= {1,1,1, 0,0,0, 0,0,1};    // bar and dot reverse
  
  BGrid(float _x, float _y, float _w, int _dim) {
    x = _x;
    y = _y;
    w = _w;
    dim = _dim;
    
    
    // initialize array to hold block values
    vals = new int[dim*dim];

    // generate from one of the common glyphs
    int c = floor(random(20));
    genCommon(c);
    int rotations = floor(random(3));
    turn(rotations);
  }
  
  void render() {
    pushMatrix();
    translate(x,y);
    fill(255);
    noStroke();
    for (int n=0;n<dim*dim;n++) {
      if (vals[n]==1) {
        int i = n%dim;
        int j = floor(n/dim);
        rect(i*w,j*w,w,w); 
      }
    }
    popMatrix();
  }
  
  void genCommon(int c) {
    if (c==0) vals = c0;
    if (c==1) vals = c1;
    if (c==2) vals = c2;
    if (c==3) vals = c3;
    if (c==4) vals = c4;
    if (c==5) vals = c5;
    if (c==6) vals = c6;
    if (c==7) vals = c7;
    if (c==8) vals = c8;
    if (c==9) vals = c9;
    if (c==10) vals = c10;
    if (c==11) vals = c11;
    if (c==12) vals = c12;
    if (c==13) vals = c13;
    if (c==14) vals = c14;
    if (c==15) vals = c15;
    if (c==16) vals = c16;
    if (c==17) vals = c17;
    if (c==18) vals = c18;
    if (c==19) vals = c19;
  }
  
  void turn(int rotations) {
    for (int r=0;r<rotations;r++) vals = rotateClockwise(vals);
  }
  
  int[] rotateClockwise(int[] a) {
    // rotate the 3x3 matrix of ints 90 degress clockwise
    int[] temp = new int[a.length];
    for (int n=0;n<a.length;n++) {
      int i = n%dim;
      int j = floor(n/dim);
      int ni = dim-j-1;
      int nj = i;
      temp[nj*dim+ni] = a[j*dim+i];
    }
    return temp;
    
  }
  
  void genRandom() {
    // randomize blocks with 50/50 chance of lit block
    for (int n=0;n<dim*dim;n++) {
      vals[n] = 0;
      if (random(100)<50) vals[n] = 1;
    }
  }
  
}
