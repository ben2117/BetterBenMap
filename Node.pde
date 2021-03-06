public class Node{
  //location and size
  float id;
  int xloc = 375;
  int yloc = 300;
  float sizex = 120;
  float sizey = 80;
  boolean deleted = false;
  String heading = "\n";
  
  //used to know how well you remember
  int weighting = 100;
  
  
  boolean dragging = false;
  
  Node parent; 
  
  float parentid;
  
  ArrayList<Node> children = new ArrayList<Node>();
 
  public Node(float id){
   this.id = id; 
  }
  
  public Node(){
   this.id = random(9999999);  
  }
  
  public void inputText(char text){    //makes Node box bigger as you type
    if(text == 10){
      sizey+=10;
    }
    heading += text;
    if(heading.length() > 20 && heading.length() < 90){
     sizex+=3.8;
    }
    else if (heading.length() > 90){
      sizey+=0.5;
    }
  };
  //////////////////////////implement gravity on text
  
  public void deleteText(){
    try{
    heading = heading.substring( 0, heading.length()-1 );
    } catch (Exception e){};
    
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
