class Star extends CelestialObject{
  
  //add temp as a field for this subclass only
  float temp;

  Star(String n, float m, float r, PVector p, PVector v, PVector a, color c, String type, float t){
    super(n, m, r, p, v, a, c, type);
    this.temp = t;
    float colorMod = norm(constrain(temp, 2000, 30000), 2000, 30000);
    
    color blue = color(175, 201, 255);
    
    color yellow = color(255, 166, 81);
    
    color emission = lerpColor(yellow, blue, colorMod);
    
    this.col = emission;
    
    this.visualScaling = 0.5;
  }
  
}
