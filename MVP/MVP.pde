//set global variables
Doll doll;
float frames_per_sec = 60;
float exponential_decay_constant = .002/4;
UI ui;
HScrollbar test;
PImage bg;
PImage body;
PImage head_1; 
PImage head_2;

void setup(){
  //testing scroll bar
    
<<<<<<< HEAD
    size(1300, 800);//set processing settings
    float platform_height = height * 21/30;

=======
    size(1500, 1000);//set processing settings
    float platform_height = height * 2/3;
>>>>>>> d592536b73a7bedeaaeec2a98d101093231fc487
    frameRate(frames_per_sec);
    fill(255);
 //initiate global variables
    doll = new Doll(width/2, height, platform_height, exponential_decay_constant);
    ui = new UI(platform_height);
    doll.angle = PI;
    doll.rollingFrictionConstant = exponential_decay_constant;
    bg = loadImage("sun.png");
    bg.resize(1300, 560);
    body = loadImage("panda.png");
    head_1 = loadImage("fine.png");
    head_2 = loadImage("notfine.png");
}

void draw(){
    float timePerFrame = 1 / frames_per_sec;
    timePerFrame *= 2;// doubled time to make it look pretty, omg we need to fix this later -- JASON XIAOSHEN DONT IGNORE THIS IT WILL BE THE END OF UR GRADES SADGE
    background(255);
    image(bg, 0, 0);
    ui.draw(doll.time);
    doll.test_held();
    doll.move(4 / frames_per_sec);
<<<<<<< HEAD
    doll.render(body, head_1, head_2);
 
=======
    doll.render();
    //println(mouseX +" , "+ mouseY);
}
void mouseClicked(){
  //println("click");
   ui.testClick();
>>>>>>> d592536b73a7bedeaaeec2a98d101093231fc487
}
