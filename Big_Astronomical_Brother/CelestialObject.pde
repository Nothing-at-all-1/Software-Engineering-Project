class CelestialObject {
  //fields that Asteroid, Star and Planet class also hold
  float mass, radius, visualScaling;  
  PVector pos, vel, acc;
  color col;
  String type;
  //Intializes the variables when it is created
  CelestialObject(float m, float r, PVector p, PVector v, PVector a, color c, String t) {
    this.mass = m;
    this.radius = r;
    this.pos = p;
    this.vel = v;
    this.acc = a;
    this.col = c;
    this.type = t;
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.setMag(0);
    
    for (CelestialObject other : celestialObjects){
      if (other != this){
        float g = 6.6743 * pow(10, -11);
        
        PVector difference = PVector.sub(this.pos, other.pos);
        
        float dist = difference.mag();
        
        float a = -g * other.mass / pow(dist / scalingFactor, 2);
        
        PVector direction = difference.normalize();
        
        acc.add(direction.mult(a));
        
        if (dist < other.radius * other.visualScaling + this.radius * this.visualScaling){
          
          switch (this.type) {
            case "solid":
            
              if (other.type == "solid"){
              
                float overlap = other.radius * other.visualScaling + this.radius * this.visualScaling - dist; //check
   
                PVector adj = PVector.mult(direction, overlap / 2f);
                
                this.pos.add(adj);
                other.pos.sub(adj);
                
                float normal = difference.dot(direction);
                
                if (normal < 0) {
                  //hit and stick collision formula
                  float impulse = (2 * normal) / (this.mass + other.mass);
            
                  this.vel.sub(PVector.mult(direction, impulse * other.mass));
                  other.vel.add(PVector.mult(direction, impulse * this.mass));
                
                }
                
              }
            
                        
              break;
              
            case "gas":
              float overlap = other.radius * other.visualScaling + this.radius * this.visualScaling - dist; //check
 
              PVector adj = PVector.mult(direction, overlap / 2f);
              
              this.pos.add(adj);
              other.pos.sub(adj);
              
              float normal = difference.dot(direction);
              
              if (normal < 0) {
                //hit and stick collision formula
                float impulse = (2 * normal) / (this.mass + other.mass);
          
                this.vel.sub(PVector.mult(direction, impulse * other.mass));
                other.vel.add(PVector.mult(direction, impulse * this.mass));
              
              }
              if (mass >= other.mass){
                float massRatio = (mass+other.mass)/mass;;
                mass += other.mass;
                other.mass = 0;
                other.radius = floor(other.radius/1.1);
                deleteCache.add(other);
                this.radius *= pow(massRatio, 0.8);
              }
              break;
          }
          
        }
      }
    }
  }
  
  void display() {
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, radius * 2*visualScaling, radius * 2*visualScaling);
  }
  
}
