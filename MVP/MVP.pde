import Doll.java
setup(){
    size(500,500);
    doll = new Doll.doll();
    time = .1;
}

draw(){
    canvas.clear;
    draw.move(time)
    draw.render()
}
