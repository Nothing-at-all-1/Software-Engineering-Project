class Asteroid extends CelestialObject{
  
  float verticies = random(9, 12);
  
  Asteroid(String n, float m, float r, PVector p, PVector v, PVector a, color c, String t){
    super(n, m, r, p, v, a, c, t);
    visualScaling = 1;
  }

  void display() {
    fill(col);
    noStroke();
    beginShape();
    for (float i = 0; i < verticies; i++){
      float angle = i * PI * verticies;
      curveVertex(pos.x + sin(angle) * radius, pos.y + cos(angle) * radius);
    }
    endShape();
  }

}
