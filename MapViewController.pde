class MapViewController extends ViewController { //<>// //<>//


  void moveNodes(int x, int y) {
    ArrayList<Node> loadedNodes = nodeController.loadedNodes;
    for (int i = loadedNodes.size ()-1; i > -1; i--) {
      Node currentNode = loadedNodes.get(i);
      currentNode.xloc+=x;
      currentNode.yloc+=y;
    }
  }
  
  
  int navigation = 0;
  
  void right() {
    try{
      if(nodeController.activeNode!= null){
        navigation = 0;
        println("navigation is " + navigation);
        nodeController.activeNode = nodeController.activeNode.children.get(navigation);
      }
    } catch(Exception e) {}
  }
  void left() {
    try{
     if(nodeController.activeNode!= null){
        nodeController.activeNode = nodeController.activeNode.parent;
      }
    }catch(Exception e) {}
  }
  
  void up() {
    try{
      if(nodeController.activeNode!= null){
        navigation += -1;
        println("navigation is " + navigation);
        Node nodeParent = nodeController.activeNode.parent;
        nodeController.activeNode = nodeParent.children.get(navigation);
      }
    } catch(Exception e) {navigation += +1;}
  }
  void down() {
   try{
      if(nodeController.activeNode!= null){
        navigation += +1;
        println("navigation is " + navigation);
        nodeController.activeNode = nodeController.activeNode.parent.children.get(navigation);
      }
    } catch(Exception e) {navigation += -1;}
  }
  

  void drawView(ArrayList<Node> loadedNodes) {
    textSize(32);
    fill(0, 102, 153);
    text("Map", 100, 130); 
    text("View", 110, 160);



    ///for loop 
    for (int i = loadedNodes.size ()-1; i > -1; i--) {
      Node currentNode = loadedNodes.get(i);


      if (!currentNode.deleted) {
        stroke(0);
        fill(000, 204, 255);

        //moves node if it is being dragged
        if (currentNode == nodeController.activeNode && nodeController.activeNode.dragging) {
          currentNode.xloc = mouseX-40;
          currentNode.yloc = mouseY-40;
        }
        ////////////////\\\\\\\\\\\\\\\\\\\\/////////////////\\\\\\\\\\\\\\\////////\\\\\\\\

        //draws the line if the node has a parent
        if (currentNode.parent != null) {

          strokeWeight(2);
          line(currentNode.parent.xloc+50, currentNode.parent.yloc+50, currentNode.xloc+50, currentNode.yloc+50);
          stroke(250);
          strokeWeight(0);
        }

        ////////////////\\\\\\\\\\\\\\\\\\\\/////////////////\\\\\\\\\\\\\\\////////\\\\\\\\

        //draws the rectangle and the text
        //rect(currentNode.xloc, currentNode.yloc, currentNode.sizex, currentNode.sizey);
        fill(255);
        if(currentNode == nodeController.activeNode){
         stroke(50); 
         strokeWeight(1);
        } else {
          noStroke();
        }
        rect(currentNode.xloc, currentNode.yloc, currentNode.sizex, currentNode.sizey, 10);
        fill(0);
        textSize(14);
        text(currentNode.heading, currentNode.xloc+10, currentNode.yloc, currentNode.sizex-20, currentNode.sizey);
        fill(0);
        stroke(0);
        strokeWeight(1);
        rect(currentNode.xloc+10, currentNode.yloc, 11, 11);             //cross ans plus button on Node (button and lines)
        rect(currentNode.xloc + 25, currentNode.yloc, 11, 11);
        stroke(255);
        strokeWeight(2);
        line(currentNode.xloc+10, currentNode.yloc+1, currentNode.xloc+20, currentNode.yloc+10);
        line(currentNode.xloc+20, currentNode.yloc+1, currentNode.xloc+10, currentNode.yloc+10);
        line(currentNode.xloc + 25, currentNode.yloc+6, currentNode.xloc + 36, currentNode.yloc+6);
        line(currentNode.xloc + 30.5, currentNode.yloc+1, currentNode.xloc + 30.5, currentNode.yloc+11);
        strokeWeight(0);
        ////////////////\\\\\\\\\\\\\\\\\\\\/////////////////\\\\\\\\\\\\\\\////////\\\\\\\\

        //check collisions
        /*if(nodeController.activeNode != null && currentNode != nodeController.activeNode){
         checkCollision(currentNode, nodeController.activeNode);
         
         }*/
        try {
          for (int j = loadedNodes.size ()-1; j > -1; j--) {
            if (currentNode != loadedNodes.get(j) && !loadedNodes.get(j).deleted) {
              checkCollision(currentNode, loadedNodes.get(j));
            }
          }
        } 
        catch (IndexOutOfBoundsException e) {
          System.err.println("IndexOutOfBoundsException: " + e.getMessage());
        }
      }
    }
  }

  void checkCollision(Node currentNode, Node activeNode) {
    float x = currentNode.xloc; 
    float y = currentNode.yloc;
    float bx = activeNode.xloc;
    float by = activeNode.yloc;
    float myX2 = currentNode.xloc + currentNode.sizex;
    float myY2 = currentNode.yloc + currentNode.sizey;
    float otherX2 = activeNode.xloc + nodeController.activeNode.sizex;
    float otherY2 = activeNode.yloc + activeNode.sizey;
    // If this box is entirely to the left of box b, then there is no collision.  
    if (x < bx && myX2 < bx) return;

    // If this box is entirely to the right of box b, then there is no collision.
    if (x > otherX2 && myX2 > otherX2) {

      return;
    }

    // If this box is entirely above box b, then there is no collision.
    if (y < by && myY2 < by) {

      return;
    }

    // If this box is entirely below box b, then there is no collision.
    if (y > otherY2 && myY2 > otherY2) {

      return;
    }

    // If we reach this point, the boxes haven't missed each other.
    // Therefore, there must be a collision.
    //println("hit");
    if (x >= bx) {
      currentNode.xloc+=5;
    } else {
      currentNode.xloc-=5;
    }
    if (y >= by) {
      currentNode.yloc+=5;
    } else {
      currentNode.yloc-=5;
    }
  }

  void mouseInput(float x, float y) {
    for (int i = 0; i < nodeController.loadedNodes.size (); i++) {
      Node currentNode = nodeController.loadedNodes.get(i);

      //click to select an active node
      if (mouseX >= currentNode.xloc && mouseX <= currentNode.xloc+currentNode.sizex && 
        mouseY >= currentNode.yloc && mouseY <= currentNode.yloc+currentNode.sizey) {
        if (nodeController.activeNode == currentNode) {
        } else {
          nodeController.activeNode = currentNode;
        }
      }

      //click on left button
      if (mouseX >= currentNode.xloc+10 && mouseX <= currentNode.xloc+21 && 
        mouseY >= currentNode.yloc && mouseY <= currentNode.yloc+11) {
        println("clicked on left button");
        if (nodeController.activeNode.children.size() == 0) {
          nodeController.activeNode.deleted = true;
        }
      }

      //click on right button
      if (mouseX >= currentNode.xloc+25 && mouseX <= currentNode.xloc+36 && 
        mouseY >= currentNode.yloc && mouseY <= currentNode.yloc+11) {
        println("clicked on right button");
        nodeController.activeNode.createChild();
      }
    }
  }

  //used to drag an active node ////THIS REALLY NEEDS REFRACTORYING LOOK AT MOUSE DRAG FUNCTION BELOW
  void mouseDown(int x, int y) {    
    if (nodeController.activeNode != null) {
      Node currentNode = nodeController.activeNode;
      if (mouseX >= currentNode.xloc && mouseX <= currentNode.xloc+currentNode.sizex && 
        mouseY >= currentNode.yloc+10 && mouseY <= currentNode.yloc+currentNode.sizey) {
        currentNode.dragging = true;
      }
    }
  }

  //used to end the drag of an active node
  void mouseUp(int x, int y) {
    if (nodeController.activeNode != null) {
      nodeController.activeNode.dragging = false;
    }
  }
}

void mouseDragged() 
{    
  if (nodeController.activeNode != null) {
    Node currentNode = nodeController.activeNode;
    if (mouseX >= currentNode.xloc && mouseX <= currentNode.xloc+currentNode.sizex && 
      mouseY >= currentNode.yloc+10 && mouseY <= currentNode.yloc+currentNode.sizey) {
    } else {

      for (int i = 0; i < nodeController.loadedNodes.size (); i++) {
        Node aNode =  nodeController.loadedNodes.get(i);
        aNode.xloc += (mouseX -pmouseX);
        aNode.yloc += (mouseY - pmouseY);
      }
    }
  }
  
}

