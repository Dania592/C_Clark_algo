import controlP5.*;

MeshBuilder mshB = new MeshBuilder();
Mesh mesh;

ArrayList<Point> baryCentersPoints;
ArrayList<Point> edgePoints;
ArrayList<Point> facePoints;

Boolean details;
Boolean lineDisplay;
float xRotation, yRotation;
float scaleShape;

ControlP5 cp5;
Button showPoints;
Button subdivade;
Button pentagone;
Button cube;
Button polgonalShape;
Button display;

ColorPicker colorPicker;

Slider scaleSlider;


void setup(){
  size(1700, 950, P3D);
  
  xRotation=0;
  yRotation=0;
  
  baryCentersPoints = new ArrayList();
  edgePoints = new ArrayList();
  facePoints = new ArrayList();
  
  details = true;
  lineDisplay = false;
  scaleShape = 100;
  
  mesh = mshB.getCube();
  cp5 = new ControlP5(this);
    
  showPoints = cp5.addButton("showPoints")
     .setValue(0)
     .setLabel("details")
     .setPosition(width-300,150)
     .setSize(200,30);
     
   scaleSlider = cp5.addSlider("scaleSlider")
     .setPosition(100,50)
     .setSize(200,30)
     .setRange(50,150)
     .setValue(100)
     .setCaptionLabel("scale")
     .setColorValueLabel(0)
     .setColorTickMark(0)
     .setColorLabel(0);
     
   cp5.getController("scaleSlider").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
   cp5.getController("scaleSlider").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  subdivade = cp5.addButton("subdivade")
     .setLabel("smoother")
     .setPosition(width-300,100)
     .setSize(200,30);
     
   pentagone = cp5.addButton("pentagone")
     .setLabel("pentagone")
     .setPosition(100,200)
     .setSize(200,30);   
     
   cube = cp5.addButton("cube")
     .setLabel("cube")
     .setPosition(100,250)
     .setSize(200,30);    
     
   polgonalShape = cp5.addButton("polgonalShape")
     .setLabel("polgonal Shape")
     .setPosition(100,300)
     .setSize(200,30);
     
   display = cp5.addButton("display")
     .setLabel("changer l'affichage")
     .setPosition(width - 300, height - 300)
     .setSize(200,30); 
     
  colorPicker = cp5.addColorPicker("picker")
                .setPosition(100, 100)
                .setColorValue(color(255, 0, 0));
     
}

void draw(){
  background(255);
  pushMatrix();
  translate(width/2, height/3);
  
  if(yRotation > 360){
    yRotation =0;
  }
  yRotation +=0.01;
  rotateY(yRotation);
  
  scale(scaleShape/100);
  
  if(lineDisplay){
    drawWithLines();
  }
  else{
    drawWithSurface();
  }
    
  if(details){
    for(Point point : facePoints){
      stroke(255,0,0);
      strokeWeight(10);
      pushMatrix();
      lights();
      translate(point.getX(), point.getY(), point.getZ());
      sphere(10);
      popMatrix();
    }
    
    for(Point point : edgePoints){
      stroke(73,227,23);
      strokeWeight(10);
      pushMatrix();
      lights();
      translate(point.getX(), point.getY(), point.getZ());
      sphere(10);
      popMatrix();
    }
    
    for(Point point : baryCentersPoints){
      stroke(224,36,171);
      strokeWeight(10);
      pushMatrix();
      lights();
      translate(point.getX(), point.getY(), point.getZ());
      sphere(10);
      popMatrix();
    }
  }
  popMatrix();
  showPoints.bringToFront();
  scaleSlider.bringToFront();
}

public void drawWithLines(){
  for(Face face : mesh.getFaces()){ 
     for(Edge edge : face.getEdges()){
       stroke(0, 0, 0);
       strokeWeight(5);
        Point pointA = edge.getA();
        Point pointB = edge.getB();
        beginShape(LINES);
        vertex(pointA.getX(), pointA.getY(), pointA.getZ());
        vertex(pointB.getX(), pointB.getY(), pointB.getZ());
        endShape();
     }
     
  }
}

public void drawWithSurface(){
  for(Face face : mesh.getFaces()){ 
    stroke(0, 0, 0);
    fill(120);
    strokeWeight(5);
    beginShape();
    
     for(Edge edge : face.getEdges()){   
        Point pointA = edge.getA();
        Point pointB = edge.getB();
        vertex(pointA.getX(), pointA.getY(), pointA.getZ());
        vertex(pointB.getX(), pointB.getY(), pointB.getZ());
          
     }
     endShape();
  }
}

public void display(){
  if(lineDisplay){
    lineDisplay = false;
  }else{
    lineDisplay = true;
  }
}

public void showPoints() {
  details = !details;
}

public void pentagone(){
  mesh = mshB.getPentagone();
}

public void cube(){
  mesh = mshB.getCube();
}

public void polgonalShape(){
  mesh = mshB.getPolygonalShape();
}

public void scaleSlider(){  
  if(scaleSlider != null){
    scaleShape = scaleSlider.getValue();
  }  
}

public void subdivade(){
   baryCentersPoints = new ArrayList();
   edgePoints = new ArrayList();
   facePoints = new ArrayList();
   subdivision(mesh);
}

void keyPressed(){
 if(key == 's'){
   baryCentersPoints = new ArrayList();
   edgePoints = new ArrayList();
   facePoints = new ArrayList();
   subdivision(mesh);
 }
}


void subdivision(Mesh mesh){
  ArrayList<Face> subFaces = new ArrayList();
  for(Face face : mesh.getFaces()){
     Point facePoint = face.getFacePoint();
     facePoints.add(facePoint);
     
     for(int i = 0; i < face.getEdges().size(); i++){
       Edge edge = face.getEdges().get(i);
       Point pointB = edge.getB();
       
       Point bary = mesh.getBarycentrePoint(pointB);
       baryCentersPoints.add(bary);
       
       Point edgePoint = mesh.newEdgePoint(edge);
       edgePoints.add(edgePoint);
       
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
