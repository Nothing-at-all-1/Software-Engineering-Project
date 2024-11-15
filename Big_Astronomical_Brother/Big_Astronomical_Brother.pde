import g4p_controls.*;

float scalingRatio = 10000;  //1 pixel is 10000km
float timeStep = 60;

ArrayList<CelestialObject> celestialObjects;
ArrayList<Star> stars;
ArrayList<Planet> planets;

void reset() {
  celestialObjects = new ArrayList<CelestialObject> ();
  stars = new ArrayList<Star> ();
  planets = new ArrayList<Planet> ();
  stars.add(new Star(1.989 * pow(10, 26), 69.6340, new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));
  planets.add(new Planet());
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
