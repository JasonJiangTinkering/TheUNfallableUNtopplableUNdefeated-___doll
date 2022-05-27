class Doll{
    // assume that for each degree the radius at that angle is the furthest point
    // assume that the radius is the same for all angles
    float radius = 50;

    // pi/2 points straights up
    float angle = PI/2;
    // where is the object compared to the 
    float object_x;
    float object_y;
    float ground;
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
    Doll(float x, float y, float ground){
      this.object_x = x;
      this.object_y = y - radius;
      this.ground = ground;
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
        object_y = ground- radius;
    }
    //cm to point of contact
    float get_cm_radius(){
      return sqrt(pow(offset_cx, 2) + pow(radius - offset_cy, 2));
    }
      
    float calc_acceleration(){
        float g = 9.81;
        float cm_theta = PI/2 - angle;
        int neg = 1;
        if (PI/2 - cm_theta < 0){
          neg = -1;
          cm_theta *=-1;
        }
        float cm_r = get_cm_radius();
        return neg * g * sin(cm_theta)/cm_r;
    }
    
    void render(){
      // using circles to represent verticties + important points
        //move reference coordinates to body
        translate(object_x, object_y);
        push();
        rotate(angle - PI/2);
        
        // draw the body
        stroke(0);
        fill(126); //black center of object         
        circle(0, 0, radius * 2);
        
        triangle(-1 * radius, 0, 0, -3 *radius,radius, 0);

        push();

        // draw the center ofujm  mass
        translate(offset_cx, offset_cy);
        fill(255);
        circle(0, 0, 5);
        pop();
        pop();
    }
}
