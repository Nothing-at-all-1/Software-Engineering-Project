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
        
        float dist = PVector.sub(this.pos, other.pos).mag();
        
        float a = g * other.mass / pow(dist / scalingFactor, 2);
        
        PVector direction = PVector.sub(other.pos, pos).normalize();

        
        if (dist < other.radius * other.visualScaling + this.radius * this.visualScaling){
          
          switch (type){
            case "solid":
              if (other.type == "solid"){
              checkCollision(other);
            }

              
                
            
                //PVector kS = PVector.mult(direction, vel.dot(direction) - other.vel.dot(direction)).mult(pow(10, -6));
                //this.vel.add(kS);
                //other.vel.sub(kS);
                
                //float overlap = this.r*this.visualScaling + other.r*other.visualScaling - PVector.dist(this.pos, other.pos);
                
                //PVector correction = PVector.mult(direction, overlap/2f);
                
                //this.pos.add(correction); 
                //other.pos.sub(correction);
                
              
              
              break;
              
            case "gas":

              if (mass > other.mass){
                mass += other.mass;
                other.mass = 0;
                other.radius = 0;
              }
              break;
          }
          
        }
        
        vel.add(direction.mult(a));
        
        acc.add(direction.mult(a));

      }
    }
  }
  void checkCollision(CelestialObject other) {
  float overlap = (other.radius * other.visualScaling + this.radius * this.visualScaling) - PVector.dist(this.pos, other.pos); //check

  if (overlap > 0) { // check if distance is greater
    PVector adj = PVector.mult(PVector.sub(this.pos, other.pos).normalize(), overlap / 2.0);
    this.pos.add(adj);
    other.pos.sub(adj);

    PVector relativeVel = PVector.sub(this.vel, other.vel);
    float normalVel = relativeVel.dot(PVector.sub(this.pos, other.pos).normalize());

    
    if (normalVel < 0) {
      //hit and stick collision formula
      float impulse = (2 * normalVel) / (this.mass + other.mass);

      this.vel.sub(PVector.mult(PVector.sub(this.pos, other.pos).normalize(), impulse * other.mass));
      other.vel.add(PVector.mult(PVector.sub(this.pos, other.pos).normalize(), impulse * this.mass));
    }
  }
  }
  
  void display() {
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, radius * 2*visualScaling, radius * 2*visualScaling);
  }
  
}
