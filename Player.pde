class Player {

  PImage img;
  float x, y, speed;
  float w = 90, h = 90;
  final float PLAYER_INIT_X = SOIL_SIZE;
  final float PLAYER_INIT_Y = height - SOIL_SIZE - h;

  int moveDirection = 0;
  int moveTimer = 0;
  int moveDuration = 60;

  Player() {  // remember the gender
    //img = loadImage("img/player" + gender + ".png");
    img = girlIdle;
    x = PLAYER_INIT_X;
    y = PLAYER_INIT_Y;
    speed = 3;
  }

  void update() {
    if (moveTimer == 0) {
      if (jumpState) {
        img = girlJump;
        moveDirection = UP;
        moveTimer = moveDuration;
      } else {
        img = girlIdle;
      }
    }

    image(img, x, y, w, h);
    //x += speed;

    if (moveTimer > 0) {

      moveTimer --;
      switch(moveDirection) {

      case UP:
        img = girlJump;
        if (moveTimer > 30) {
          y -= 6;
        } else {
          y += 6;
          if (y > PLAYER_INIT_Y) {
            y = PLAYER_INIT_Y;
          }
        }

        break;
      }
    }
  }
}
