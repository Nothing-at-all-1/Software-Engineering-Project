class CelestialObject {
  //fields that Asteroid, Star and Planet class also hold
  float mass, radius, visualScaling, strokeWeight, temp;  
  PVector pos, vel, acc;
  color col;
  String type, name;

  //Intializes the variables when it is created
  CelestialObject(String n, float m, float r, PVector p, PVector v, PVector a, color c, String t) {
    this.name = n;
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
    pos.add(vel);    //basic physics right
    acc.setMag(0);    //you have to reset the acceleration since it is different every time
    
    for (CelestialObject other : celestialObjects){
      
      if (other != this){    //doesn't collide with self
        
        float g = 6.6743 * pow(10, -11);    //gravitational constant
        
        PVector difference = PVector.sub(this.pos, other.pos);
        
        float dist = difference.mag();
        
        float a = -g * other.mass / pow(dist / scalingFactor, 2);    //gravity force (acceleration)
        
        PVector direction = difference.normalize();
        
        if (dist < other.radius * other.visualScaling + this.radius * this.visualScaling){
          
          switch (this.type) {
            
            case "solid":
              
              if (other.type =="solid"){    //collisions only happen when both are solid
              
                float overlap = other.radius * other.visualScaling + this.radius * this.visualScaling - dist; //check
   
                PVector adj = PVector.mult(direction, overlap / 2f);
                
                this.pos.add(adj);
                other.pos.sub(adj);    //prevent overlap
                
                float normal = difference.dot(direction);    
                
                if (normal < 0) {    
                  //hit and stick collision formula
                  float impulse = (2 * normal) / (this.mass + other.mass);
            
                  this.vel.sub(PVector.mult(direction, impulse * other.mass));
                  other.vel.add(PVector.mult(direction, impulse * this.mass));    //collisions depend on mass
                
                }
                
              }
                        
              break;
              
            case "gas":
  
              if (mass >= other.mass){
                float massRatio = (mass+other.mass)/mass;;
                mass += other.mass;
                other.mass = 0;
                other.radius = 0;
                deleteCache.add(other);    //deleteing
                this.radius *= pow(massRatio, 0.8);
                this.temp *= sqrt((this.temp + other.temp)/this.temp);    //formula for the sun color
              }
              break;
            
          }
        }
        
        acc.add(direction.mult(a));    //adding gravity
        
      }
    }
  }
  
  void display() {
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, radius * 2*visualScaling, radius * 2*visualScaling);
  }
    
}
