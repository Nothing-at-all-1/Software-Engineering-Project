class CelestialObject {
  //fields that Asteroid, Star and Planet class also hold
  float mass, r;  
  PVector pos, vel, acc;
  color col;
  
  
  //Intializes the variables when it is created
  CelestialObject(float m, float r, PVector p, PVector v, PVector a, color c) {
    this.mass = m;
    this.r = r;
    this.pos = p;
    this.vel = v;
    this.acc = a;
    this.col = c;
  }
  
   void update() {
    vel.add(acc);
    pos.add(vel);
  }
  
  void gravity(){
    
  
  }
  
  void display() {
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }
  
}
