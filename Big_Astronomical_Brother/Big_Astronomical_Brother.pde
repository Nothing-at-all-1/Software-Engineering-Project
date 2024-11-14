import g4p_controls.*;

ArrayList<Star> stars;
ArrayList<Planet> planets;

void reset() {
  stars = new ArrayList<Star> ();
  stars.add(new Star(1.989 * pow(10, 26), 69.6340, new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));
  
  planets = new ArrayList<Planet> ();
  planets.add(new Planet(5.972 * pow(10, 24), 30, new PVector(width/2 + 200, height/2), new PVector(0,0), new PVector(0,0), color(0,0, 255)));
  
}

void setup() {
  size(600, 600);

  reset();
}

void draw() {
  background(0);
  
  for (Star s : stars) {
    s.display();
  }
  
  for (Planet p : planets) {
    p.display();
  }
}
