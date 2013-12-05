/**
 * Rollover. 
 * 
 * Roll over the colored squares in the center of the image
 * to change the color of the outside rectangle. 
 */
import eyetracking.*;

// This is our tracking device. It provides you with eye data.
EyeTrackingDevice device;

int px = 0;
int py = 0;
 
int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 90;     // Diameter of rect
int circleSize = 93;   // Diameter of circle

color rectColor;
color circleColor;
color baseColor;

boolean rectOver = false;
boolean circleOver = false;

void setup() {
  size(640, 360);
  rectColor = color(0);
  circleColor = color(255);
  baseColor = color(102);
  circleX = width/2+circleSize/2+10;
  circleY = height/2;
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
  ellipseMode(CENTER);
  device = EyeTrackingDevice.open(this);
}

void draw() {
      // In case of emergency.
    device.debug();

    // Is the user there?
    println(device.isLooking);

    // We give you eyes ... (fixations, pixel coordinates in window)
    println("X:" + device.x);
    println("Y:" + device.y);

    // ... raw gaze ...
    println("x:" + device.eyes.rawX);
    println("y:" + device.eyes.rawY);


    // ... and head (normalized between 0.0
    // and 1.0; 0.5 is the center of the tracking box).
    println("headX:" + device.head.x);
    println("headY:" + device.head.y);
    println("headZ:" + device.head.z);
    
    ellipse(device.x, device.y, 100, 100);
  update(device.eyes.rawX, device.eyes.rawY);

  noStroke();
  if (rectOver) {
    background(rectColor);
  } else if (circleOver) {
    background(circleColor);
  } else {
    background(baseColor);
  }

  stroke(255);
  fill(rectColor);
  rect(rectX, rectY, rectSize, rectSize);
  stroke(0);
  fill(circleColor);
  ellipse(circleX, circleY, circleSize, circleSize);
  ellipse(device.x, device.y, 100, 100);
}

void update(int x, int y) {
  if( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

boolean overRect(int x, int y, int width, int height) {
  if (device.eyes.rawX >= x && device.eyes.rawX <= x+width && 
      device.eyes.rawY >= y && device.eyes.rawY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - device.eyes.rawX;
  float disY = y - device.eyes.rawY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
