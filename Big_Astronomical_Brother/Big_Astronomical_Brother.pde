import g4p_controls.*;

float scalingFactor = pow(10, -9);  
float timeStep = 60;

ArrayList<CelestialObject> celestialObjects;

JSONArray data;

PVector[] startingVelocities = {  //change these so it works or is accurate
  new PVector(1, -1),
  new PVector(0.75, -0.75),
  new PVector(0.66, -0.66),
  new PVector(0.5, -0.5),
  new PVector(0.5, -0.5),
  new PVector(0.5, -0.5),
  new PVector(0.5, -0.5),
  new PVector(0.5, -0.5),
  new PVector(0.5, -0.5)
};

void reset() {
  
  PVector center = new PVector (width/2, height/2);
  
  celestialObjects = new ArrayList<CelestialObject> () {{

    add(new Star(1.989 * pow(10, 30), 69.634, center, new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));
      
    for (int i = 0; i < 8; i++) {
      
      JSONObject selectedPlanet = data.getJSONObject(i);
      //String name = selectedPlanet.getString("name");
      float mass = selectedPlanet.getFloat("mass");
      float radius = selectedPlanet.getFloat("radius");
      PVector distance = PVector.add(center, new PVector(sqrt(pow(selectedPlanet.getFloat("distance"), 2)/2),sqrt(pow(selectedPlanet.getFloat("distance"), 2)/2)));
      
      JSONArray colorArray = selectedPlanet.getJSONArray("color"); 
      color planetColor = color(colorArray.getInt(0), colorArray.getInt(1), colorArray.getInt(2));
      
      
      add(new Planet(mass * pow(10, 24), radius, distance, startingVelocities[i], new PVector(0, 0), planetColor));
    
    }
    PVector asteroidPosition = new PVector(500, 300);  
    PVector asteroidVelocity = startingVelocities[8];  
    color asteroidColor = color(150, 150, 150);  
    
    add(new Asteroid(1.0 * pow(10, 12), 5, asteroidPosition, asteroidVelocity, new PVector(0, 0), asteroidColor));
    
  }};

}

void setup() {
  
  data = loadJSONArray("data.json");
  
  size(600, 600);
  //noLoop();
  createGUI();
  ratio.setText("1 year every " + round(15*60/timeStep * pow(10, 3))/pow(10, 3) + " seconds");
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

void mousePressed(){
  
  PVector spawnPos = new PVector(mouseX, mouseY); 

  switch (spawnedObject.getSelectedText()){
    case "Asteroid":

      float orbitalVel = random(-1, 1); 
      PVector asteroidVel = new PVector(0, orbitalVel); 
      color asteroidColor = color(150, 150, 150);  
      
      Asteroid newAsteroid = new Asteroid(1.0 * pow(10, 12), 1, spawnPos, asteroidVel, new PVector(0, 0), asteroidColor);
      
      celestialObjects.add(newAsteroid);
      break;
     case "Planet":
       break;
     case "Star":
       break;
  }

}
