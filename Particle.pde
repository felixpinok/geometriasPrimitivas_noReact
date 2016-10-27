class Particle {

  float targetX;
  float targetY;
  int largo;
  PVector[] blur;

  Particle(float x, float y, int l) {
    targetX = x;
    targetY = y;
    largo = l;
    blur = new PVector[largo];
    for (int n = 0; n < blur.length; n++)
      blur[n] = new PVector(x, y, 0);
  }

  void updateAndRender() {
    
    for (int n = blur.length-1; n > 0; n--) {
      blur[n].x = blur[n-1].x;
      blur[n].y = blur[n-1].y;     
      ellipse(blur[n].x, blur[n].y, 5, 5); //cuerpo   
    }
    float movementAngle = atan2(targetX-blur[0].x, targetY-blur[0].y);
    blur[0].x = blur[0].x*(1-particleFormation) + targetX*particleFormation;
    blur[0].y = blur[0].y*(1-particleFormation) + targetY*particleFormation;
    ellipse(blur[0].x, blur[0].y, 5, 5); //cabezz
  }
}