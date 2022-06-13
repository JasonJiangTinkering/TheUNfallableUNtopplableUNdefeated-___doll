//set global variables_
Doll doll;
float frames_per_sec = 60;
float exponential_decay_constant = .002/4;
UI ui;
// handles when non constant primative variables need to be set up in setup, and used in go 
Globals global;
String status = "setup";
HScrollbar test;
PImage bg;
PImage body;
PImage head_1; 
PImage head_2;

void setup(){
  //testing scroll bar
    fullScreen();
    global = new Globals(); 
    
    global.platform_height = (float(height) * 2)/3;

    frameRate(frames_per_sec);
    fill(255);
 //initiate global variables
    doll = new Doll(width/2, height, global.platform_height, exponential_decay_constant);
    ui = new UI(global.platform_height, doll);
    doll.angle = PI;
    doll.rollingFrictionConstant = exponential_decay_constant;
    bg = loadImage("sun.png");
    bg.resize(1300, 560);
    body = loadImage("panda.png");
    head_1 = loadImage("fine.png"); //<>//
    head_2 = loadImage("notfine.png"); //<>//
    image(bg, 0, 0);

    //size(1500, 1000);//had some issues with screen displaying

    frameRate(frames_per_sec); //<>//
    fill(255);
 //initiate global variables
    
    doll = new Doll(width/2, global.platform_height, global.platform_height, exponential_decay_constant);
    ui = new UI(global.platform_height, doll);
    doll.ui = ui; //<>//
    ui.draw_background(status); //<>//
}

void draw(){
    fill(255);
    //ui.draw_background(status); //<>//
    ui.draw(doll.time);
    
    if (status=="setup"){
      //print("setup");
      doll.test_held(); 
    }else{
      float time_passed = 4 / frames_per_sec; //<>//
      doll.move(time_passed); 
      ui.draw_go(time_passed);
    }
    ui.draw_background(status);
    doll.render(body, head_1, head_2);
    
    
    redraw();
    ////respond to all events
    for (int i=0; i < ui.events.size(); i++){
      switch (ui.events.get(i)){
        case "reset": //<>//
          doll.reset(width/2, global.platform_height, global.platform_height);
          status = "setup";
          ui.setup_reset();
          println("Changing to setup");
          break;
        case "go":
          status = "go";
          println("Changing to go");
          break;
        case "pause": 
          status = "pause";
        case "exit":
          exit();
        default:
          println("Changing to None");
          break;
      }
    }
    // reset all events
    ui.reset_events();

}
void mouseClicked(){
  println(mouseX + " "+ mouseY);
   ui.testClick();
}
