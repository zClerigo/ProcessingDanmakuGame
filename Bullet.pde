public class Bullet{
public int x, y, v;

Bullet(Player player){
  this.x = player.x;
  this.y = player.y;
  this.v = -10;
}

public void drawBullet(){

color white = color(255,255,255);
color black = color(0,0,0);
  
fill(white);
stroke(white);
strokeWeight(0);
ellipse(x,y,16,16);
fill(black);
ellipse(x,y+4,8, 8);
fill(black);
arc(x, y, 16, 16, 3*PI/2, 2.5*PI);
fill(white);
ellipse(x,y-4,8, 8);
fill(white);
ellipse(x,y+4,3,3);
fill(black);
ellipse(x,y-4,3,3);
fill(white);

y += v;
}

}
