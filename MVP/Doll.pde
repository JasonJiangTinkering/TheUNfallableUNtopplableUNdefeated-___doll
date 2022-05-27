class Doll{
    // assume that for each degree the radius at that angle is the furthest point
    // assume that the radius is the same for all angles
    float radius = 50;

    // pi/2 points straights up
    float angle = PI/2;
    // where is the object compared to the 
    float object_x = 0;
    float object_y = radius;
    // how offset the center of mass is from the center point used to draw the object
    float offset_cx = 0;
    float offset_cy = radius / 2;
    // assume rolling with no slipping 
    float angular_acceleration = 0;
    float angular_velocity = 0;
    float time = 0;
    // in kgs
    float mass = 10;
    // in m/s^2  
    float gravity = 9.81;
    
//coordinate of the point on the doll that the doll will rest on
    Doll(float x, float y){
      this.object_x = x;
      this.object_y = y - radius;
    }
    
    //takes in a value from 0 - 90
    void set_angle(float angle){
        this.angle = angle;
    }
    
    void move(float t){
        time += t;
        angular_acceleration = calc_acceleration();
        angular_velocity += t * angular_acceleration;
        float delta_angle = t * angular_velocity;
        angle += delta_angle;
        // calc change in x
        int neg = 1;
        if (angle < 0){
            neg = -1;
        }
        object_x += neg * radius * delta_angle;
        // set new y
        object_y = radius;
    }
    float calc_acceleration(){
        float r0 = radius;
        float r_cmass = radius * sin(angle);
        return (mass * gravity * sin(acos(r0/r_cmass)))/(r_cmass);
    }
    
    void render(){
      // using circles to represent verticties + important points
        //move reference coordinates to body
        push();
        rotate(angle);
        translate(object_x, object_y);
        // draw the body
        stroke(0);
        fill(126); //black center of object         
        circle(0, 0, 10);
        System.out.printf("object_x %f, object_y %f, angle %f\n", object_x, object_y, angle);
   
        float highestPointX = radius * cos(angle); // relitive X distance from center of object to top of object
        float highestPointY = radius * sin(angle); // relitive y distance from center of object to top of object
        
        circle(highestPointX, highestPointY, radius);
        System.out.printf("tritop_x %f, tritop_y %f, radius %f \n", highestPointY, highestPointX, radius);
        
        //circle(tritop_x, tritop_y, radius);
        
        //System.out.printf("trix_top: %f, triy_top: %f, trix_left: %f, triy_bot: %f, trix_right: %f, triy_bot: %f");
        //triangle(trix_, triy_top, trix_left, triy_bot, trix_right, triy_bot);
        push();

        // draw the center ofujm  mass
        translate(offset_cx, offset_cy);
        circle(0, 0, 5);
        pop();
        pop();
    }
}
