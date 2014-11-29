PrintWriter output;

public class NodeController{
  Node activeNode;
  ArrayList<Node> loadedNodes = new ArrayList<Node>();
  
 public void loadNodes(){};
 
 public boolean saveNodes(){
    output = createWriter("qwret.txt");
    for (int i = loadedNodes.size()-1; i > -1; i--) {
      Node ln = loadedNodes.get(i);
      if(!ln.deleted){
        println(ln.heading);
        output.println(ln.heading);
      }
    }
    output.close();
    output.flush();
    exit();
    return true;
 }
 
 //this is called from [[benmap]]
 public void createMainNode(){
   println("this is called from nodeController");
   Node newNode = new Node();
   loadedNodes.add(newNode);
   activeNode = newNode;
 };
 
}
