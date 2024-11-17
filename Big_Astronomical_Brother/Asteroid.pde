class Asteroid extends CelestialObject{
  
  float verticies = random(3, 9);
  
  Asteroid(float m, float r, PVector p, PVector v, PVector a, color c){
    super(m, r, p, v, a, c);
    visualScaling = 1;
  }

  void display() {
    fill(col);
    noStroke();
    beginShape();
    for (float i = 0; i<verticies; i++){
      float angle = i * TWO_PI * verticies;
      curveVertex(pos.x + sin(angle)*r, pos.y + cos(angle)*r);
    }
    endShape();
  }

}
