 void setup() {
  size(1920, 1080);
  background(50);
}

void draw() {
  //agian, never forget that draw is doing a while!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
  stroke(100);
  //not update all the time. Each 50 milliseconds
       try {
          Thread.sleep(50);
      } catch(InterruptedException ex) {
          Thread.currentThread().interrupt();
      }
      //getting in the coordinates from the gaze.txt file
      String[] lines;
      lines = loadStrings("c:/gaze.txt");
      
      //there must be something the file for us to read it
      if ( lines.length > 0 ){
        //gettig the timestamp and the coorinates into a array, splitting on space
        String[] list = split(lines[0], ' ');
        int x = int(list[1]);
        int y =  int(list[2]);
        //printing coordinates to console
        println( "  " + x + "  " + y);
        //painting an ellipse with the coordinates
        ellipse(int(x),int(y),40,20);
    
        } 
    }
