import g4p_controls.*;

float scalingFactor = pow(10, -9);    //you're not really supposed to change this
float timeStep = 60;

ArrayList<CelestialObject> celestialObjects;    //array of everything
ArrayList<CelestialObject> deleteCache;    //i couldn't thinkof an easier way to do this

JSONArray data;    //initialize the json array

void reset() {
  
  PVector[] startingVelocities = {  //these are largely arbitrary
    new PVector(1, -1),
    new PVector(0.75, -0.75),
    new PVector(0.66, -0.66),
    new PVector(0.5, -0.5),
    new PVector(0.5, -0.5),
    new PVector(0.5, -0.5),
    new PVector(0.5, -0.5),
    new PVector(0.5, -0.5),
    new PVector(0.5, -0.5)    //the other planets exist they just too far away unfortunately
  };
  
  data = loadJSONArray("data.json");
  PVector center = new PVector (width/2, height/2);
  
  deleteCache = new ArrayList<CelestialObject>();
  
  celestialObjects = new ArrayList<CelestialObject> () {{    //cool syntax for arraylist initialization
  
    //Solar System

    add(new Star("Sun", 1.989 * pow(10, 30), 69.634, center, new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), "gas", 5600));
      
    for (int i = 0; i < 8; i++) {
      
      JSONObject selectedPlanet = data.getJSONObject(i);    //grabbing the different planets
      
      String name = selectedPlanet.getString("name");
      float mass = selectedPlanet.getFloat("mass");
      float radius = selectedPlanet.getFloat("radius");
      PVector distance = PVector.add(center, new PVector(sqrt(pow(selectedPlanet.getFloat("distance"), 2) / 2), sqrt(pow(selectedPlanet.getFloat("distance"), 2) / 2)));
      
      //the distance from the sun is the hypoteneuse
      
      JSONArray colorArray = selectedPlanet.getJSONArray("color"); 
      color planetColor = color(colorArray.getInt(0), colorArray.getInt(1), colorArray.getInt(2));
      
      String type = selectedPlanet.getString("type");
      
      add(new Planet(name, mass * pow(10, 24), radius, distance, startingVelocities[i], new PVector(0, 0), planetColor, type));
      
    }
    
    //Asteroid Belt
    
    float beltDistance = 329;    //it's around this far away from the sun
    int numAsteroids = (int) random(110, 190);    //there are between 1.1 and 1.9 million asteroids in the belt

    for (int j = 0; j < numAsteroids; j++) {

      float angle = j * TWO_PI / numAsteroids * random(10);    //add some randomness, and vary it according to a circle
      PVector velocity = new PVector(-sin(angle) * 0.65, cos(angle) * 0.65);    //so it spins properly
      PVector position = PVector.sub(center, new PVector(cos(angle), sin(angle)).mult(beltDistance + random(150)));    
      //to space it out, the belt is around 150m km
      
      add(new Asteroid("", random(0.1, 1.0) * pow(10, 15), random(0.5, 2), position, velocity, new PVector(0, 0), color(150, 150, 150), "solid"));
    }
    
  }};

}

void setup() {
  
  size(600, 600);
  //noLoop();
  createGUI();
  
  spawnRadius.setNumeric(1.0, 5.0, 1.0);
  spawnMass.setNumeric(0.1, 9.9, 1.0);
  exponentMass.setNumeric(3.0, 20.0, 3.0);
  
  timeRatio.setText("1 year every " + round(15*60/timeStep * pow(10, 3))/pow(10, 3) + " seconds");
    //Initialize the GUI kinda
  
  reset();
  
}

void draw() {
  
  background(0);
  frameRate(timeStep);

  for (CelestialObject co : celestialObjects) {
    co.display();
    co.update(); 
  }
  
  for (CelestialObject del : deleteCache){
    if (celestialObjects.contains(del) && del.radius <= 1){
      celestialObjects.remove(del);
    }
  }
  
  deleteCache.clear();
  
}

void mousePressed(){
  
  boolean mouseOverObject = false;
  PVector mousePos = new PVector(mouseX, mouseY); 
  
  for (CelestialObject co : celestialObjects) {
    if (PVector.dist(mousePos, co.pos) < co.radius * co.visualScaling) {
      mouseOverObject = true;
      break;    //so you can't click on 2 objects at once
    }
  }
  
  if (!mouseOverObject) {
    
    switch (spawnedObject.getSelectedText()) {    //change the object type added depending on the object created
      case "Asteroid":
         celestialObjects.add(new Asteroid("", spawnMass.getValueF() * pow(10, exponentMass.getValueF()), spawnRadius.getValueF(), mousePos, new PVector(spawnVelocity.getValueXF(), spawnVelocity.getValueYF()), new PVector(0, 0), color(150, 150, 150), "solid"));
         break;
       case "Planet":
         celestialObjects.add(new Planet("", spawnMass.getValueF() * pow(10, exponentMass.getValueF()), spawnRadius.getValueF(), mousePos, new PVector(spawnVelocity.getValueXF(), spawnVelocity.getValueYF()), new PVector(0, 0), color(100, 100, 200), "solid"));
         break;
       case "Star":
         celestialObjects.add(new Star("", spawnMass.getValueF() * pow(10, exponentMass.getValueF()), spawnRadius.getValueF(), mousePos, new PVector(spawnVelocity.getValueXF(), spawnVelocity.getValueYF()), new PVector(0, 0), color(255, 255, 0), "gas", 5600));
         break;
         
    }
  }
  
}
