public class Turret {
int xl, xr, y;

Turret(Player player){
this.xl = player.x - 40;
this.xr = player.x + 40;
this.y = player.y;
}

void drawTurret(){
ellipse(xl, y, 10, 10);
ellipse(xr, y, 10, 10);

if (player.focus == 0) {
  xl = player.x - 40;
  this.xr = player.x + 40;
  this.y = player.y;
}

}
}
