//Testar en kommentar
import com.getflourish.stt.*;
import ddf.minim.*;
 
STT stt;
String result;

// Floater-variables
float averageX=0;
float sumX = 0;
float[] storedValuesX;
int countX = 0;

float average=0;
float sum = 0;
float[] storedValues;
int count = 0;
// Floater above 
PImage bg;
PImage animal1;
int a;

void setup ()
{
   size(625, 480);
   bg = loadImage("jungle.jpg");
   animal1 = loadImage("lion.png");


  // Init STT with default manual record mode
  stt = new STT(this);
  stt.enableDebug();
  stt.setLanguage("en"); 
  
  // Some text to display the result
  textFont(createFont("Arial", 24));
  result = " ";
  //floater below
  storedValuesX = new float[10];
  storedValues = new float[10];
  //floater above
}
 
void draw ()
{

  
  if (result == " ") {
  background(bg);
  ellipse(200,200,50,50);
  text("Find an animal",10,30);
  }
   else {
      if (result.equals("lion")) {
         background(bg);
         ellipse(200,200,50,50);
         text("You are correct",300,300);
         text("Interpreted: " + result, 10, 30);
      }  
        else {
          background(bg);
          ellipse(200,200,50,50);
          text("Your are incorrect",300,300);
          text("Interpreted: " + result, 10, 30);
        }
   }
   
  int pos1x=70;
  int pos1y=50;  
  image(animal1, pos1x, pos1y);
  int size1x=animal1.width;
  int size1y=animal1.height;

  // floater nedan
  float newValueFromStreamX = mouseX;
  float newValueFromStream = mouseY;
  AddNewValueX(newValueFromStreamX);
  AddNewValue(newValueFromStream);
  float aveX = 0;
  float ave = 0;
  if(countX > 0)
  {
    aveX = sumX / countX;
  }
  if(count > 0)
  {
    ave = sum / count;
  }
  //floater ovan
 
  if ( aveX < pos1x+size1x && aveX > pos1x && ave < pos1y+size1y && ave > pos1y ) {
    stt.begin();
    println("Recording Started");
    sleep(2000);
    stt.end();
    println("Recording Ended");
  
  }
 

  
  ellipse(aveX,ave,20,20);
  
}
 
// Method is called if transcription was successfull 
void transcribe (String utterance, float confidence) 
{
  println(utterance);
  result = utterance;
}
 
// Use any key to begin and end a record
public void keyPressed () {
  stt.begin();
}
public void keyReleased () {
  stt.end();
}


//FLOATER VOIDS NEDAN
void AddNewValueX(float valX)
{
  if(countX < storedValuesX.length)
  {
    //array is not full yet
    storedValuesX[countX++] = valX;
    
    sumX += valX; 
  }
  else
  {
    sumX += valX; 
    sumX -= storedValuesX[0];
    
    //shift all of the values, drop the first one (oldest) 
    for(int i = 0; i < storedValuesX.length-1; i++)
    {
      storedValuesX[i] = storedValuesX[i+1] ;
    }
    //the add the new one
    storedValuesX[storedValuesX.length-1] = valX;
  }
}

void AddNewValue(float val)
{
  if(count < storedValues.length)
  {
    //array is not full yet
    storedValues[count++] = val;
    
    sum += val; 
  }
  else
  {
    sum += val; 
    sum -= storedValues[0];
    
    //shift all of the values, drop the first one (oldest) 
    for(int i = 0; i < storedValues.length-1; i++)
    {
      storedValues[i] = storedValues[i+1] ;
    }
    //the add the new one
    storedValues[storedValues.length-1] = val;
  }
}

void sleep(int ms) {
 
      try {
        Thread.sleep(ms);
    } catch(InterruptedException ex) {
        Thread.currentThread().interrupt();
    }
  
}

//FLOATER VOIDS OVAN

