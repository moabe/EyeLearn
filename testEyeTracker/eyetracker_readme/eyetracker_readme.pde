import eyetracking.*;

// This is our tracking device. It provides you with eye data.
EyeTrackingDevice device;

void setup() {
    size(600,400);
    // Opening the device like this should be fine. Takes ~5 secs to warm-up.
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

}
