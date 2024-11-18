class Planet extends CelestialObject{
  
  Planet(float m, float r, PVector p, PVector v, PVector a, color c, String t) {
    super(m, r, p, v, a, c, t);
    this.visualScaling = 10;
  }
}
