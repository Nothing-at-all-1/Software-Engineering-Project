import g4p_controls.*;

<<<<<<< Updated upstream
Planet earth;
ArrayList<CelestialObject> celestialObjects;
=======
ArrayList<Star> stars;
>>>>>>> Stashed changes

void reset() {
  stars = new ArrayList<Star> ();
  stars.add(new Star(1.989 * pow(10, 26), 69.6340, new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));
}

void setup() {
  size(600, 600);
  
    //5.972f * pow(10, 24),  // Mass in kg (simulated)
    //color(0, 100, 255)      // Color (Earth-like blue)
  reset();
}

void draw() {
  background(0);
  
  for (Star s : stars) {
    s.display();
  }
}
