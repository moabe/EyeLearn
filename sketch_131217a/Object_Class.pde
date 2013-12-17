//class for making geometric objects
class Object {
  
 String name;
 float xpos;
 float ypos;
 PImage image;
 float xsize;
 float ysize;
 
 //Constructor
 Object(String tempName, float tempXpos, float tempYpos, PImage tempImage){
 
   name = tempName;
   xpos = tempXpos;
   ypos = tempYpos;
   image = tempImage;
   xsize = tempImage.width;
   ysize = tempImage.height;
   
 
 }
 
 void display() {
   image(image, xpos, ypos);
 
 
 }
 
 

 
 
 }
