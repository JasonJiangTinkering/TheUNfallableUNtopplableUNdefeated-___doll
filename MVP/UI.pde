class UI{
  float platform_height;
  HScrollbar hs1, hs2, hs3, hs4;
  
  Button play_pause;
  UI(float platform_height){
    this.platform_height = platform_height;
    hs1 = new HScrollbar(2*width /3, (height - platform_height) * .3 + platform_height, round(.25 * width), 16, 16);    
    hs2 = new HScrollbar(2*width /3, (height - platform_height) * .6 + platform_height, round(.25 * width), 16, 16);   
    
    hs3 = new HScrollbar(width /3, (height - platform_height) * .3 + platform_height, round(.25 * width), 16, 16);    
    hs4 = new HScrollbar(width /3, (height - platform_height) * .6 + platform_height, round(.25 * width), 16, 16);   
    //draw stop/play functions
    play_pause = new Button(150, 50);
    play_pause.normal = loadImage("play.png");
    play_pause.toggled = loadImage("pause.png");
  }
  void draw(float time){
    push();
    //draw platform
    fill(0);
    rect(0, platform_height, width, height);
    pop();
    
    //draw time
    fill(0);
    textSize(30);
    time = float(int(time * 1000))/1000;
    textAlign(LEFT,TOP);
    text(str(time), 0, 0);
    
    //draw sliders for variables
    hs1.update();
    hs1.display();
    hs2.update();
    hs2.display();    
    hs3.update();
    hs3.display();
    hs4.update();
    hs4.display();    
    play_pause.update();
  }
  void testClick(){
    play_pause.isPressed();
  }
  
  //void draw(float time){
    
}
