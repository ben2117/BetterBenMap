public class Node{
  //location and size
  int xloc = 375;
  int yloc = 300;
  int sizex = 100;
  int sizey = 100;
  boolean deleted = false;
  String heading = "\n";
  
  
  boolean dragging = false;
  
  Node parent;
  ArrayList<Node> children = new ArrayList<Node>();
 
  
  public void inputText(char text){
    heading += text;
    if(heading.length() > 81){
     sizex+=1; 
    }
  };
  
  public void deleteText(){
    heading = heading.substring( 0, heading.length()-1 );
  }
  
  public void createChild(){
   Node child = new Node();
   nodeController.activeNode = child;
   child.xloc = this.xloc + 200;
   child.yloc = this.yloc;
   child.parent = this;
   nodeController.loadedNodes.add(child);
   
   children.add(child);
   
   println("new child created");
  }
  
}
