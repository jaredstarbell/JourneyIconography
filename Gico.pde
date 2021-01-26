class Gico {
  
  float x, y;
  float w;
  int dim;
  
  ArrayList<BGrid> bgrids = new ArrayList<BGrid>();
  
  Gico(float _x, float _y, float _w, int _dim) {
    x = _x;
    y = _y;
    w = _w;
    dim = _dim;
    
    generate();
    render();
  }
  
  void generate() {
    float totalw = w*(dim+1);
    for (int i=0;i<2;i++) {
      for (int j=0;j<2;j++) {
        BGrid neo = new BGrid(i*totalw,j*totalw,w,dim);
        bgrids.add(neo);
      }
    }
  }
  
  void render() {
    pushMatrix();
    translate(x,y);
    for (BGrid g:bgrids) g.render();
    popMatrix();
  }
}
