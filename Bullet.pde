public class Bullet{
public int xb;
public int yb;
public int v;
Bullet(int x, int y, int vel){
  xb = x;
  yb = y;
  v = vel;
ellipse(xb, yb, 20, 20);
}

public void shoot(){
yb -= v;
}

public int getY(){
return yb;
}

}