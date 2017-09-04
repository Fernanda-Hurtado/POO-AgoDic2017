PGraphics pg;
int px[]={0,100,100,0};
int py[] = {0,0,100,100};
int escalaCuadro = 0;
int vel = 15;
  int r=255;
  int g=0;
  int b=0;
int playSample = 0;
float rotar= 0;
int marque = 0;

void setup() {
  //size(200, 200,P2D);
  fullScreen(P2D);
  smooth();
  pg = createGraphics(200, 200);
}

void draw() {
  background(0);
  pg.beginDraw();
 switch(playSample){
  case 0:
    lineasNoise();
    break;
  case 1:
    escalar();
    break;
  case 2:
    espiral();
    break;
  case 3:
    marque();
    break;
  case 4:
    cuadros();
    break;
  case 5:
    blanco();
    break;
 }
  pg.endDraw();
  noStroke();
  

  
  beginShape();
  texture(pg);
  vertex(px[0], py[0], 0, 0);
  vertex(px[1], py[1], 200, 0);
  vertex(px[2], py[2], 200, 200);
  vertex(px[3], py[3], 0, 200);
  endShape();
  fill(255,0,0);
  
}

void keyPressed(){
  if(key == '0'){
    playSample = 0;
  }
  if(key == '1'){
    playSample = 1;
  }
  if(key == '2'){
    playSample = 2;
  }
  if(key == '3'){
    playSample = 3;
  }
  
  if(key == '4'){
    playSample = 4;
  }
  if(key == '5'){
    playSample = 5;
  }
  
}



void mouseDragged() {
  for(int i =0; i<4;i++){
  if (((mouseX>= px[i]-10)&&(mouseX<= px[i]+10)) && ((mouseY>= py[i]-10)&&(mouseY<= py[i]+10))){
    px[i] = mouseX;
    py[i] = mouseY;
    }
  }
}

void lineasNoise(){
  pg.background(100);
  pg.stroke(250);
  for (int i = 0; i<50; i++){
    pg.smooth();
  pg.strokeWeight(random(10));
  pg.line(random(-200,400),random(-200, 400),random(-200, 400),random(-200,400));
  }
}

void escalar(){
  pg.background(0);
  pg.fill(r,g,b);
  pg.noStroke();
  pg.rectMode(CENTER);
  pg.rect(100,100,escalaCuadro,escalaCuadro);
  escalaCuadro += vel;
  
  if(abs(escalaCuadro) > 200){
    vel*=-1;
  } 
    if(abs(escalaCuadro) <= 0){
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
      vel*=-1;
    
  }
}

void espiral(){
  rotar+= 0.1;
  pg.translate(100,100);
  pg.rotate(rotar);
  pg.background(0,0,120);
  pg.fill(150,150,255);
  pg.noStroke();
  for (int i=0; i<300; i++){
    pg.ellipse(sin(i)*i*0.7, cos(i)*i*0.7,i*0.1,i*0.1);
  } 
}

void marque(){
  marque+=2;
  if (marque>=20){
    marque=0;
  }
  pg.background(255,0,0);
  pg.fill(255,150,150);
  pg.noStroke();
  pg.rectMode(CORNER);
  for (int i = -1; i<20; i++){
    pg.rect(i*20+marque,0,10,200);
  }
}

void cuadros(){
   pg.noStroke();
  pg.rectMode(CORNER);
  for (int i = 0; i<20; i++){
    for (int j =0; j<20; j++){
    pg.fill(200+random(50),random(255),150+random(100)); 
    pg.rect(i*10,j*10,10,10);
    }
  }
}

void blanco(){
  pg.background(255);
}
