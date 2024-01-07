import controlP5.*;
import peasy.*;
import java.awt.event.KeyEvent;

int cols, rows, w = 2900, h = 1000, scale = 20, MAX_OFFSET = 300;
Boolean space = false, firework = false, cube = true;
ArrayList<Firework> fireworks = new ArrayList();
controlP5.Slider fireworkSlider, heartsSlider;
float x, y, r, dx, dy, speed, pz, camera = 0;
boolean[] pressed = new boolean[256];
controlP5.ColorWheel groundColor;
Star[] stars = new Star[600];
float nbFireworks,nbHearts;
Astronaut astronaut;
float[][] terrain;
ControlP5 cp5;
PVector gravity;

void setup(){

    size(1000, 700, P3D);
    surface.setTitle("Discovery !");
    background(0);
    
    cp5 = new ControlP5(this);
    astronaut = new Astronaut(loadImage("astronaut.png"));

    rows = h/scale;
    cols = w/scale;
    terrain = new float[cols][rows];
    gravity = new PVector(0, 0.2);
    fireworks.add(new Firework());
    
    for (int i = 0; i < stars.length; i++){
        stars[i] = new Star();
    }
    
    fireworkSlider = cp5.addSlider("fireworkSlider")
            .setPosition(50,50)
            .setSize(200,30)
            .setCaptionLabel("Number of Fireworks")
            .setRange(0,100)
            .setValue(3)
    ;

    heartsSlider = cp5.addSlider("heartsSlider")
            .setPosition(50,110)
            .setSize(200,30)
            .setCaptionLabel("Number of Heart Fireworks")
            .setRange(0,100)
            .setValue(10)
    ;

    groundColor = cp5.addColorWheel("groundColor")
            .setPosition(60, 100)
            .setColorValue(color(255, 128, 0, 128))
    ;

    cp5.getController("fireworkSlider").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setPaddingY(10);
    cp5.getController("fireworkSlider").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setPaddingY(10);
    cp5.getController("heartsSlider").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setPaddingY(10);
    cp5.getController("heartsSlider").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setPaddingY(10);

    fireworkSlider.hide();
    heartsSlider.hide();
    groundColor.hide();
}

/* Procédure de génération des feux d'artifices  en deux formes (normale ou en forme de coeur) selon des probabilités modulables par les sliders de l'interface */
void fireworkFestivity(){
    pushMatrix();
    
    fill(0, 15);
    translate(width/2, height/2, 0);
    rect(-width/2, -height/2, width, height);
    
    if (random(1) < (nbFireworks/100)){
        fireworks.add(new Firework());
    }
    
    for (int i = 0; i < fireworks.size(); i++){
        fireworks.get(i).update();
        fireworks.get(i).show();
        if (fireworks.get(i).done()){
            fireworks.remove(fireworks.get(i));
        }
    }
    
    popMatrix();
}


/* Fonction de calcul de la couleur des cubes internes selon leurs emplacements */
int offsetToColor(int offset){
    return (int) ((offset + MAX_OFFSET) / (2.8 * MAX_OFFSET) * 255);
}

/* Procédure de dessin du cube de cubes avec rotation continue et perspective modulable par mouvement de curseur sur l'axe X */
void cube(){

    background(0);
    
    pushMatrix();
    translate(width/2, height/2, -600);
    float cameraY = height/2.0;
    float fov = mouseX/float(width) * PI/2;
    float cameraZ = cameraY / tan(fov / 2.0);
    float aspect = float(width)/float(height);

    stroke(0);
    strokeWeight(2);
    rotateX(frameCount * 0.01);
    rotateY(frameCount * 0.01);
    rotateZ(frameCount * 0.01);
    if (mousePressed) {
        aspect = aspect / 2.0;
    }
    perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
    for(int xOff = -MAX_OFFSET; xOff <= MAX_OFFSET; xOff += 50){
        for(int yOff = -MAX_OFFSET; yOff <= MAX_OFFSET; yOff += 50){
            for(int zOff = -MAX_OFFSET; zOff <= MAX_OFFSET; zOff += 50){
                pushMatrix();
                translate(xOff, yOff, zOff);
                rotateX(frameCount * 0.02);
                rotateY(frameCount * 0.02);
                rotateZ(frameCount * 0.02);
                fill(offsetToColor(xOff), offsetToColor(yOff), offsetToColor(zOff));
                box((float) (30 + Math.sin(frameCount/20.0)*15));
                popMatrix();
            }
        }
    }
    popMatrix();
}

void keyPressed(){
    background(0);

    pressed[keyCode] = true;
    switch (keyCode){
        case KeyEvent.VK_S:
            fireworkSlider.hide();
            heartsSlider.hide();
            groundColor.show();
            colorMode(RGB);
            firework = false;
            space = true;
            cube = false;
            break;
        case KeyEvent.VK_F:
            fireworkSlider.show();
            heartsSlider.show();
            groundColor.hide();
            colorMode(HSB);
            firework = true;
            space = false;
            cube = false;
            break;
        case KeyEvent.VK_C:
            fireworkSlider.hide();
            heartsSlider.hide();
            groundColor.hide();
            colorMode(RGB);
            firework = false;
            space = false;
            cube = true;
            break;
    }
}


void keyReleased() {
    pressed[keyCode] = false;
}

void fireworkSlider(float value) {
    nbFireworks = value;
}

void heartsSlider(float value) {
    nbHearts = value;
}

/* Procédure de visite spatiale avec couleur de planète modulable et astronaute manipulables via les flèches du clavier */
void spaceTour(){
    pushMatrix();
    
    camera -= 0.1;
    float yoff = camera;
    for( int y = 0; y < rows; y++){
        float xoff = 0;
        for( int x = 0; x < cols; x++){
            terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
            xoff += 0.2;
        }
        yoff += 0.2;
    }
    speed = map(mouseX, 0, width, 5, 30);
    
    translate(width/2, 0);
    background(0);
    for (int i = 0; i < stars.length; i++){
        stars[i].update();
        stars[i].show();
    }
    stroke(groundColor.r(), groundColor.g(), groundColor.b(), groundColor.a());
    
    noFill();
    translate(0, height/2);
    rotateX(PI/3);
    translate(-w/2, -h/2, -200);
    for( int y = 0; y < rows - 1; y++){
        beginShape(TRIANGLE_STRIP);
        for( int x = 0; x < cols; x++){
            vertex(x*scale,y*scale,terrain[x][y]);
            vertex(x*scale,(y+1)*scale,terrain[x][y+1]);
        }
        endShape();
    }
    
    translate(w/2, h/2, 200);
    astronaut.show();
    
    popMatrix();

}

void draw(){
    if (space){
        spaceTour();
        if (pressed[KeyEvent.VK_RIGHT]){
            astronaut.updateX(5);
        } else if (pressed[KeyEvent.VK_LEFT]){
            astronaut.updateX(-5);
        } 
        if (pressed[KeyEvent.VK_UP]){
            astronaut.updateY(-5);
        } else if (pressed[KeyEvent.VK_DOWN]){
            astronaut.updateY(5);
        }
    } else if (firework) {
        fireworkFestivity();
    } else {
        cube();
        perspective();
    }
}
