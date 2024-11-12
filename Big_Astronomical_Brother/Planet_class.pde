class Planet {
  float mass, r;
  PVector vel, pos, acc;
  color col;
  
  Planet(float m, float r, PVector v, PVector p, PVector a, color c) {
    this.mass = m;
    this.r = r;
    this.vel = v;
    this.pos = p;
    this.acc = a;
    this.col = c;
  }
  
  void display() {
    fill(this.col);
    circle(this.pos.x, this.pos.y, 2 * this.r);
    fill(0);
  }
}
