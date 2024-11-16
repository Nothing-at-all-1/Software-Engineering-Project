/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:393323:
  appc.background(230);
} //_CODE_:window1:393323:

public void spawnedObjectChanged(GDropList source, GEvent event) { //_CODE_:spawnedObject:681934:
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:spawnedObject:681934:

public void timeStepChanged(GKnob source, GEvent event) { //_CODE_:timeStepControl:952075:
  timeStep = timeStepControl.getValueI();
  ratio.setText("1 year every " + round(15*60/timeStep * pow(10, 3)) / pow(10, 3) + " seconds");
} //_CODE_:timeStepControl:952075:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 480, 140, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.EXIT_APP);
  window1.addDrawHandler(this, "win_draw1");
  spawnedObject = new GDropList(window1, 20, 40, 80, 80, 3, 10);
  spawnedObject.setItems(loadStrings("list_681934"), 0);
  spawnedObject.addEventHandler(this, "spawnedObjectChanged");
  timeStepControl = new GKnob(window1, 120, 40, 60, 60, 0.8);
  timeStepControl.setTurnRange(0, 360);
  timeStepControl.setTurnMode(GKnob.CTRL_ANGULAR);
  timeStepControl.setShowArcOnly(false);
  timeStepControl.setOverArcOnly(false);
  timeStepControl.setIncludeOverBezel(false);
  timeStepControl.setShowTrack(true);
  timeStepControl.setLimits(60.0, 60.0, 600.0);
  timeStepControl.setNbrTicks(20);
  timeStepControl.setShowTicks(true);
  timeStepControl.setOpaque(false);
  timeStepControl.addEventHandler(this, "timeStepChanged");
  objectLabel = new GLabel(window1, 20, 20, 80, 20);
  objectLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  objectLabel.setText("Object Type");
  objectLabel.setOpaque(false);
  timeLabel = new GLabel(window1, 120, 0, 60, 40);
  timeLabel.setTextAlign(GAlign.CENTER, GAlign.BOTTOM);
  timeLabel.setText("Time Modifier");
  timeLabel.setOpaque(false);
  ratio = new GLabel(window1, 90, 100, 120, 40);
  ratio.setTextAlign(GAlign.CENTER, GAlign.TOP);
  ratio.setText("My label");
  ratio.setOpaque(false);
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GDropList spawnedObject; 
GKnob timeStepControl; 
GLabel objectLabel; 
GLabel timeLabel; 
GLabel ratio; 
