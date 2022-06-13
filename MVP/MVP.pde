//set global variables_
Doll doll;
float frames_per_sec = 60;
float exponential_decay_constant = .002/4;
UI ui;
boolean paused = true;
HScrollbar test;
PImage bg;
PImage body;
PImage head_1; 
PImage head_2;

void setup(){
  //testing scroll bar

    size(1300, 800);//set processing settings
    float platform_height = height * 21/30;


    //size(1500, 1000);//set processing settings
    //float platform_height = height * 2/3; //<>//
    frameRate(frames_per_sec); //<>//
    fill(255);
 //initiate global variables
    ui = new UI(platform_height);
    doll = new Doll(width/2, height * 2/3, platform_height, exponential_decay_constant); //<>//
    
 
    doll.angle = PI;
    doll.rollingFrictionConstant = exponential_decay_constant;
    bg = loadImage("sun.png");
    bg.resize(1300, 560);
    body = loadImage("panda.png");
    head_1 = loadImage("fine.png");
    head_2 = loadImage("notfine.png");
}

void draw(){
    background(255);
    image(bg, 0, 0);
    ui.draw(doll.time);
    
    if (paused){
      doll.test_held(); 
    }else{ //<>//
      doll.move(4 / frames_per_sec); // doubled time to make it look pretty, omg we need to fix this later -- JASON XIAOSHEN DONT IGNORE THIS IT WILL BE THE END OF UR GRADES SADGE
    }

    doll.render(body, head_1, head_2);
 
    
    ////respond to all events
    for (int i=0; i < ui.events.size(); i++){
      switch (ui.events.get(i)){
        case "pause":
          paused = true;
          println("pause");
          break;
        case "go":
          paused = false;
          println("go");
          break;
        default:
          println("None");
          break;
      }
    }
    // reset all events
    ui.reset_events();
    //println(mouseX +" , "+ mouseY);
}
void mouseClicked(){
  //println("click");
   ui.testClick();
}
