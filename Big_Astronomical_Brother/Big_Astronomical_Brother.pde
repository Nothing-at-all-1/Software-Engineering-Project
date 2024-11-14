import g4p_controls.*;

Planet earth;
ArrayList<CelestialObject> celestialObjects;

void reset() {
  celestialObjects = new ArrayList<CelestialObject> ();
  celestialObjects.add(new CelestialObject(1.989 * pow(10, 26), 69.6340, new PVector(random(0, width), random(0, height)), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0)));
}

void setup() {
  size(600, 600);
  
    //5.972f * pow(10, 24),  // Mass in kg (simulated)
    //color(0, 100, 255)      // Color (Earth-like blue)
  reset();
}

void draw() {
  background(0);
  
  for (CelestialObject co : celestialObjects) {
    co.display();
  }
}
