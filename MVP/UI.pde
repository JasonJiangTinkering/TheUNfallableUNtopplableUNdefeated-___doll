class UI{
  float platform_height;
  HScrollbar hs1;
  Button play_pause;
  UI(float platform_height){
    this.platform_height = platform_height;
    hs1 = new HScrollbar(0, height/2-8, width, 16, 16);    
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
    
    play_pause.update();
  }
  void testClick(){
    play_pause.isPressed();
  }
}
