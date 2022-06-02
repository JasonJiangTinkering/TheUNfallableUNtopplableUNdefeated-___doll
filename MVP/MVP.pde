//set global variables
Doll doll;
float frames_per_sec = 60;
float exponential_decay_constant = .002/8;
UI ui;
HScrollbar test;
void setup(){
  //testing scroll bar
    
    size(1500, 1000);//set processing settings
    float platform_height = height * 2/3;

    frameRate(frames_per_sec);
    fill(255);
 //initiate global variables
    doll = new Doll(width/2, height, platform_height, exponential_decay_constant);
    ui = new UI(platform_height);
    doll.angle = PI;
    doll.rollingFrictionConstant = exponential_decay_constant;
}

void draw(){
    float timePerFrame = 1 / frames_per_sec;
    timePerFrame *= 2;// doubled time to make it look pretty, omg we need to fix this later -- JASON XIAOSHEN DONT IGNORE THIS IT WILL BE THE END OF UR GRADES SADGE
    background(255);
    ui.draw(doll.time);
    doll.test_held();
    doll.move(timePerFrame);
    doll.render();
 
}
