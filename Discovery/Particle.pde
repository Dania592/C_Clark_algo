public class Particle{

  private PVector acceleration;
  private int lifespan = 255;
  private Boolean firework;
  private PVector position;
  private PVector velocity;
  private Boolean heart;
  private float hue;
  
  Particle(float x, float y, Boolean firework, float hue, Boolean heart){
    this.heart = heart;
    this.firework = firework;
    this.hue = hue; 
    position = new PVector(x, y);
    if (firework){
      velocity = new PVector(0,random(-14, -10));
    } else {
        velocity = PVector.random2D();
        if (!this.heart){
          velocity.mult(random(1,6));
        } else {
          velocity.add(new PVector(dx, dy));
        }
        lifespan -= 4;
    }
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }

  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void show(){
    if (!firework){
      strokeWeight(2);
      stroke(hue, 255, 255, lifespan);
    } else {
      strokeWeight(5);
      stroke(hue, 255, 255);
    }
    point(position.x, position.y);
    strokeWeight(2);
  }
  
  Boolean done(){
    return lifespan < 0;
  }
  
}
