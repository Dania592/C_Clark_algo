public class Edge{
  
  private Point a;
  private Point b;
  
  public Edge(Point a, Point b){
   this.a = a;
   this.b = b;
  }
  
  public Point getEdgePoint(){
    float x = (a.getX() + b.getX())/2;
    float y = (a.getY() + b.getY())/2;
    float z = (a.getZ() + b.getZ())/2;
    return new Point(x, y, z);
  }
  
  public Point getA(){
    return a;
  }
  
  public Point getB(){
    return b;
  }
  
  public Boolean containsPoint(Point point){
    return a.equals(point) || b.equals(point);
  }
  
  public Boolean equals(Edge edge){
   return a.equals(edge.getA()) && b.equals(edge.getB()) || a.equals(edge.getB()) && b.equals(edge.getA()); 
  }
  
}
