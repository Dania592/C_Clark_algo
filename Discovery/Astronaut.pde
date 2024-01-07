public class Astronaut {
  
  private float y = height/5;
  private float x = 0;
  private PImage image;
  
  public Astronaut(PImage img){
    image = img;
  }
  
  void show(){
    image(image, x, y);
  }
  
  void updateX(float dx){
    if ((((x+dx) <= cos(PI/3) * width/2)) && (((x+dx) >= - sin(PI/3) * width/2))){
       x += dx;
    } 
    if (x > cos(PI/3) * width/2){
      x = cos(PI/3) * width/2;
    }
    if (x < -sin(PI/3) * width/2){
      x = -sin(PI/3) * width/2;
    }
  }
  
    void updateY(float dy){
    if ((((y+dy) <= cos(PI/3) * height/2)) && (((y+dy) >= - sin(PI/3) * height/2))){
       y += dy;
    } 
    if (y > cos(PI/3) * height/2){
      y = cos(PI/3) * height/2;
    }
    if (y < -sin(PI/3) * height/2){
      y = -sin(PI/3) * height/2;
    }
  }
  
}
