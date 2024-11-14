class CelestialObject {
  float mass, r;
  PVector pos, vel, acc;
  color col;
  
  CelestialObject(float m, float r, PVector p, PVector v, PVector a, color c) {
    this.mass = m;
    this.r = r;
    this.pos = p;
    this.vel = v;
    this.acc = a;
    this.col = c;
  }
  
  void display() {
    fill(this.col);
    circle(this.pos.x, this.pos.y, 2 * this.r);
    fill(0);
  }
}
