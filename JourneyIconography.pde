// Journey Iconography
//   Icon generator inspired by the game 'Journey' by Thatgamecompany
//   Jared S Tarbell
//   March 20, 2020
//   Levitated Toy Factory, in coronavirus quarantine 

ArrayList<Gico> icos = new ArrayList<Gico>();

int cols =15;
float pad = 25;

void setup() {
  size(1200,1200,FX2D);
  //fullScreen(FX2D);
  background(0);
  
  reset();
  
}

void reset() {
  icos.clear();
  float c = width/cols;
  float w = (c - pad)/7;
  
  for (int i=0;i<cols;i++) {
    for (int j=0;j<cols;j++) {
      Gico g = new Gico(pad/2 + i*c, pad/2 + j*c, w, 3);
      icos.add(g);
    }
  }
  loop();
}

void demo() {
  // show the base glyphs available in a simple row
  icos.clear();
  background(0);
  float lead = 100;
  float kern = 10;
  float c = width/20;
  float w = (c - pad)/3;
  for (int i=0;i<20;i++) {
    BGrid g = new BGrid(kern,lead,w,3);
    g.genCommon(i);
    g.render();
    kern+=3*w+pad;
  }
  noLoop();    
}

void draw() {
  background(0);
  for (Gico g:icos) g.render();
}


void keyPressed() {
  if (key==' ') reset();
  if (key=='d' || key=='D') demo();
}
  
