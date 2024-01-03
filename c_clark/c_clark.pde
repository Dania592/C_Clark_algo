MeshBuilder mshB = new MeshBuilder();
float xRotation, yRotation;
Mesh mesh;
PShape object;
void setup(){
  size(1700, 1000, P3D);
  mesh = mshB.getCube();
  xRotation=0;
  yRotation=0;
}

void draw(){
  background(255);
  translate(width/2, height/3);
  
  if(yRotation > 360){
    yRotation =0;
  }
  yRotation +=0.01;
  rotateY(yRotation);
  
  for(Face face : mesh.getFaces()){     
     for(Edge edge : face.getEdges()){
        stroke(0, 0, 0);
        strokeWeight(5);
        beginShape(LINES);
        Point pointA = edge.getA();
        Point pointB = edge.getB();
        vertex(pointA.getX(), pointA.getY(), pointA.getZ());
        vertex(pointB.getX(), pointB.getY(), pointB.getZ());
        endShape();  
     } 
  }
}

void keyPressed(){
 if(key == 's'){
    subdivision(mesh);
 }
}


void subdivision(Mesh mesh){
  ArrayList<Face> subFaces = new ArrayList();
  for(Face face : mesh.getFaces()){
     Point facePoint = face.getFacePoint();
   
     for(int i = 0; i < face.getEdges().size(); i++){
       Edge edge = face.getEdges().get(i);
       Point pointB = edge.getB();
       
       Point bary = mesh.getBarycentrePoint(pointB);
        
       Point edgePoint = mesh.newEdgePoint(edge);

       Edge faceEdge = new Edge(facePoint, edgePoint);
           
       Edge edgeBary = new Edge(edgePoint, bary);
       
       int next = i+1;
       if(i == face.getEdges().size()-1){
         next = 0;
       }
       Edge nextEdge = face.getEdges().get(next);
       Point nextcenter = mesh.newEdgePoint(nextEdge);
       
       Edge nextEdgeBary = new Edge(bary, nextcenter);
       
       Edge nextEdgeFace = new Edge(nextcenter, facePoint);
       
       Face newFace = new Face();
       newFace.addEdge(faceEdge);
       newFace.addEdge(edgeBary);
       newFace.addEdge(nextEdgeBary);
       newFace.addEdge(nextEdgeFace);
       subFaces.add(newFace);
      
     } 
  }
  mesh.setFaces(subFaces);
}
