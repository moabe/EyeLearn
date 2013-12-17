//class for making Objects
class Object {
  
 String name;
 float xpos;
 float ypos;
 PImage image;
 float xsize;
 float ysize;
 PImage hide;
 float xposHide;
 float yposHide;
 
 //Constructor
 Object(String tempName, float tempXpos, float tempYpos, PImage tempImage, PImage tempHide){
 
   name = tempName;
   xpos = tempXpos;
   ypos = tempYpos;
   image = tempImage;
   xsize = tempImage.width;
   ysize = tempImage.height;
   hide = tempHide;
   xposHide = xpos;
   yposHide = ypos;

 
 }

 

 
 void display() {
   image(image, xpos, ypos);
   imageMode(CENTER);
 
 
 }
 
 void displayHide() {
      image(hide, xposHide, yposHide);
 
 
 }
 
  void moveHide() {
   
   xposHide++;
   if (xposHide >= 300){
     xposHide = 300;
   }
 }
 
 
 

 
 
 }
