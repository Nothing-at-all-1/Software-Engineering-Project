import g4p_controls.*;

ArrayList<CelestialObject> celestialObjects;

float scalingRatio = 10000;  //1 pixel is 10000km
float timeStep = 60;

void reset() {
  celestialObjects = new ArrayList<> ();
  
  celestialObjects.add(new Star(1.989 * pow(10, 26), 69.6340, new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));
  
  celestialObjects.add(new Planet(5.972 * pow(10, 24), 6.3781, new PVector(width/2 + 200, height/2), new PVector(0,0), new PVector(0,0), color(0,0, 255)));

}

void setup() {
  size(600, 600);
  //noLoop();
  reset();
}

void draw() {
  background(0);
  frameRate(timeStep);

  for (CelestialObject obj : celestialObjects) {
    obj.display();
    //obj.update();
  }
 
}
