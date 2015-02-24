import java.awt.Robot;
import java.awt.*;
import java.awt.image.*;


PImage screenShot;

public class ScreenShotViewController extends ViewController {
  
  boolean selecting = false;
  int startPointx; int startPointy;
  int endPointx; int endPointy;
  
  ScreenShotViewController() {
    size( displayWidth, displayHeight );
    background( 0 );
    takeInitScreenShot();
    
  }
  
  void drawView(ArrayList<Node> loadedNodes){
    
    background( 0 );
    image( screenShot, 0, 0 );
    if(selecting){
      fill(15);
      rectMode(CORNERS);
      rect(startPointx, startPointy, mouseX, mouseY); 
    }
  }
  
  void mouseDown(int x, int y){
    selecting = true;
    startPointx = x;
    startPointy = y;
  
  };
  void mouseUp(int x, int y){
    endPointx = x;
    endPointy = y;
    selecting = false;
    takeFinScreenShot();
  };
  
  void takeFinScreenShot(){
    background( 0 );
    image( screenShot, 0, 0 );
    screenShot = get(startPointx, startPointy, startPointx + endPointx, startPointy + endPointy);
  }
  
  
}




void takeInitScreenShot()
{
    frame.setLocation(displayWidth+20,displayHeight+20);
    delay(100);
    Rectangle screenRect = new Rectangle( Toolkit.getDefaultToolkit().getScreenSize() );
    
    try {
        
        BufferedImage screenBuffer = new Robot().createScreenCapture( screenRect );
        
        screenShot = new PImage( screenBuffer.getWidth(), screenBuffer.getHeight(), PConstants.ARGB );
        screenBuffer.getRGB( 0, 0, screenShot.width, screenShot.height, screenShot.pixels, 0, screenShot.width );
        screenShot.updatePixels();
        
    } catch ( AWTException e ) {
        e.printStackTrace();
    }
     
    frame.setLocation(0,0);
}

/*
void keyPressed()
{
    if ( key == 'c' ) {
        viewController = new ScreenShotViewController();
        takeScreenShot();
    }
}
*/
