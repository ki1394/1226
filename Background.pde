class Background {
  PImage bg;
  float x, y, speed;
  final float LIMIT_X = -800;
  final float RESET_X = 1600;

  Background(float x, float y) {
    bg =loadImage("img/bg.jpg");
    this.x = x;
    this.y = y;
  }

  void move(float speed) {
    this.speed = speed;
    x -= speed;
    if (x <= LIMIT_X) {
      x = RESET_X;
    }
  }

  void display() {
    image(bg, x, y);
  }
}