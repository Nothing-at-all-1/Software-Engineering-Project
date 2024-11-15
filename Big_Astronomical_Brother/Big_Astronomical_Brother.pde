import g4p_controls.*;

<<<<<<< Updated upstream
ArrayList<CelestialObject> celestialObjects;

float scalingRatio = 10000;  //1 pixel is 10000km
float timeStep = 60;

void reset() {
  celestialObjects = new ArrayList<> ();
  
  celestialObjects.add(new Star(1.989 * pow(10, 26), 69.6340, new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));
  
  celestialObjects.add(new Planet(5.972 * pow(10, 24), 6.3781, new PVector(width/2 + 200, height/2), new PVector(0,0), new PVector(0,0), color(0,0, 255)));

=======
ArrayList<Star> stars;
ArrayList<Planet> planets;

void reset() {
  stars = new ArrayList<Star> ();
  planets = new ArrayList<Planet> ();
  stars.add(new Star(1.989 * pow(10, 26), 69.6340, new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));
  planets.add(new Planet())
>>>>>>> Stashed changes
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
