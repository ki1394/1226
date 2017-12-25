class Enemy extends Object {


  Enemy() {
    super();
  }


  void checkCollision(Player player) {
    if (canHit && isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {

     //game_over
    }
    
  }
}