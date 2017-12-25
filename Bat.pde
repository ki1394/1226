class Bat extends Enemy {

  PImage img1, img2;
  float timer;

  Bat(float x, float y) {
    super();
    img1 = loadImage("img/bat1.png") ;
    img2 = loadImage("img/bat2.png") ;
    this.x = x;
    this.y = y;
    this.w = 60;
    this.h = 60;

    timer = floor(random(30));
  }

  void display() {
    timer--;
    if (timer >= 15) {
      image(img2, x, y, w, h);
    } else if (timer >= 0) {
      image(img1, x, y, w, h);
    }
    if (timer <= 0) {
      timer = 30;
    }
  }
}