public class Bullet{
public int xb;
public int yb;
public int v;
Bullet(int x, int y, int vel){
  xb = x;
  yb = y;
  v = vel;
 color white = color(255,255,255);
  color black = color(0,0,0);

// ellipse
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
}

public void update(){
yb -= v;
}

public int getY(){
return yb;
}

}