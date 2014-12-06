JSONObject json;

public class NodeController{
  Node activeNode;
  ArrayList<Node> loadedNodes = new ArrayList<Node>();
 
 public boolean saveNodes(){
    JSONArray nodes = new JSONArray();
    
    for (int i = loadedNodes.size()-1; i > -1; i--) {
      Node ln = loadedNodes.get(i);
      if(!ln.deleted){
        //println(ln.heading);
        JSONObject node = new JSONObject();
        node.setFloat("id", ln.id);
        node.setInt("xloc", ln.xloc);
        node.setInt("yloc", ln.yloc);
        node.setFloat("sizex", ln.sizex);
        node.setFloat("sizey", ln.sizey);
        node.setString("heading", ln.heading);
        if(ln.parent != null){
          node.setFloat("parent", ln.parent.id);
        } else {
          node.setFloat("parent", 0);
        }
        
        nodes.setJSONObject(i, node);
      }
    }
    
    //json = new JSONObject();
    //json.setJSONArray("nodes", nodes);
    saveJSONArray(nodes, "nodes.json");
    
    return true;
 }
 
 public boolean loadedNodes(){
    JSONArray nodes = loadJSONArray("nodes.json");
    loadedNodes.clear();
    loadedNodes = new ArrayList<Node>();
    
    for(int i = 0; i < nodes.size(); i++){
      JSONObject node = nodes.getJSONObject(i);
   
      Node newNode = new Node(node.getFloat("id"));
      newNode.xloc = node.getInt("xloc");
      newNode.yloc = node.getInt("yloc");
      newNode.sizex = node.getFloat("sizex");
      newNode.sizey = node.getFloat("sizey");
      newNode.heading = node.getString("heading");
      newNode.parentid = node.getFloat("parent");
      
      loadedNodes.add(newNode);
      
      
    }
   
   for(int i = loadedNodes.size()-1; i > -1; i--) {
    
     Node nenode = loadedNodes.get(i);
     
     if(nenode.parentid != 0){
       
       for(int j = loadedNodes.size()-1; j > -1; j--) {
         
         //println("added child " + loadedNodes.get(j).id +" to " + nenode.parentid);
         Node potentialParent = loadedNodes.get(j);
         if(nenode.parentid == potentialParent.id){
           potentialParent.children.add(nenode);
           nenode.parent = potentialParent;
           
            println("added child " + nenode.id +" to " + potentialParent.id);
         }
       }
     }
     activeNode = loadedNodes.get(0); 
   }

   
   
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
