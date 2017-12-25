class Potion extends Object {

  boolean isAlive;

  Potion(float x, float y) {
    super();
    img = loadImage("img/potion1.png") ;
    this.x = x;
    this.y = y;
    this.w = 60;
    this.h = 60;
    isAlive = true;
  }

  void checkCollision(Player player) {
    if (isAlive && canHit && isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {
      speedUp();
      isAlive = false;
    }
  }

  void display() {
    if (isAlive) {
      super.display();
    }
  }
}