public class NodeController{
  Node activeNode;
  ArrayList<Node> loadedNodes = new ArrayList<Node>();
  
 public void loadNodes(){};
 
 //this is called from [[benmap]]
 public void createMainNode(){
   println("this is called from nodeController");
   Node newNode = new Node();
   loadedNodes.add(newNode);
   activeNode = newNode;
 };
 
}
