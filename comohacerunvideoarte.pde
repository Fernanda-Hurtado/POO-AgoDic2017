import processing.video.*;

Movie movie;
Movie movie2;
float delta;
float transparencia;
float cambio;
void setup() {
  size(640, 360);
  background(0);
  // Load and play the video in a loop
  movie = new Movie(this, "transit.mov");
  movie.loop();
  
  movie2 = new Movie(this, "MarcoTBRMO.mp4"); 
  movie2.jump(8);
  movie2.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  cambio = 0.1;
  delta += cambio;
  transparencia = map(sin(delta),-1,1,0,255);
  background(255);
  tint(random(255),random(255),random(255));
  image(movie2,0,0);
  tint(255,transparencia);
  image(movie, 0, 0);
}

void keyPressed(){
  if (key == 'a'){
    movie.pause();
  }
  if (key == 's'){
    movie.loop();
  }
  if (key == 'd'){
    movie.jump(random(movie.duration()));
  }
}


void stopFrame(int f){
  movie.jump(f/30f);
  movie.pause();
}
