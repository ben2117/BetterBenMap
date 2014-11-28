////InputController{\\\\\\
  Node selectedNode;

  void mouseClicked() {
     //[[in benmap]] changes the view controller to map or card view
     if(!checkView(mouseX, mouseY)) 
       viewController.mouseInput(mouseX, mouseY);
         ;
  }
  
  void keyPressed() {
    char charactor = key;
    nodeController.activeNode.inputText(charactor);
  }
  
  void mousePressed() {
    viewController.mouseDown(mouseX,mouseY);
  }

  void mouseReleased() {
    viewController.mouseUp(mouseX,mouseY);
  }
