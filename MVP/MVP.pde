import Doll;
float time = .1;
Doll doll = null;
float frames_per_sec = 60;

void setup(){
    size(500,500);
    frameRate(60);
    doll = new Doll();
}

void draw(){
    background(255);
    doll.move(1/frames_per_sec);
    doll.render();
}
