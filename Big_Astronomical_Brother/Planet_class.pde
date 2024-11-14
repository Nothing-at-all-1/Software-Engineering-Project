class Planet extends CelestialObject{
  
  Planet(float m, float r, PVector p, PVector v, PVector a, color c) {
    super(m, r, p, v, a, c);
  }

  


void draw() {
  background(0);
  
  // Update and display the planet
  earth.update();
  earth.display();
}
  
  
}
