/**
 * Patterns. 
 * 
 * Move the cursor over the image to draw with a software tool 
 * which responds to the speed of the mouse. 
 */

import eyetracking.*;

EyeTrackingDevice device;

int px = 0;
int py = 0;

void setup() {
  size(640, 360);
  background(102);
  device = EyeTrackingDevice.open(this);
}

void draw() {
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  variableEllipse(device.eyes.rawX, device.eyes.rawY, px, py);
  px = device.eyes.rawX;
  py = device.eyes.rawY;
}


// The simple method variableEllipse() was created specifically 
// for this program. It calculates the speed of the mouse
// and draws a small ellipse if the mouse is moving slowly
// and draws a large ellipse if the mouse is moving quickly 

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}
