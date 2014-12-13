///ViewDelegeltor\\\

//InputController inputController = new InputController(); //create input controlle first
NodeController nodeController = new NodeController();
ViewController viewController = new MapViewController(); //always starts as map view

void setup() {
  size(800, 800);  // size always goes first!
  smooth();
  if (frame != null) {
    frame.setResizable(true);
  }
}

void draw() {
  background(230);
  delegateMenu(); //draw the menu for the main screen, this never changes
  viewController.drawView(nodeController.loadedNodes);
}
 //<>//
//this checks the delegate menu buttons
boolean checkView(float x, float y){
    //changes the view controller to map or card view
   if (mouseX >= 20 && mouseX <= 20+60 && 
      mouseY >= 20 && mouseY <= 20+30){
       if(viewController instanceof MapViewController){
          viewController = new CardViewController();
        }
        else{
          viewController = new MapViewController();
        }
       println("View has been changed");
       return true; 
       } 
    //Zoom IN button 
    //Should be switched off in CardView
    else if (mouseX >= width-150 && mouseX <= width-150+60 &&      
      mouseY >= 20 && mouseY <= 20+30) {
      println("Zoom IN button clicked");
    }
    //Zoom OUT button  
    //Should be switched off in CardView
    else if (mouseX >= width-80 && mouseX <= width-80+60 && 
      mouseY >= 20 && mouseY <= 20+30) {
      println("Zoom OUT button clicked");
    }
    //creates a new main node
    //Should be switched off in CardView
    else if (mouseX >= 90 && mouseX <= 90+60 && 
      mouseY >= 20 && mouseY <= 20+30){
        nodeController.createMainNode();
        println("A new node has been created");
        return true;   
    }
    //save button
    else if(mouseX >= 160 && mouseX <= 160+60 &&
      mouseY >= 20 && mouseY <= 20+30){
        println("save button clicked");
        selectFolder("Select a folder to process:", "folderSelectedSave" );
        //nodeController.saveNodes();
        return true;
      } 
    //load button   
    else if(mouseX >= 230 && mouseX <= 230+60 &&
            mouseY >= 20 && mouseY <= 20+30){
        println("load button clicked");
        selectInput("Select a folder to process:", "folderSelectedLoad" );
        //nodeController.loadedNodes();
        return true;
      }
      return false;
}


void delegateMenu(){
  int x1 = width-150;           //variables of the zoom buttons
  int x2 = width-80;
  int zoomIn = width-120;
  int zoomOut = width-55;
  
  if(width<450){                //prevents zoom buttons from covering rest of menu
    x1 = 300;
    x2 = 370;
    zoomIn = 330;
    zoomOut = 395;
  }
  
  fill(0, 102, 153);            //menu buttons 
  noStroke();
  rect(20, 20, 60, 30);
  rect(90, 20, 60, 30);
  rect(160, 20, 60, 30);
  rect(230, 20, 60, 30);
  rect(x1, 20, 60, 30);
  rect(x2, 20, 60, 30);
  fill(255);                    //menu text
  textSize(14);
  text("change", 20, 35);
  text("view", 45, 47);
  text("new", 90, 35);
  text("Node",105, 47);
  text("save", 175, 41);
  text("load", 245, 41);
  text("zoom", x1, 35);
  text("IN", zoomIn, 47);
  text("zoom", x2, 35);
  text("OUT", zoomOut, 47);
}
  
