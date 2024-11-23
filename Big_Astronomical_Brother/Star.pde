class Star extends CelestialObject{

  Star(String n, float m, float r, PVector p, PVector v, PVector a, color c, String type, float t){
    super(n, m, r, p, v, a, c, type);
    this.temp = t;
    this.visualScaling = 0.5;    //so you can see the planets easier
  }
  
  void display(){    //overriding the display method with the color change code
    float colorMod = norm(constrain(temp, 2000, 30000), 2000, 30000);    //this is just so it works for the normalize, it isn't technically accruate i guess?
    
    color blue = color(175, 201, 255);    //stolen rgb codes for this
    
    color yellow = color(255, 166, 81);
    
    color emission = lerpColor(yellow, blue, colorMod);
    
    this.col = emission;
    super.display();
  }
  
}
