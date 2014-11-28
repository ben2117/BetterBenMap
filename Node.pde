public class Node{
  //location and size
  int xloc = 375;
  int yloc = 300;
  int sizex = 100;
  int sizey = 100;
  
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
  
}
