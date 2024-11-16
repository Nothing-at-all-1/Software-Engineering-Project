import g4p_controls.*;

float scalingFactor = pow(10, -9);  
float timeStep = 60;

ArrayList<CelestialObject> celestialObjects;

//float[] data(){
//  String[] data = loadStrings("data.txt");
//  for (String s : data){
//    s.split("\t");
//  }
//}

//yall can do this if you want

float[][] data = {
  {0.33,  0.2439,  57.91},
  {4.87,  0.6052,  108.21},
  {5.97,  0.6371,  149.60},
  {0.642,  0.3389,  227.92},
  {1898,  6.9911,  778.57},
  {568,  5.8232,  1433.53},
  {86.8,  2.5362,  2872.46},
  {102,  2.4622,  4495.06}
};

color[] colorData = {
  color(169, 169, 169),
  color(184, 158, 121),
  color(100, 100, 255),
  color(204, 102, 0),
  color(105, 105, 105),
  color(255, 165, 0),
  color(135, 206, 235),
  color(255, 255, 255)
};

String[] nameData = {"Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"};

PVector[] startingVelocities = {  //change these so it works or is accurate
  new PVector(1, -0.9),
  new PVector(0.75, -0.5),
  new PVector(0.5, -0.5),
  new PVector(0.35, -0.5),
  new PVector(0.5, -0.5),
  new PVector(0.5, -0.5),
  new PVector(0.5, -0.5),
  new PVector(0.5, -0.5)
};

//
// i will move this data to a txt file or a json file eventually, i cba rn
//

void reset() {
  
  PVector center = new PVector (width/2, height/2);
  
  celestialObjects = new ArrayList<CelestialObject> () {{

  add(new Star("Sun", 1.989 * pow(10, 30), 69.634, center, new PVector(0, 0), new PVector(0, 0), color(255, 255, 0), 5600));
    
  for (int i = 0; i < 8; i++) add(new Planet(nameData[i], data[i][0] * pow(10, 24), data[i][1], new PVector(center.x + sqrt(pow(data[i][2], 2)/2), center.y + sqrt(pow(data[i][2],2))), startingVelocities[i], new PVector(0, 0), colorData[i]));
  
}};

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
