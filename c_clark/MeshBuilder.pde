public class MeshBuilder{
  private float cubeWidth = 200;
  private float cubeHeight = 200;
  private float cubeDept = 200;
  
  private float cubeWidthPlus = 300;
  private float cubeHeightPlus = 400;
  private float cubeWidthMoins = -50;
  
  public Mesh getPentagone(){
    Mesh mesh = new Mesh();
    Face face = new Face();
    Point A = new Point(0,0,0);
    Point B = new Point(cubeWidth,0,0);
    Point C = new Point(cubeWidthPlus,cubeHeight,0);
    Point D = new Point(cubeWidth/2,cubeHeightPlus,0);
    Point E = new Point(cubeWidthMoins,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, E));
    face.addEdge(new Edge(E, A));
    mesh.addFace(face);
    
    
    face = new Face();
    A = new Point(0,0,0);
    B = new Point(0,0,cubeDept);
    C = new Point(cubeWidthMoins,cubeHeight,cubeDept);
    D = new Point(cubeWidthMoins,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    
    face = new Face();
    A = new Point(cubeWidth,0,0);
    B = new Point(cubeWidthPlus,cubeHeight,0);
    C = new Point(cubeWidthPlus,cubeHeight,cubeDept);
    D = new Point(cubeWidth,0,cubeDept);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(0,0,0);
    B = new Point(cubeWidth,0,0);
    C = new Point(cubeWidth,0,cubeDept);
    D = new Point(0,0,cubeDept);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(0,0,cubeDept);
    B = new Point(cubeWidth,0,cubeDept);
    C = new Point(cubeWidthPlus,cubeHeight,cubeDept);
    D = new Point(cubeWidth/2,cubeHeightPlus,cubeDept);
    E = new Point(cubeWidthMoins,cubeHeight,cubeDept);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, E));
    face.addEdge(new Edge(E, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(cubeWidthMoins,cubeHeight,cubeDept);
    B = new Point(cubeWidth/2,cubeHeightPlus,cubeDept);
    C = new Point(cubeWidth/2,cubeHeightPlus,0);
    D = new Point(cubeWidthMoins,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(cubeWidthPlus,cubeHeight,cubeDept);
    B = new Point(cubeWidth/2,cubeHeightPlus,cubeDept);
    C = new Point(cubeWidth/2,cubeHeightPlus,0);
    D = new Point(cubeWidthPlus,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
   
   return mesh;
  }
  
  
   public Mesh getCube(){
    Mesh mesh = new Mesh();
    
    Face face = new Face();
    Point A = new Point(0,0,0);
    Point B = new Point(cubeWidth,0,0);
    Point C = new Point(cubeWidth,cubeHeight,0);
    Point D = new Point(0,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    
    face = new Face();
    A = new Point(0,0,0);
    B = new Point(0,0,cubeDept);
    C = new Point(0,cubeHeight,cubeDept);
    D = new Point(0,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    
    face = new Face();
    A = new Point(cubeWidth,0,0);
    B = new Point(cubeWidth,cubeHeight,0);
    C = new Point(cubeWidth,cubeHeight,cubeDept);
    D = new Point(cubeWidth,0,cubeDept);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(0,0,0);
    B = new Point(cubeWidth,0,0);
    C = new Point(cubeWidth,0,cubeDept);
    D = new Point(0,0,cubeDept);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(0,0,cubeDept);
    B = new Point(cubeWidth,0,cubeDept);
    C = new Point(cubeWidth,cubeHeight,cubeDept);
    D = new Point(0,cubeHeight,cubeDept);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(0,cubeHeight,cubeDept);
    B = new Point(cubeWidth,cubeHeight,cubeDept);
    C = new Point(cubeWidth,cubeHeight,0);
    D = new Point(0,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
     
   return mesh;
  }
  
  
  public Mesh getPolygonalShape(){
    Mesh mesh = new Mesh();
    Face face = new Face();
    Point A = new Point(0,0,0);
    Point B = new Point(cubeWidth,0,0);
    Point C = new Point(cubeWidthPlus,cubeHeight,0);
    Point D = new Point(cubeWidth/2,cubeHeightPlus,0);
    Point E = new Point(cubeWidthMoins,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, E));
    face.addEdge(new Edge(E, A));
    mesh.addFace(face);
    
    
    face = new Face();
    A = new Point(0,0,0);
    B = new Point(-100,0,cubeDept*2);
    C = new Point(cubeWidthMoins*2,cubeHeight,cubeDept*2);
    D = new Point(cubeWidthMoins,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    
     face = new Face();
    A = new Point(0,0,0);
    B = new Point(-100,0,cubeDept*2);
    C = new Point(cubeWidthMoins*2,cubeHeight,cubeDept*2);
    D = new Point(cubeWidthMoins,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
        
    
    face = new Face();
    A = new Point(cubeWidth,0,0);
    B = new Point(cubeWidthPlus,cubeHeight,0);
    C = new Point(cubeWidthPlus*2,cubeHeight,cubeDept*2);
    D = new Point(cubeWidth*2,0,cubeDept*2);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(0,0,0);
    B = new Point(cubeWidth,0,0);
    C = new Point(cubeWidth*2,0,cubeDept*2);
    D = new Point(-100,0,cubeDept*2);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(-100,0,cubeDept*2);
    B = new Point(cubeWidth*2,0,cubeDept*2);
    C = new Point(cubeWidthPlus*2,cubeHeight,cubeDept*2);
    D = new Point(cubeWidth/2,cubeHeightPlus*2,cubeDept*2);
    E = new Point(cubeWidthMoins*2,cubeHeight,cubeDept*2);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, E));
    face.addEdge(new Edge(E, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(cubeWidthMoins*2,cubeHeight,cubeDept*2);
    B = new Point(cubeWidth/2,cubeHeightPlus*2,cubeDept*2);
    C = new Point(cubeWidth/2,cubeHeightPlus,0);
    D = new Point(cubeWidthMoins,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
    
    face = new Face();
    A = new Point(cubeWidthPlus*2,cubeHeight,cubeDept*2);
    B = new Point(cubeWidth/2,cubeHeightPlus*2,cubeDept*2);
    C = new Point(cubeWidth/2,cubeHeightPlus,0);
    D = new Point(cubeWidthPlus,cubeHeight,0);
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
   
   return mesh;
  }
  
  
  
}
