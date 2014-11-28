///ViewDelegeltor\\\

//InputController inputController = new InputController(); //create input controlle first
NodeController nodeController = new NodeController();
ViewController viewController = new MapViewController(); //always starts as map view

void setup() {
  size(800, 800);  // size always goes first!
  if (frame != null) {
    frame.setResizable(true);
  }
}

void draw() {
  background(255);
  delegateMenu(); //draw the menu for the main screen, this never changes
  viewController.drawView(nodeController.loadedNodes);
}

void delegateMenu(){
  fill(0, 102, 153);
  rect(20, 20, 60, 30);
  rect(90, 20, 60, 30);
}

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
    //creates a new main node
    else if (mouseX >= 90 && mouseX <= 90+60 && 
      mouseY >= 20 && mouseY <= 20+30){
        nodeController.createMainNode();
        println("A new node has been created");
        return true;
        
    }
      return false;
}
