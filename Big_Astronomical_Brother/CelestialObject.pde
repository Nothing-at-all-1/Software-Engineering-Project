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
    
    for (CelestialObject other : celestialObjects){
      if (other != this){
        float g = 6.6743 * pow(10, -11);
        
        //float dist = dist(other.pos.x+other.r, other.pos.y+other.r, pos.x+r, pos.y+r);  //this is technically what we should be using,
        //but at our current scaling factor this would be like 14.7 thousand pixels offscreen so it doesn't work
        
        float dist = 14798; 
        
        float angle = PVector.sub(this.pos, other.pos).heading();
        
        float F = (g * this.mass * other.mass) / pow(dist + this.r + other.r, 2);
        
        
        
        vel.add(new PVector(sin(angle)*F, cos(angle)*F));
        
        println(F);
      }
    }
    
  }
  
  void display() {
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }
  
}
