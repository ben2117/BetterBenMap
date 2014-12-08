////InputController{\\\\\\
  Node selectedNode;

  void mouseClicked() {
     //[[in benmap]] changes the view controller to map or card view
     if(!checkView(mouseX, mouseY)) {
       viewController.mouseInput(mouseX, mouseY);
         
     };
  }
  
  void keyPressed() {
    println(keyCode);
    if (keyCode == 8) {
      //GO TO NODE CONTROLLER
        print("d");
        nodeController.activeNode.deleteText();
    } else if (keyCode == RIGHT) { //GO TO VIEW CONTROLLER
      viewController.right();
    } else if (keyCode == LEFT) {
      viewController.left();
    }else if (keyCode == UP) { //GO TO VIEW CONTROLLER
      viewController.up();
    } else if (keyCode == DOWN) {
      viewController.down();
    }
    else if(keyCode == 18){
      nodeController.activeNode.createChild();
    }
    else if(keyCode == 9){
      nodeController.activeNode.parent.createChild();
    }
    else{
      //GO TO NODE CONTROLLER
      try{
      char charactor = key;
      nodeController.activeNode.inputText(charactor);
      }
      catch(Exception e) {};
    }
    
  }
  
  void mousePressed() {
    viewController.mouseDown(mouseX,mouseY);
  }

  void mouseReleased() {
    viewController.mouseUp(mouseX,mouseY);
  }
