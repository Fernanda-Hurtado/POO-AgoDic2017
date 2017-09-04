//ejemplo sencillo de PGraphics

PGraphics matriz;
float delta;

void setup(){
  size(400,400);
  matriz = createGraphics(200,200); 
}

void draw(){
  background(255);
  delta+=0.1;
  matriz.beginDraw();
  matriz.background(255);
  matriz.noStroke();
  matriz.fill(255,0,0);
  matriz.ellipse(delta,100,100,100);
  matriz.endDraw();
  image(matriz,100,100);
}
