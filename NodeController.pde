void folderSelectedSave(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    nodeController.saveNodes(selection);
    println("User selected " + selection.getAbsolutePath());
  }
}

void folderSelectedLoad(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    nodeController.loadedNodes(selection);
    println("User selected " + selection.getAbsolutePath());
  }
}


JSONObject json;



//// There are problems with loading due to nulls in the json file and 
//// There are problems with crazy charactors getting saved in the json file




public class NodeController {
  Node activeNode;
  ArrayList<Node> loadedNodes = new ArrayList<Node>();



    private String sanatizeString(String heading){
       
      ////SANATIZING THE FUCKING FUCK FUCK STRING
        
        String[] st1 = splitTokens(heading);
        for(int h = 0; h < st1.length; h++){
         if(!(st1[h].matches("[^\"[a-zA-Z]\n]*"))){
           st1[h] = "\n";
         }
        }
        
        
        StringBuilder builder = new StringBuilder();
        for(String s : st1) {
            builder.append(s);
        }
        String x = builder.toString();
        ///end sanatizing said string
        
        return heading;
    }



  public boolean saveNodes(File selection) {
    JSONArray nodes = new JSONArray();

    for (int i = loadedNodes.size ()-1; i > -1; i--) {
      Node ln = loadedNodes.get(i);
      if (!ln.deleted) {
        //println(ln.heading);
        JSONObject node = new JSONObject();
        node.setFloat("id", ln.id);
        node.setInt("xloc", ln.xloc);
        node.setInt("yloc", ln.yloc);
        node.setFloat("sizex", ln.sizex);
        node.setFloat("sizey", ln.sizey);
        
      
        String x = sanatizeString(ln.heading);
        node.setString("heading", x);

        
        node.setInt("weighting", ln.weighting);
        if (ln.parent != null) {
          node.setFloat("parent", ln.parent.id);
        } else {
          node.setFloat("parent", 0);
        }
        nodes.setJSONObject(i, node);
      }
    }
    
    for(int i = 0; i < nodes.size(); i++){
     if(nodes.getJSONObject(i) == null){
       nodes.remove(i);
     }
    }
  
    //json = new JSONObject();
    //json.setJSONArray("nodes", nodes);
    //println(selection.getAbsolutePath()+"/"+this.loadedNodes.get(0).heading+"nodes.json");
    
    
    //try and sanatize the sanatization so that it works with file directory by sanatizing trimming and removing new lines
    String y = "/"+sanatizeString(loadedNodes.get(0).heading);
    String x = y.trim();
    x = x.replace("\n", "");
    saveJSONArray(nodes, selection.getAbsolutePath()+x+".btbmap");

    return true;
  }

  public boolean loadedNodes(File selection) {
    JSONArray nodes = loadJSONArray(selection.getAbsolutePath());
    loadedNodes.clear();
    loadedNodes = new ArrayList<Node>();

    for (int i = 0; i < nodes.size (); i++) {
      JSONObject node = nodes.getJSONObject(i);
      
        Node newNode = new Node(node.getFloat("id"));
        newNode.xloc = node.getInt("xloc");
        newNode.yloc = node.getInt("yloc");
        newNode.sizex = node.getFloat("sizex");
        newNode.sizey = node.getFloat("sizey");
        
        newNode.heading = node.getString("heading");
        newNode.parentid = node.getFloat("parent");
        //add 10 to weighting everytime you load 
        newNode.weighting = node.getInt("weighting") + 7;
        
          loadedNodes.add(newNode);
      
    }

    for (int i = loadedNodes.size ()-1; i > -1; i--) {

      Node nenode = loadedNodes.get(i);

      if (nenode.parentid != 0) {

        for (int j = loadedNodes.size ()-1; j > -1; j--) {

          //println("added child " + loadedNodes.get(j).id +" to " + nenode.parentid);
          Node potentialParent = loadedNodes.get(j);
          if (nenode.parentid == potentialParent.id) {
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
  public void createMainNode() {
    println("this is called from nodeController");
    Node newNode = new Node();
    loadedNodes.add(newNode);
    activeNode = newNode;
  };
}

