class Graph{
  // needs access to doll, doll doesnt need access to graph
  float time_elapsed = 0;
  ArrayList<Float> values;
  ArrayList<Float> times;
  float max_value = 0;
  float margin = 5;
  float plot_size = 2;
  color plotColor;
  String title;
  
  Graph(String title, color plotColor){
    values = new ArrayList<Float>();
    times = new ArrayList <Float>();
    this.title = title;
    this.plotColor = plotColor;
  }
  
  void plot(float value, float delta_time){
    values.add(value);
    times.add(delta_time);
  }
  void render(float x1, float y1, float x2, float y2){
    push();
    //fill background with grey
    fill(125);
    rectMode(CORNERS);
    rect(x1, y1, x2, y2);
    //fill center with white
    fill(225);
    x1 += margin;
    y1 += margin;
    x2 -= margin;
    y2 -= margin;
    rect(x1, y1, x2, y2);
    // create + display scale
    
    //draw points
    
    pop();
  }
}
