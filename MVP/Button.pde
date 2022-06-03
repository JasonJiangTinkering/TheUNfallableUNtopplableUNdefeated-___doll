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
  
  Button(int x, int y){
    circleX = x;
    circleY = y;
    circleSize = 93;
    pictureSize = round(circleSize * .8 * pow(2, .5));
  }
  
   Button(int x, int y, int r){
    size(640, 360);
    circleX = x;
    circleY = y;
    circleSize = r;
    pictureSize  = round(circleSize * .8 * pow(2, .5));
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
     //println("center: " + circleX  + " + " + circleY);
     circle(circleX, circleY, circleSize);
     //println(circleOver);
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
  void isPressed(){
    if (circleOver){
      print(circleOver);
      toggle = !toggle;
    }
  }
    
}
