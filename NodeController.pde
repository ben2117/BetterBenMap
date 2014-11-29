public class NodeController{
  Node activeNode;
  ArrayList<Node> loadedNodes = new ArrayList<Node>();
  
 public void loadNodes(){};
 public boolean saveNodes(){return false;};
 
 //this is called from [[benmap]]
 public void createMainNode(){
   println("this is called from nodeController");
   Node newNode = new Node();
   loadedNodes.add(newNode);
   activeNode = newNode;
 };
 
}
