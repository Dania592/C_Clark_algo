public class MeshBuilder{
  private float cubeWidth = 400;
  private float cubeHeight = 400;
  private float cubeDept = 400;
  
  private float cubeWidthPlus = 500;
  private float cubeHeightPlus = 600;
  private float cubeWidthMoins = -100;
  
  public Mesh getCube(){
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
    
    //face = new Face();
    //A = new Point(cubeWidthMoins,cubeHeight,cubeDept);
    //B = new Point(cubeWidth/2,cubeHeightPlus,cubeDept);
    //C = new Point(cubeWidth/2,cubeHeightPlus,0);
    //D = new Point(cubeWidthMoins,cubeHeight,0);
    //face.addEdge(new Edge(A, B));
    //face.addEdge(new Edge(B, C));
    //face.addEdge(new Edge(C, D));
    //face.addEdge(new Edge(D, A));
    //mesh.addFace(face);
    
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
  
}
