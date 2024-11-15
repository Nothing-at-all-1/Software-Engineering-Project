import g4p_controls.*;

float scalingFactor = pow(10, -25);  //1 pixel is 10000km
float timeStep = 60;

ArrayList<CelestialObject> celestialObjects;

void reset() {
  celestialObjects = new ArrayList<CelestialObject> ();
<<<<<<< HEAD
  stars = new ArrayList<Star> ();
  planets = new ArrayList<Planet> ();
  celestialObjects.add(new Star(1.989 * pow(10, 30) * scalingFactor, 696340 * scalingFactor, new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));
  celestialObjects.add(new Planet(15 * pow (10, 26) * scalingFactor, 13 * scalingFactor, new PVector(random(0, width), random (0, height)), new PVector(0, 107000 * scalingFactor), new PVector(0, 0), color(255)));
=======

  celestialObjects.add(new Star(1.989 * pow(10, 26), 69.6340, new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));

>>>>>>> 6b24b73e727e0b161fca2b38aa4eba015013107c
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
    co.update();
  }
 
}
