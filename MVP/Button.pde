/**
 * Button. 
 * 
 * Click on one of the colored shapes in the 
 * center of the image to change the color of 
 * the background. 
 */
 
class Button{
  int circleX, circleY;  // Position of circle button
  int circleSize;   // Diameter of circle
  int pictureSize;
  color circleColor = color(106);
  color circleHighlight = color(50);
  boolean circleOver = false;
  boolean toggle = false;
  PImage normal;
  PImage toggled;
  String normalEvent; // event when normal button is pressed
  String toggleEvent; // event when toggled button is pressed
  

  
   Button(int x, int y, int r){
    size(640, 360);
    circleX = x;
    circleY = y;
    circleSize = r;
    pictureSize  = round(circleSize * .8 * pow(2, .5));
  }
  Button(int x, int y){
    circleX = x;
    circleY = y;
    circleSize = 93;
    pictureSize = round(circleSize * .8 * pow(2, .5));
  }
  Button(int x, int y, String normalEvent, String toggleEvent){
    circleX = x;
    circleY = y;
    circleSize = 93;
    this.normalEvent = normalEvent; // event when normal button is pressed
    this.toggleEvent = toggleEvent; // event when toggled button is pressed
    pictureSize = round(circleSize * .8 * pow(2, .5));
  }
  Button(String displayMode, int x, int y, String normalEvent, String toggleEvent){
    circleSize = 93;
    if (displayMode == "NE"){
      circleX = x - circleSize/2;
      circleY = y + circleSize/2;
    }
    this.normalEvent = normalEvent; // event when normal button is pressed
    this.toggleEvent = toggleEvent; // event when toggled button is pressed
    pictureSize = round(circleSize * .8 * pow(2, .5));
  }
  Button(String displayMode, int x, int y, String normalEvent, String toggleEvent, int margin){
    circleSize = 93;
    int changeRadius = margin + circleSize/2;
    if (displayMode == "NE"){
      circleX = x - changeRadius;
      circleY = y + changeRadius;
    }
    this.normalEvent = normalEvent; // event when normal button is pressed
    this.toggleEvent = toggleEvent; // event when toggled button is pressed
    pictureSize = round(circleSize * .8 * pow(2, .5));
  }
  void update() { //test if mouse is over + draws the screen // maybe should seperate if lag 
  
     push();
     if (dist(mouseX, mouseY, circleX, circleY) < circleSize/2){
       circleOver = true;
       fill(circleHighlight);
      }else{
        circleOver = false;
        fill(circleColor);
      }
     ellipseMode(CENTER);
     imageMode(CENTER);
     circle(circleX, circleY, circleSize);
     push();
     translate(circleX, circleY);
     if (!toggle){
       //play normal
       image(normal,0,0, pictureSize,pictureSize);
     }
     else{
       //pause toggled
       image(toggled,0,0, pictureSize,pictureSize);
     }
     pop();
     pop();
  }
  
  void isPressed(StringList events){
    if (circleOver){
      //print(circleOver);
      toggle = !toggle;
        if (toggle){
      // go
        events.append(normalEvent);
      }else {
        events.append(toggleEvent);
      }
    }

  }
    
}
