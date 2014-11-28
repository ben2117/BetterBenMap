class MapViewController extends ViewController {
  
  void drawView(ArrayList<Node> loadedNoads){
    textSize(32);
    fill(0, 102, 153);
    text("Map", 100, 130); 
    text("View", 110, 160);
    for(int i = 0; i < loadedNoads.size(); i++){
       Node currentNode = loadedNoads.get(i);
       stroke(0);
       fill(000,155,255);
       if(currentNode == nodeController.activeNode && nodeController.activeNode.dragging){
         currentNode.xloc = mouseX;
         currentNode.yloc = mouseY;
       }
       
       
       //rect(currentNode.xloc, currentNode.yloc, currentNode.sizex, currentNode.sizey);
       rect(currentNode.xloc, currentNode.yloc, currentNode.sizex, currentNode.sizey);
       fill(0);
       textSize(10);
       text(currentNode.heading, currentNode.xloc, currentNode.yloc, currentNode.sizex, currentNode.sizey);
       rect(currentNode.xloc, currentNode.yloc, 10, 10);
       rect(currentNode.xloc + 15, currentNode.yloc, 10, 10);
       
       
    }  
  }
  
  void mouseInput(float x, float y){
    for(int i = 0; i < nodeController.loadedNodes.size(); i++){
      Node currentNode = nodeController.loadedNodes.get(i);
      
      if (mouseX >= currentNode.xloc && mouseX <= currentNode.xloc+currentNode.sizex && 
       mouseY >= currentNode.yloc && mouseY <= currentNode.yloc+currentNode.sizey){
         if(nodeController.activeNode == currentNode){
                 
         }
         else{
          nodeController.activeNode = currentNode;
         }
      }
      
      if (mouseX >= currentNode.xloc && mouseX <= currentNode.xloc+currentNode.sizex && 
       mouseY >= currentNode.yloc && mouseY <= currentNode.yloc+currentNode.sizey){
       
       }
      
    }
  }
  
  void mouseDown(int x, int y){
    if(nodeController.activeNode != null){
    Node currentNode = nodeController.activeNode;
    if (mouseX >= currentNode.xloc && mouseX <= currentNode.xloc+currentNode.sizex && 
       mouseY >= currentNode.yloc+10 && mouseY <= currentNode.yloc+currentNode.sizey){
         currentNode.dragging = true;
       }
    }
  }
  void mouseUp(int x, int y){
    if(nodeController.activeNode != null){
    nodeController.activeNode.dragging = false;
    }
  }
  
}
