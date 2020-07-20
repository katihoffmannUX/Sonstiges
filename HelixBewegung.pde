//Als Ideengrundlage verwendet Quelle:https://processing.org/examples/sinewave.html

int distance = 16;   
int h;             

float theta = 0.0;  
//Breite 
float w = 80;  
float period = random(400,600);  
float dx;  
//Speichern des Positionen
float[] yvalues;  
float[] yvaluesCos;  

void setup() {
  size(800, 800);
  h = height+16;
  dx = (TWO_PI / period) * distance;
  yvalues = new float[h/distance];
  yvaluesCos = new float[h/distance];
}

void draw() {
  background(0);
  wave();
  setWave();
}

void wave() {
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*w;
    yvaluesCos[i] = cos(x)*w;
    x+=dx;
  }
}

void setWave() {
  noStroke();
  fill(255);
  for (int x = 0; x < yvalues.length; x++) {
    //Erstellung der zwei Ellipsen die sich auf einer Ebene drehen
    ellipse(width/2+yvalues[x], x*distance, 16, 16);
    ellipse(width/2+yvaluesCos[x], x*distance, 16, 16);
    stroke(255);
    strokeWeight(3);
    //Linie zweischen den Ellipsen
    line(width/2+yvalues[x], x*distance, width/2+yvaluesCos[x], x*distance);
  }
}

void mouseReleased() {
  saveFrame("data/line-######.png");
}
