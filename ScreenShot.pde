import java.awt.Robot;
import java.awt.*;
import java.awt.image.*;


PImage screenShot;

public class ScreenShotViewController extends ViewController {
  
  ScreenShotViewController() {
    size( displayWidth, displayHeight );
    background( 0 );
    takeScreenShot();
    
  }
  
  void drawView(ArrayList<Node> loadedNodes){
    
    background( 0 );
    image( screenShot, 0, 0 ); 
  }
  
}

void takeScreenShot()
{
    frame.setLocation(9999999,9999999);
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
