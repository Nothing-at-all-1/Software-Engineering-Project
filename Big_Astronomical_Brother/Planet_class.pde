class Planet extends CelestialObject{
  
  Planet(String n, float m, float r, PVector p, PVector v, PVector a, color c) {
    super(n, m, r, p, v, a, c);
    this.visualScaling = 10;
  }
}
