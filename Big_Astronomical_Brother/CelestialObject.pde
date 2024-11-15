class CelestialObject {
  //fields that Asteroid, Star and Planet class also hold
  float mass, r;  
  PVector pos, vel, acc;
  color col;
  float visualScaling;
  
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
    vel.add(PVector.div(acc, timeStep/100));
    pos.add(PVector.div(vel, timeStep/100));
    acc.setMag(0);
    
    for (CelestialObject other : celestialObjects){
      if (other != this){
        float g = 6.6743 * pow(10, -11);
        
        float distSq = PVector.sub(this.pos, other.pos).magSq() / pow(scalingFactor, 2);  //this is technically what we should be using,
        //but at our current scaling factor this would be like 14.7 thousand pixels offscreen so it doesn't work
        
        //float dist = 14798; 
        
        //float angle = PVector.sub(this.pos, other.pos).heading();
        
        float a = g * other.mass / distSq;
       
        
        
      //  float distance = dist(pos.x, pos.y, other.pos.x, other.pos.y) - this.r - other.r;
      
      //  if (distance <= 0) {
      //  distance = 1;  // Minimum distance to avoid infinite force (this is a safeguard)
      //}
      //  float F = (g * this.mass * mass) / pow(distance, 2);
        
        PVector direction = PVector.sub(other.pos, pos);  
        direction.normalize();
        
        acc.add(direction.mult(a));
        
        
        
        //vel.add(new PVector(sin(angle)*F, cos(angle)*F));
        
        println(sqrt(distSq));
        println(a);
        println(pos);
      }
    }
    
  }
  
  void display() {
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, r * 2*visualScaling, r * 2*visualScaling);
  }
  
}
