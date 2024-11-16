class CelestialObject {
  //fields that Asteroid, Star and Planet class also hold
  float mass, r, visualScaling;;  
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
  
  float mapped(float p){
    return map(p, 0, width, 0, pow(scalingFactor, -1));
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.setMag(0);
    
    for (CelestialObject other : celestialObjects){
      if (other != this){
        float g = 6.6743 * pow(10, -11);
        
        float distSq = pow(PVector.sub(this.pos, other.pos).mag() / scalingFactor, 2); 
        
        float a = g * other.mass / distSq;
        
        PVector direction = PVector.sub(other.pos, pos);  
        direction.normalize();
        
        vel.add(direction.mult(a));
        
        acc.add(direction.mult(a));

      }
    }
    
  }
  
  void display() {
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, r * 2*visualScaling, r * 2*visualScaling);
  }
  
}
