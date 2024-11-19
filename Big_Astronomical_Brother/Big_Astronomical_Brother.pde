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
  
  data = loadJSONArray("data.json");
  PVector center = new PVector (width/2, height/2);
  
  celestialObjects = new ArrayList<CelestialObject> () {{

    add(new Star(1.989 * pow(10, 30), 69.634, center, new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), "gas", 5600));
      
    for (int i = 0; i < 8; i++) {
      
      JSONObject selectedPlanet = data.getJSONObject(i);
      //String name = selectedPlanet.getString("name");
      float mass = selectedPlanet.getFloat("mass");
      float radius = selectedPlanet.getFloat("radius");
      PVector distance = PVector.add(center, new PVector(sqrt(pow(selectedPlanet.getFloat("distance"), 2)/2),sqrt(pow(selectedPlanet.getFloat("distance"), 2)/2)));
      
      JSONArray colorArray = selectedPlanet.getJSONArray("color"); 
      color planetColor = color(colorArray.getInt(0), colorArray.getInt(1), colorArray.getInt(2));
      
      String type = selectedPlanet.getString("type");
      
      add(new Planet(mass * pow(10, 24), radius, distance, startingVelocities[i], new PVector(0, 0), planetColor, type));
    
    }
    
  }};

}

void setup() {
  
  
  
  size(600, 600);
  //noLoop();
  createGUI();
  timeRatio.setText("1 year every " + round(15*60/timeStep * pow(10, 3))/pow(10, 3) + " seconds");
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
  float spawnRadius = radius.getValueF();
  PVector vel = new PVector( velocity.getValueXF(), velocity.getValueYF());
  float mass = spawnMass.getValueF();

  switch (spawnedObject.getSelectedText()){
    case "Asteroid":
      color asteroidColor = color(150, 150, 150);  
      celestialObjects.add(new Asteroid(mass * pow(10, 12), spawnRadius, spawnPos, vel, new PVector(0, 0), asteroidColor, "solid"));
      break;
     case "Planet":
       celestialObjects.add(new Planet(mass * pow(10, 24), spawnRadius, spawnPos, vel, new PVector(0, 0), color(100, 100, 200), "solid"));
       break;
     case "Star":
       celestialObjects.add(new Star(mass * pow(10, 30), spawnRadius, spawnPos, vel, new PVector(0, 0), color(255, 255, 0), "gas", 5600));

       break;
  }

}
