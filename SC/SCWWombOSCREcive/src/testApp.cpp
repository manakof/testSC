#include "testApp.h"
#define PORT 5000

//--------------------------------------------------------------
void testApp::setup(){
    ofSetFrameRate(60);
    receiver.setup( PORT ); //受けとるポート番号
    clickCircleRadius = 1;
    kickCircleRadius = 1;
}

//--------------------------------------------------------------
void testApp::update(){
    
    while( receiver.hasWaitingMessages() )
    {
        ofxOscMessage m;
        receiver.getNextMessage( &m );
        
        // OSCメッセージのパース
        if ( m.getAddress() == "/trig" )
        {
            string commandSting;
            commandSting = m.getArgAsString( 0 );
			
            if( "click" == commandSting){
                clickCircleRadius = 300;
				
            }else if( "kick" == commandSting ){
                kickCircleRadius = 300;
            }
			
        }
    }
    
    clickCircleRadius /= 1.125;
    kickCircleRadius /= 1.125;
}

//--------------------------------------------------------------
void testApp::draw(){
    ofBackground(0, 0, 0);
    
    ofSetColor(255,255,0);
    ofCircle(200, 300, clickCircleRadius);
    
    ofSetColor(0,255,0);
    ofCircle(600, 300, kickCircleRadius);
	
}


//--------------------------------------------------------------
void testApp::keyPressed(int key){
	
}

//--------------------------------------------------------------
void testApp::keyReleased(int key){
	
}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){
	
}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){
	
}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){
	
}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){
	
}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){
	
}

//--------------------------------------------------------------
void testApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void testApp::dragEvent(ofDragInfo dragInfo){ 

}