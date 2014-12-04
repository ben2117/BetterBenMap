public class CardViewController extends ViewController {
  
  ArrayList<Node> mainNodes = new ArrayList<Node>();
  int mainNode;
  Node currentNode;
  boolean flipCard = true;
  
  public void generateMainList(){
      ///////kludge solution
      currentNode = new Node();
      currentNode.children = (ArrayList<Node>)mainNodes.clone();
      flipCard = true;
  }
  
  
  
  public CardViewController(){
    ArrayList<Node> loadedNoads = nodeController.loadedNodes;
    for (int i = loadedNoads.size()-1; i > -1; i--) {
     if( loadedNoads.get(i).parent == null){
       mainNodes.add(loadedNoads.get(i));
     }
    }
    try{
      //currentNode = nodeController.activeNode;///
      //mainNode = 0;
      generateMainList();
      
    } catch (Exception e){
      println(e);
    }
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
      textSize(24);
      text(currentNode.heading, 250, 200);
    }
    
    fill(0, 102, 153);                             ////////return to previous Card
    rect(200, 210, 30, 30);
    fill(255);
    textSize(40);
    text("<", 199, 236.5);
    fill(0);
    
    fill(0, 102, 153);                            /////////buttons to decide how relevant a Card is
    rect(20, 300, 80, 30);
    fill(255);
    textSize(14);
    text("irrelevant",25, 321);
    fill(0);
    
    fill(0, 102, 153);
    rect(20, 340, 80, 30);
    fill(255);
    textSize(14);
    text("learn",25, 361);
    fill(0);
        
    fill(0, 102, 153);
    rect(20, 380, 80, 30);
    fill(255);
    textSize(14);
    text("revise",25, 401);
    fill(0);
    
    fill(0, 102, 153);
    rect(20, 420, 80, 30);
    fill(255);
    textSize(14);
    text("mastered",25, 441);
    fill(0);
    
    
    
    
    
    
    
    
    
    
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
    
    else if(mouseX >= 20 && mouseX <= 20+80 && 
        mouseY >= 300 && mouseY <= 300+30) {
        println("irrelevant button clicked");
      }
      
    else if(mouseX >= 20 && mouseX <= 20+80 && 
        mouseY >= 340 && mouseY <= 340+30) {
        println("learn button clicked");
      }
      
    else if(mouseX >= 20 && mouseX <= 20+80 && 
        mouseY >= 380 && mouseY <= 380+30) {
        println("revise button clicked");
      }
      
    else if(mouseX >= 20 && mouseX <= 20+80 && 
        mouseY >= 420 && mouseY <= 420+30) {
        println("mastered button clicked");
      }
    
    //allow to traverse up to parent node from < button
    else if(mouseX >= 200 && mouseX <= 200+30 && 
        mouseY >= 210 && mouseY <= 210+30) {
      if(currentNode.parent != null){
       currentNode = currentNode.parent;
       flipCard = false;
      }
      
    }
    //return to main node list
    else if(mouseX >= 100 && mouseX <= 180 && 
        mouseY >= 130 && mouseY <= 100+70){
          generateMainList();
        }
    if(flipCard){
      ///check for children nodes
      int spacey = 300;
      for(int i = 0; i < currentNode.children.size(); i++){
        if(mouseY >= spacey && mouseY <= spacey+50){
          currentNode = currentNode.children.get(i);
          flipCard = false;
        }
        spacey = spacey+50;
      }
    }
    
  }
}
