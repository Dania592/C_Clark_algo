public class Mesh{
 
  private ArrayList<Face> faces;
  
  public Mesh(){
    faces = new ArrayList();  
  }
 
  public void addFace(Face face){
    faces.add(face);
  }
  public ArrayList<Face> getFaces(){
    return faces;
  }
  public Face getFace(int index){
    return faces.get(index);
  }
  
  public Point newEdgePoint(Edge edge){
    float sx, sy, sz;
    int n = 2;
    sx = edge.getA().getX() + edge.getB().getX();
    sy = edge.getA().getY() + edge.getB().getY();
    sz = edge.getA().getZ() + edge.getB().getZ();
    
    for(Face face : faces){
     if(face.containsEdge(edge)){       
        n++;        
        Point facePoint = face.getFacePoint();
        sx += facePoint.getX();
        sy += facePoint.getY();
        sz += facePoint.getZ();  
     }
    } 
     return new Point(sx/n, sy/n, sz/n);
  }
  
  public Point getBarycentrePoint(Point point){
    int n = 0;
    float sx, sy, sz;
    float fx, fy, fz;
    float rx, ry, rz;
    fx = fy = fz =0;
    rx = ry = rz =0;
    for(Face face : faces){
      if(face.containsPoint(point)){
        n++;
        fx += face.getFacePoint().getX();
        fy += face.getFacePoint().getY();
        fz += face.getFacePoint().getZ();
        
        for(Edge edge : face.getEdges()){
          if(edge.containsPoint(point)){
            rx += edge.getEdgePoint().getX()/2;
            ry += edge.getEdgePoint().getY()/2;
            rz += edge.getEdgePoint().getZ()/2;
          }
        }
      }
    }
    
    sx = fx/n + 2*rx/n + (n-3)*point.getX();
    sy = fy/n + 2*ry/n + (n-3)*point.getY();
    sz = fz/n + 2*rz/n + (n-3)*point.getZ();
   
    return new Point(sx/n, sy/n, sz/n);
}

public void setFaces(ArrayList<Face> faces){
 this.faces = faces; 
}
}
