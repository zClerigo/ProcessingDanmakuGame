public class Turret {
int xl, xr, y;

Turret(Player player){
this.xl = player.x - 60;
this.xr = player.x + 60;
this.y = player.y;
imageMode(CENTER);
}

void drawTurret(){
image(loadImage("blue_orb.png"),xl, y );
image(loadImage("blue_orb.png"),xr, y );

if (player.focus == 0) {
  this.xl = player.x - 40;
  this.xr = player.x + 40;
  this.y = player.y;
} else{
  focusMode();
}
}

void focusMode(){
  if (xr > player.x + 30  || xl < player.x - 30){
  this.xr += -4;
  this.xl += 4;
  this.y += -4;
  } else{
  this.xr = player.x - 10;
  this.xl = player.x + 10;
  this.y = player.y - 30;
}
}
}
