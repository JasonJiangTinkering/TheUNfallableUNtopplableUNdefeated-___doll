//set global variables
float time = 0;
Doll doll;
float frames_per_sec = 60;
  
void setup(){
    size(500, 500);//set processing settings
    frameRate(frames_per_sec);    
    fill(255);
 //initiate global variables
    doll = new Doll(width/2, height, height);
    doll.angle = PI;
}

void draw(){
    background(255);
    doll.move(1 / frames_per_sec);
    doll.render();
}
