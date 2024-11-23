class Planet extends CelestialObject{
  
  Planet(String n, float m, float r, PVector p, PVector v, PVector a, color c, String t) {
    super(n, m, r, p, v, a, c, t);
    this.visualScaling = 10;
  }
}
