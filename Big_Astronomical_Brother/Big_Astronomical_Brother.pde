import g4p_controls.*;

float scalingRatio = 10000;  //1 pixel is 10000km
float timeStep = 60;

ArrayList<CelestialObject> celestialObjects;

void reset() {
  celestialObjects = new ArrayList<CelestialObject> ();

  celestialObjects.add(new Star(1.989 * pow(10, 26), 69.6340, new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));

}

void setup() {
  size(600, 600);
  //noLoop();
  reset();
}

void draw() {
  background(0);
  frameRate(timeStep);

  for (CelestialObject co : celestialObjects) {
    co.display();
    //co.update();
  }
 
}
