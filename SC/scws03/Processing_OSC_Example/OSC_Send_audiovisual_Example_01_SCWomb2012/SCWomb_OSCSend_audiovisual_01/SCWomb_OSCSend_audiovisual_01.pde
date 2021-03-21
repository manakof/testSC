/**
SCWomb_OSCSend_audiovisual_01
*/
 
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

//circle radius
float clickCircleRadius;
float kickCircleRadius;

void setup() {
  size( 800, 600 );
  frameRate( 60 );
  oscP5 = new OscP5( this , 5000 );
  clickCircleRadius = 1;
  kickCircleRadius = 1;
}


void draw() {
  //set backgroundcolor
  background(0);
  smooth();
  
  //set ellipsemode
  ellipseMode( CENTER );
  
  fill( 255, 255, 255 );
  ellipse(  clickCircleRadius, clickCircleRadius, clickCircleRadius, clickCircleRadius );
  
  fill( 255, 255, 255);
  rect( 600, 300, kickCircleRadius, kickCircleRadius );

  //declesing circle radius at each frames
  clickCircleRadius /= 1.125;
  kickCircleRadius /= 1.125;
}


//OSC Event Method
void oscEvent(OscMessage incommingOscMessage) {
  
  //Parse  OSC Messages
  if( true == incommingOscMessage.checkAddrPattern("/trig")){
    String instrumentVlue = incommingOscMessage.get(0).stringValue();

    if( true == instrumentVlue.equals("click") ){
      clickCircleRadius = 300.0;
      println("click ");

    }else if( true == instrumentVlue.equals("kick") ){
      kickCircleRadius = 300.0;
      println("kick  ");
    }

  };
}
