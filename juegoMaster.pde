// El juego tiene un bug en juego(); resolver problema. 
int pantalla = 0;
boolean j1seleccion = false;
boolean j2seleccion = false;
int turno = 1;

Carta p1;
Carta p2;
Carta p3;
Carta p4;

Carta j1;
Carta j2;



void setup(){
  p1 = new Carta("Ate",10,1,0);
  p2 = new Carta("Joel",10,1,0);
  p3 = new Carta("Mariana",10,1,0);
  p4 = new Carta("Martín",10,1,0); 
}



void draw(){
  switch(pantalla){
    case 0:
      intro();
    break;
    case 1:
      seleccion();
    break;
    case 2:
      juego();
    break;
    case 3:
      fin();
    break;
  } 
  println(pantalla);
}

void intro(){
  if (mousePressed){
    pantalla = 1;
  }
}

void seleccion(){
  if (j1seleccion && j2seleccion){
    pantalla = 2;
  }
  if (keyPressed){
    switch(key){
      case 'q':
        j1 = p1;
        j1seleccion = true;
      break;
       case 'w':
        j1 = p2;
        j1seleccion = true;
      break;
       case 'e':
        j1 = p3;
        j1seleccion = true;
      break;
       case 'r':
        j1 = p4;
        j1seleccion = true;
      break;
       case 'a':
        j2 = p1;
        j2seleccion = true;
      break;
       case 's':
        j2 = p2;
        j2seleccion = true;
      break;
       case 'd':
        j2 = p3;
        j2seleccion = true;
      break;
       case 'f':
        j2 = p4;
        j2seleccion = true;
      break; 
    }
  }
}

void juego(){
  println(j1.nombre + ","+j1.hp+ ",");
  println(j2.nombre + ","+j2.hp+ ",");
  if (turno == 1){
    if(mousePressed){
      j2.hp -= j1.ataque;
      turno = 2;
    }
  }
  if (turno == 2){
   if(mousePressed){
     j1.hp -= j2.ataque;
     turno = 1;
   }
  }
  if (j1.hp <= 0 || j2.hp<=0){
    pantalla = 3;
  }
}

void fin(){
  if (mousePressed){
    pantalla = 0;
  }
}

class Carta{
  String nombre;
  int hp;
  int ataque;
  int tipo;
  
  Carta(String nombre_,int hp_, int ataque_, int tipo_){
    nombre = nombre_;
    hp = hp_;
    ataque = ataque_;
    tipo = tipo_;
  }
  
  void display(){
    switch(tipo){
      case 0:
        rect(0,0,50,50);
      break;
      case 1:
        ellipse(0,0,50,50);
      break;
    }
  }
}  
