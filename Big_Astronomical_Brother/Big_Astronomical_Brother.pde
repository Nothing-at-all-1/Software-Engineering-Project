import g4p_controls.*;

Planet earth;

void setup() {
  size(600, 600);
  
  // Initial properties for the planet (mass, radius, position, velocity, acceleration, color)
  // These values are passed directly to the Planet constructor
    earth = new Planet(
    5.972f * pow(10, 24),  // Mass in kg (simulated)
    20,                     // Radius in pixels
    new PVector(width / 2, height / 2),  // Position at the center of the screen
    new PVector(0, 0),      // Initial velocity (at rest)
    new PVector(0, 0),      // Initial acceleration (no forces)
    color(0, 100, 255)      // Color (Earth-like blue)
  );
}
