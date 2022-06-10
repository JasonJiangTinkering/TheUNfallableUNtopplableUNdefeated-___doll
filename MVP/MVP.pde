//set global variables_
Doll doll;
float frames_per_sec = 60;
float exponential_decay_constant = .002/8;
UI ui;
// handles when non constant primative variables need to be set up in setup, and used in go 
Globals global = new Globals();
String status = "setup";
HScrollbar test;
void setup(){
  //testing scroll bar
    size(1500, 1000);//set processing settings
    global.platform_height = (float(height) * 2)/3;
    frameRate(frames_per_sec);
    fill(255);
 //initiate global variables
    ui = new UI(global.platform_height);
    doll = new Doll(width/2, global.platform_height, global.platform_height, exponential_decay_constant);
    ui.doll= doll; //<>//
    ui.draw_background(status); //<>//
}

void draw(){
    background(255); //<>//
    ui.draw(doll.time);
    
    if (status=="setup"){
      //print("setup");
      doll.test_held(); 
    }else{
      doll.move(4 / frames_per_sec); // doubled time to make it look pretty, omg we need to fix this later -- JASON XIAOSHEN DONT IGNORE THIS IT WILL BE THE END OF UR GRADES SADGE
    }
    doll.render();
    ui.draw_background(status);
    
    redraw();
    ////respond to all events
    for (int i=0; i < ui.events.size(); i++){
      switch (ui.events.get(i)){
        case "reset": //<>//
          doll.reset(width/2, global.platform_height, global.platform_height, exponential_decay_constant);
          status = "setup";
          println("Changing to setup");
          break;
        case "go":
          status = "go";
          println("Changing to go");
          break;
        case "pause": 
          status = "pause";

        default:
          println("Changing to None");
          break;
      }
    }
    // reset all events
    ui.reset_events();

}
void mouseClicked(){
  //println(mouseX + " "+ mouseY);
   ui.testClick();
}
