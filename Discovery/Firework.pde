public class Firework{

  private float hue = random(255);
  private Boolean exploded = false;
  private ArrayList<Particle> particles = new ArrayList<>();
  private Particle firework = new Particle(random(-width/2 + width/8, width/2 - width/8), height/2 - height/10, true, hue, false);

  void update(){
    if (!exploded){  
      firework.applyForce(gravity);
      firework.update();
      if (firework.velocity.y >= 0){
        exploded = true;
        explode();
      }
    } else {
      for (int i = 0; i < particles.size(); i++){
        particles.get(i).applyForce(gravity);
        particles.get(i).update();
        if (particles.get(i).done()){
          particles.remove(particles.get(i));
        }
      }
    }
  }
  
  void show(){
    if (!exploded){
      firework.show();
    }  
    for(int i=0; i < particles.size(); i++){
      particles.get(i).show();
    }
  }
  
  void explode(){
    r = 10;
    if (random(1) < nbHearts/100){
      for (float i = -PI; i < PI; i+= 0.08){
          dx = r * 16 * pow(sin(i), 3) -10;
          dy = -r * (13 * cos(i) -5*cos(2 * i) -2*cos(3 * i) -cos(4 * i));
          Particle p = new Particle(firework.position.x, firework.position.y, false, hue, true);
          particles.add(p);
      }
    } else {
      for (int i = 0; i < 100; i++){
        Particle p = new Particle(firework.position.x, firework.position.y, false, hue, false);
        particles.add(p);
      }
    }
  }
  
  Boolean done(){
    return exploded && particles.size() == 0;
  }
  
}
