/// var g
particula Pepe; 


void setup(){
  Pepe = new particula(255,0,0,10,10,25,-1,1);
}

void draw(){
  Pepe.movimiento();
  Pepe.rebota();
}


class particula {
  //describir los atributos
  int r,g,b;
  float x,y;
  int tamano;
  float dx,dy;
  
  // metodo de construcción
  particula(int r_, int g_, int b_, float x_, float y_, int tamano_, float dx_, float dy_){
    r = r_;
    g = g_;
    b = b_;
    x = x_;
    y = y_;
    tamano = tamano_;
    dx = dx_;
    dy = dy_;
    
  }
  

  void movimiento(){
    x+= dx;
    y+= dy;
  }
  
  void rebota (){
    if (x>400){
      dx *= -1;
    }
    if (x<0){
       dx *= -1;
    }
    if (y>400){
      dy *= -1;
    }
    if (y<0){
      dy *=-1;
    }
  }   
}
