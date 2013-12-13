 

void setup() {
  size(1920, 1080);
  background(50);
}

void draw() {
 
  stroke(100);
  
       try {
          Thread.sleep(50);
      } catch(InterruptedException ex) {
          Thread.currentThread().interrupt();
      }
      String[] lines;
      lines = loadStrings("c:/gaze.txt");
      
      if ( lines.length >0 ){
        String[] list = split(lines[0], ' ');
        int x = int(list[1]);
        int y =  int(list[2]);
        println( "  " + x + "  " + y);
       ellipse(int(x),int(y),40,20);
    
   //    line(x, y, x+100, y+100); 
        } 
    }
  
    //println("temp" + temp);
    //println("list0" + int(list[0]));
  
  
 
