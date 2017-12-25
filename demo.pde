PImage soil, girlIdle, girlJump, life, Potion, Bat;
float playerX, playerY;
int SOIL_SIZE = 80;
int cameraSpeed;
Player player;
Background[] bg = new Background[3]; 
Object[] object = new Object[5];

float speedUpTimer;

boolean jumpState = false;

void setup() {
  size(800, 450, P2D);

  cameraSpeed = 4;
  soil = loadImage("img/soil0.png");
  girlIdle = loadImage("img/girlIdle.png");
  girlJump = loadImage("img/girlJump.png");  
  life = loadImage("img/life.png");
  player = new Player();

  for (int i=0; i<bg.length; i++) {
    bg[i] = new Background(i*800, 0);
  }

  for (int i=0; i<object.length; i++) {
    int objectRandom = floor(random(0, 3));
    switch(objectRandom) {
    case 0:
      object[i] = new Bat(360 + i*360, height-360);
      break;
    case 1:
      object[i] = new Potion(360 + i*360, height-140);
      break;
    case 2:
      object[i] = new Spider(360 + i*360, height-140);
      break;
    }
  }
}

void draw() {
  background(0);

  //Background
  for (int i=0; i<bg.length; i++) {
    bg[i].move(cameraSpeed);
    bg[i].display();
  }

  //Object
  for (int i=0; i<object.length; i++) {
    object[i].move(cameraSpeed);
    object[i].display();
    object[i].checkCollision(player);
    if (object[i].reset()) {
      object[i] = renew();
    }
  }

  speedUpTimer --;
  if (speedUpTimer < 0) {
    cameraSpeed = 4;
    for (int i=0; i<object.length; i++) {
      object[i].canHit = true;
    }
  } else {
    for (int i=0; i<object.length; i++) {
      object[i].canHit = false;
    }
  }
  //  println(speedUpTimer);

  for (int i=0; i<width; i+=SOIL_SIZE) {
    image(soil, i, height-SOIL_SIZE);
  }

  //GroundHog
  player.update();

  //popMatrix();
}


Object renew() {
  Object object;
  int objectRandom = floor(random(0, 3));
  switch(objectRandom) {
  case 0:
    object = new Bat(800+360*2, height-360);
    return object;
  case 1:
    object = new Potion(800+360*2, height-140);
    return object;
  case 2:
    object = new Spider(800+360*2, height-140);
    return object;
  }
  return null;
}


void speedUp() {
  speedUpTimer = 45;
  cameraSpeed = 10;
}

boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  return  ax + aw > bx &&    // a right edge past b left
    ax < bx + bw &&    // a left edge past b right
    ay + ah > by &&    // a top edge past b bottom
    ay < by + bh;
}

void keyPressed() {
  if (key==CODED) {
    switch(keyCode) {
    case UP:
      jumpState = true;
      break;
      //case RIGHT:
      //rightState = true;
      //break;
      //case DOWN:
      //downState = true;
      //break;
    }
  }
}

void keyReleased() {
  if (key==CODED) {
    switch(keyCode) {
    case UP:
      jumpState = false;
      break;
      //case RIGHT:
      //rightState = false;
      //break;
      //case DOWN:
      //downState = false;
      //break;
    }
  }
}