import g4p_controls.*;

float scalingFactor = pow(10, -9);  //1 pixel is 10000km
float timeStep = 60;

ArrayList<CelestialObject> celestialObjects;

void reset() {
  celestialObjects = new ArrayList<CelestialObject> ();

  celestialObjects.add(new Star(1.989 * pow(10, 30), 69.634 , new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));
  celestialObjects.add(new Planet(5.972 * pow (10, 24), 0.6378, new PVector(100, 100), new PVector(0.5, 0), new PVector(0, 0), color(255)));
 
}

void setup() {
  size(600, 600);
  //noLoop();
  //frameRate(1);
  reset();
}

void draw() {
  background(0);
  frameRate(timeStep);

  for (CelestialObject co : celestialObjects) {
    co.display();
    co.update();
  }
 
}
