int chosenFunction = 0;
float particleAngle = 0;
float particleFormation = 0;
float radius = 196;
Particle[] linea;
Particle[] triangulo;
Particle[] cuadrado;
Particle[] pentagono;
Particle[] hexagono;
Particle[] circulo;

void setup() {
  size(1280, 800, P2D);
  background(0);
  noStroke();

  linea = new Particle[1]; // Create particles
  for (int n = 0; n < linea.length; n++) {
    linea[n] = new Particle(0, 400, 33);
  }
  triangulo = new Particle[2]; // Create particles
  for (int n = 0; n < triangulo.length; n++) {
    triangulo[n] = new Particle(0, 400, 33);
  }
  cuadrado = new Particle[3]; // Create particles
  for (int n = 0; n < cuadrado.length; n++) {
    cuadrado[n] = new Particle(200, 400, 33);
  }
  pentagono = new Particle[4]; // Create particles
  for (int n = 0; n < pentagono.length; n++) {
    pentagono[n] = new Particle(400, 400, 33);
  }
  hexagono = new Particle[5]; // Create particles
  for (int n = 0; n < hexagono.length; n++) {
    hexagono[n] = new Particle(400, 400, 33);
  }
  circulo = new Particle[6]; // Create particles
  for (int n = 0; n < circulo.length; n++) {
    circulo[n] = new Particle(400, 400, 33);
  }
}

void draw() {
  background(0); // Fill background
  particleFormation = particleFormation < 1 ? particleFormation+0.005 : 1;
  particleAngle += 0.02; //!!

  for (int n = 0; n < linea.length; n++) {
    float a = particleAngle + PI*2 / linea.length * n;
    linea[n].targetX = width/10 + polySin(a, 2) * radius;
    linea[n].targetY = height/2  + polyCos(a, 2) * radius;
  }
  for (int n = 0; n < triangulo.length; n++) {
    float a = particleAngle + PI*2 / triangulo.length * n;
    triangulo[n].targetX = width/10 + polySin(a, 3) * radius;
    triangulo[n].targetY = height/2  + polyCos(a, 3) * radius;
  }

  for (int n = 0; n < cuadrado.length; n++) {
    float a = particleAngle + PI*2 / cuadrado.length * n;
    cuadrado[n].targetX = width/10*3 + polySin(a, 4) * radius;
    cuadrado[n].targetY = height/2  + polyCos(a, 4) * radius;
  }
  for (int n = 0; n < pentagono.length; n++) {
    float a = particleAngle + PI*2 / pentagono.length * n;
    pentagono[n].targetX = width/10*3 + polySin(a, 5) * radius;
    pentagono[n].targetY = height/2  + polyCos(a, 5) * radius;
  }
  for (int n = 0; n < hexagono.length; n++) {
    float a = particleAngle + PI*2 / hexagono.length * n;
    hexagono[n].targetX = width/10*3 + polySin(a, 6) * radius;
    hexagono[n].targetY = height/2  + polyCos(a, 6) * radius;
  }
  for (int n = 0; n < circulo.length; n++) {
    float a = particleAngle + PI*2 / circulo.length * n;
    circulo[n].targetX = width/10*3 + polySin(a, 55) * radius;
    circulo[n].targetY = height/2  + polyCos(a, 55) * radius;
  }



  float a = map(mouseX, 0, width, 0, 100);


  // esta parte es para tener el primero con otro color (rojo), en ese caso el n de "**" tiene que ser 1
  //fill(255, 0, 0); // Update & render particles
  //triangulo[0].updateAndRender();
  //fill(255);
  for (int n = 0; n < linea.length; n++) { // "**"
    pushMatrix();
    translate(width/2-553, height/2-599);
    rotate(12.57);
    noStroke();
    linea[n].updateAndRender();
    popMatrix();
  }
  for (int n = 0; n < triangulo.length; n++) { // "**"
    pushMatrix();
    translate(width/2+281, height/2-470);
    rotate(45.03);
    noStroke();
    triangulo[n].updateAndRender();
    popMatrix();
  }

  for (int n = 0; n < cuadrado.length; n++) { // "**"
    pushMatrix();
    translate(width/2+438, height/2-759);
    rotate(32.2);
    cuadrado[n].updateAndRender();
    popMatrix();
  }

  for (int n = 0; n < pentagono.length; n++) { // "**"
    pushMatrix();
    translate(width/2-503, height/2-328);
    rotate(25.76);
    pentagono[n].updateAndRender();
    popMatrix();
  }
  for (int n = 0; n < hexagono.length; n++) { // "**"
    pushMatrix();
    translate(width/2+151, height/2-334);
    rotate(19.89);
    hexagono[n].updateAndRender();
    popMatrix();
  }
    for (int n = 0; n < circulo.length; n++) { // "**"
    pushMatrix();
    translate(width/2+577, height/2-334);
    rotate(19.89);
    circulo[n].updateAndRender();
    popMatrix();
  }

  stroke(255, 0, 0);
  line(0, height/4, width, height/4);
  line(0, height/4*2, width, height/4*2);
  line(0, height/4*3, width, height/4*3);

  line(width/6, 0, width/6, height);
  line(width/6*2, 0, width/6*2, height);
  line(width/6*3, 0, width/6*3, height);
  line(width/6*4, 0, width/6*4, height);
  line(width/6*5, 0, width/6*5, height);
 //saveFrame("geo-######.tif");
 //println(a);
}
void mousePressed() {
  //chosenFunction = (chosenFunction+1) % 9;
  particleAngle += HALF_PI;
  particleFormation = 0;
  //println(chosenFunction);
}

// Infinity sinus /////////////////////////////////////////
float infSin(float angle) {
  return angle % TWO_PI < PI ? sin(angle*2 + HALF_PI)*0.5 - 0.5 : sin(HALF_PI - (angle-HALF_PI)*2)*0.5 + 0.5;
}

// Infinity cosinus ///////////////////////////////////////
float infCos(float angle) {
  return angle % TWO_PI < PI ? cos(angle*2 + HALF_PI)*0.5 : cos(HALF_PI - (angle-HALF_PI)*2)*0.5;
}

// Polygon sinus //////////////////////////////////////////
float polySin(float angle, int edges) {
  float arc = TWO_PI / edges;
  int index = floor(angle / arc);
  float factor = (angle - index*arc) / arc;
  return sin(index*arc) * (1-factor) + sin((index+1)*arc) * factor; //Error1 sin por cos
}

// Polygon cosinus ////////////////////////////////////////
float polyCos(float angle, int edges) {
  float arc = TWO_PI / edges;
  int index = floor(angle / arc);
  float factor = (angle - index*arc) / arc;
  return cos(index*arc) * (1-factor) + cos((index+1)*arc) * factor; //Error2 arc/2
}