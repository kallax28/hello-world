int keyCount = 0;
float x, y;
float dirX = 0.75;
float mouth1 = 45;
float mouth2 = 315;
boolean mouthOpen = true;

void setup() {
  size (800, 200);
}

void draw() {
  background (0);
  stroke (0, 0, 255);
  strokeWeight (10);
  line (0, 50, 800, 50);
  line (0, 150, 800, 150);
  noStroke ();
  strokeWeight (1);
  fill (255, 255, 0);

  if (mouthOpen==true) {
    mouth1 += -1.5;
    mouth2 += 1.5;
  }
  if (mouthOpen && mouth1 == 0 && mouth2 == 360) {
    mouthOpen = false;
    mouth1 = 45;
    mouth2 = 315;
  }
  if (!mouthOpen && mouth1 >=0) {
    mouthOpen = true;
  }
  if (mouthOpen && dirX==-0.75) {
    mouthOpen = true;
  }
  if (mouthOpen && mouth1 == -180 && mouth2 == 180 && dirX==-0.75) {
    mouthOpen = false;
    mouth1 = -135;
    mouth2 = 135;
  }
  if (!mouthOpen  && mouth1 <=180) {
    mouthOpen = true;
  }

  arc (x, height/2, 50, 50, radians(mouth1), radians(mouth2), PIE);
  x = x + dirX;
  if (x > 830) {
    x = 0;
  } else {
    x = x + dirX;
    if (x < -30) {
      x = 800;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    keyCount++;
    if ((keyPressed == true && keyCount == 1)) {
      mouth1 = -135;
      mouth2 = 135;
      dirX = -0.75;
    } else {
      if (key == ' ') {
        if ((keyPressed == true && keyCount == 2)) {
          mouth1 = 45;
          mouth2 = 315;
          dirX = 0.75;
          keyCount = 0;
        }
      }
    }
  }
}
