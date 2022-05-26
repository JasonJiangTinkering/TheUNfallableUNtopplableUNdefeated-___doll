class Doll{
    // assume that for each degree the radius at that angle is the furthest point
    // assume that the radius is the same for all angles
    float radius = 5;

    // 0 : point straight up
    // - 90 : point right
    // 90 : point left
    float angle = 0;
    // where is the object compared to the 
    float object_x = 0;
    float object_y = radius;
    // how offset the center of mass is from the center point used to draw the object
    float offset_cx = 0;
    float offset_cy = 0;
    // assume rolling with no slipping 
    float angular_acceleration = 0;
    float angular_velocity = 0;
    float time = 0;
    // in kgs
    float mass = 10;
    // in m/s^2  
    float gravity = 9.81;
    
    Doll(float x, float y){
      this.object_x = x;
      this.object_y = y;
    }
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
        // draw the body
        //print("good try");
        push();
        rotate(angle);
        translate(object_x, object_y);
        strokeWeight(1);
        stroke(30);
        fill(0);
        System.out.printf("object x: %f, object y: %f\n", object_x, object_y);
        // because of assumtion of radius-- jcenter circle
        circle(object_x, object_y, radius);
        // for visualisation center triangle dummy
        float radius_y = radius * sin(angle);
        float radius_x = radius * cos(angle);
        float triy_bot = object_y - radius_y;
        float triy_top = object_y + radius_y;
        float trix_left = object_x - radius_x ;
        float trix_right = object_x + radius_x;
        triangle(object_x, triy_top, trix_left, triy_bot, trix_right, triy_bot);
        push();

        // draw the center of mass
        translate(offset_cx, offset_cy);
        circle(0, 0, 5);
        pop();
        pop();
    }
}
