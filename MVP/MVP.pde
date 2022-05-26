//set global variables
float time = 0;
Doll doll;
float frames_per_sec = 60;
  
    int s_width = 500;
    int s_height = 500;
void setup(){
    size(s_width, s_height);//set processing settings
    frameRate(frames_per_sec);
    fill(255);
 //initiate global variables
    doll = new Doll(s_width/2, s_height/2);
}

void draw(){
    background(255);
    //doll.move(1 / frames_per_sec);
    doll.render();
    
}
