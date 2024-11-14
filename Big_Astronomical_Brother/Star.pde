class Star extends CelestialObject{
  
  float temp;

  Star(float m, float r, PVector p, PVector v, PVector a, color c, float t){
    super(m, r, p, v, a, c);
    this.temp = t;
  
    float colorMod = norm(temp, 2000, 30000);
    
    color blue = color(175, 201, 255);
    
    color yellow = color(255, 166, 81);
    
    color emission = lerpColor(yellow, blue, colorMod);
    
    this.col = emission;
  }

}
