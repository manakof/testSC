/**
SCWomb_OSCRecive_audiovisual_02
Recive message from Processing to SC.
*/

import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
int windowWidth = 800;
int windowHeight = 600;

//worm position
int wormPosX;
int wormPosY;

NetAddress myRemoteLocation;

void setup() {
  size( windowWidth, windowHeight );
  frameRate( 30 );
  //set backgroundcolon
  background( 255 );
  wormPosX = 400;
  wormPosY = 300;
  myRemoteLocation = new NetAddress("127.0.0.1", 57110);
}


void draw() {
  //set ellipsemode
  point( wormPosX, wormPosY );
  
  //declesing circle radius at each frames
  wormPosX += random( -5, 5 );
  wormPosY += random( -5, 5 );

  if( wormPosX > windowWidth ){
    wormPosX = 0;
  }
  
  if( wormPosX < 0 ){
    wormPosX = windowWidth;
  }
  
  if( wormPosY > windowHeight ){
    wormPosY = 0;
  }
  
  if( wormPosY < 0 ){
    wormPosY = windowHeight;
  }
 
  OscMessage myMessage = new OscMessage("/n_set");
  
  myMessage.add(1001); //Synth's node number
  myMessage.add("note"); //controll freq argument
  myMessage.add(wormPosX); //worm's xpositioin
  myMessage.add("moNote"); //controll eqFreq argument
  myMessage.add(wormPosY); //worm's ypositioin

  oscP5.flush(myMessage, myRemoteLocation);
}


