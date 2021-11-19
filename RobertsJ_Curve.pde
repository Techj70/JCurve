float phi = 1.618; //numerical phi (not to be confused with pi)
int randIntVal = 0;  //random integer
int a=1;           //variable a
int b=2;           //variable b
int n1=0;          //number 1
int n2=0;          //number 2
int s = second();  // Values from 0 - 59
int m = minute();  // Values from 0 - 59
int h = hour();    // Values from 0 - 23
int mouseXcor=0;   //stored mouse X cordinates at time of left click
int mouseYcor=0;   //stored mouse Y cordinates at time of left click
float gRat=(a+b)/a;  //the Golden Ratio Equation

void setup()
{
  frameRate(30);
  size(500,500);
  background(0);
}

void draw()
{
  s = second();  //updates second variable
  m = minute();  //updates minute variable
  h = hour();    //updates hour variable
  
  float wavA = 0.0;  //used for wave cordinates
  float inc = TWO_PI/25.0;  //used to increment wavA variable
  int aRed=255;      //used for red stroke value for wavA
  int aGreen=0;      //used for blue stroke value for wavA
  int aBlue=0;       //used for green stroke value for wavA
  int cnt1=0;
  int ix=0;
  int iy=30;
  a=50;         //starts a value for gRat
  b=25;         //starts b value for gRat
  n1=5;
  n2=10;
  while (cnt1<10)  //repeately draws wave A to to fill screen (aka waveA_redraw)
  {
    s = second();  //updates second variable
    m = minute();  //updates minute variable
    h = hour();    //updates hour variable
    
    aRed=mouseX;
    aGreen=mouseY;
    aBlue=s+m+h+15;
    
    ix=s*8;     //updates ix adding 8 to its current value each second
    iy+=50;     //updates iy adding 50 to its current value
    cnt1+=1;    //updates waveA_redraw's (this loop's) increment counter
	
	/*beginShape();
	vertex(0,250);
	bezierVertex(0,25,100,5,100,250);
	vertex(100,250);
	endShape();*/
	
  stroke(255);
	beginShape();
	curveVertex(100,250);
  curveVertex(100,250);
  curveVertex(150,375);
  curveVertex(200,250);
  curveVertex(200,250);
	endShape(); 
	
  stroke(255);
  beginShape();
  vertex(100,250);
  quadraticVertex(100,250,150,125);
  quadraticVertex(200,250,125,150);
  vertex(200,250);
  endShape();

	/*beginShape();
	vertex(200,250);
	bezierVertex(225,125,0,225,125,0);
	vertex(300,250);
	endShape();
	
	beginShape();
	vertex(300,250);
	bezierVertex(325,375,0,325,375,0);
	vertex(400,250);
	endShape();
	
	beginShape();
	vertex(400,250);
	bezierVertex(425,125,0,425,125,0);
	vertex(500,250);
	endShape();*/
	    
    //for (/*none*/;ix < 520; ix+=4)  //draws wave A
    /*{
       stroke(aRed-(gRat-20),aGreen-phi,(aBlue+(n2/n1)));
       strokeWeight(2);
       fill(0);
       bullseye(ix, iy+sin(wavA)*40.0-10, 30, 30);  //calls my custom function bullseye and draws the shape according to the passed paramaters; the y coordinates calls the sin() function to create the wave
       wavA = wavA + inc;    //increments wavA variable
       aRed-=3;        //updates aRed variable
       aGreen+=3;      //updates aBlue variable
       aBlue+=2;       //updates aGreen variable
    }*/
  }
}

void bullseye(float x, float y, float w, float h)  //my custom function that draws my custom bullseye shape
{
  while(w>=1&&h>=1)  //draws ellipses over each other to create bullseye effect
  {
    int fillRed=mouseXcor;                         //fill red value
    int fillBlue=mouseYcor;                        //fill blue value
    int fillGreen=mouseXcor+mouseYcor-randInt();   //fill green value
    fill(fillRed,fillBlue,fillGreen);              //sets fill for ellipses
    ellipse(x,y,w,h);      //draws ellipse
    w-=10;                 //updates w next for next ellipse        
    h-=10;                 //updates h next for next ellipse 
  }
}


int randInt()  //custom function that returns a random integer between 0 and 200
{
  int rand=int(random(200));
  return rand;
}

void mouseClicked()  //displays (in console window only) and stores the mouse X and Y coordinates whenever the mouse is left clicked
{
  mouseXcor=mouseX;
  mouseYcor=mouseY;
  println("X="+mouseX+",Y="+mouseY);
}