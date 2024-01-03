public class Face{
 
  private ArrayList<Edge> edges;
  
  public Face(){
   edges = new ArrayList(); 
  }
 
  public void addEdge(Edge edge){
    edges.add(edge);
  }
  
  public Point getFacePoint(){
   float sx = 0;
   float sy = 0;
   float sz = 0;
   
   for(Edge edge : this.edges){
         sx += edge.getA().getX();
         sy += edge.getA().getY();
         sz += edge.getA().getZ();
   }
   
   int n = edges.size();
   return new Point(sx/n, sy/n, sz/n);
  }
  
  public void addPoint(Point point){
    Edge last = edges.get(edges.size()-1);
    Edge newEdge = new Edge(last.getB(), point);
    edges.add(newEdge);
  }
  
  public Boolean containsEdge(Edge edge){
    for(Edge e : edges){
     if(e.equals(edge)){
       return true;
     }
   }
   return false;
  }
  
  public Boolean containsPoint(Point point){
   for(Edge edge : edges){
     if(edge.containsPoint(point)){
       return true;
     }
   }
   return false;
  }
  
  public ArrayList<Edge> getEdges(){
    return edges;
  }
  
}
