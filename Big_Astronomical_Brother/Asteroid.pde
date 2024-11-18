class Asteroid extends CelestialObject{
  
  float verticies = random(3, 9);
  
  Asteroid(float m, float r, PVector p, PVector v, PVector a, color c, String t){
    super(m, r, p, v, a, c, t);
    visualScaling = 1;
  }

  void display() {
    fill(col);
    noStroke();
    beginShape();
    for (float i = 0; i<verticies; i++){
      float angle = i * PI * verticies;
      curveVertex(pos.x + sin(angle)*r, pos.y + cos(angle)*r);
    }
    endShape();
  }

}
