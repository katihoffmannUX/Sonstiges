//Erzeugt eine kurze Test-Animation, die ich als Übungszwecke gemacht habe

void setup() {
  size(500, 500);
}

//Anfangszählerwert
int counter = 0;

void draw() {
  background(127);
  noStroke();
  //mouseX kann Farbe verändern
  int r = (int)map(mouseX, 0, width, 0, 255);
  
  //For-Schleife zeichnet Schritt zu Schritt das Muster, indem der Counter diese wiederholt
  for (int i = 0; i < height; i += 20) {
    fill(0,0,r);
    rect(0, i, width, 10);
    rect(counter, 0, width, height);
    fill(255);
    rect(0, counter, width, 10);
    for (int a = 0; a < height; a += 20){
    fill(255);
    rect(counter, 0, 10, height);
    fill(counter, a, i);
    rect(a, 0, 10, counter);
    }
  }
  
  if(counter==width){
    counter=0;

  }
  
  counter++;
}


void mouseReleased() {
  saveFrame("data/line-######.png");
}
