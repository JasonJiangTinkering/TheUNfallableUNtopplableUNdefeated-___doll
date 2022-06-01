class UI{
  float platform_height;
  UI(float platform_height){
    this.platform_height = platform_height;
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
  }
}
