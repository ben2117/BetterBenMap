public class CardViewController extends ViewController {
  
  ArrayList<Node> mainNodes = new ArrayList<Node>();
  int mainNode;
  Node currentNode;
  boolean flipCard = false;
  
  public CardViewController(){
    ArrayList<Node> loadedNoads = nodeController.loadedNodes;
    for (int i = loadedNoads.size()-1; i > -1; i--) {
     if( loadedNoads.get(i).parent == null){
       mainNodes.add(loadedNoads.get(i));
     }
    }
    try{
      currentNode = mainNodes.get(0);
      mainNode = 0;
    } catch (Exception e){};
  }
  
  void drawView(ArrayList<Node> nodeController) {
    textSize(32);
    fill(0, 102, 153);
    text("Card", 100, 130); 
    text("View", 110, 160);
    
    rect(200, 100, 100, 70);
    fill(255);
    text("Flip", 220, 145);
    fill(0);
    if(currentNode != null){
      text(currentNode.heading, 250, 200);
    }
    
    if(flipCard){
      int spacex = 250;
      int spacey = 300;
      for (int i = 0; i < currentNode.children.size(); i++ ) {
        if(currentNode.children.get(i).children.size() > 0){
          textSize(20);
        }
        else{
          textSize(16);
        }
        text(currentNode.children.get(i).heading, spacex, spacey);
        spacey+= 50;
      }
    }
    
  }
  
  void mouseDown(int x,int y){
    if (mouseX >= 200 && mouseX <= 200+100 && 
        mouseY >= 100 && mouseY <= 100+70) {
          if(flipCard == false){ flipCard = true; } else {flipCard = false;};
    }
    if(flipCard){
      ///check for buttons
    }
    
  }
}
