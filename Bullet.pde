public class Bullet{
int xb;
int yb;
int v;
Bullet(int x, int y, int vel){
  xb = x;
  yb = y;
  v = vel;
ellipse(xb, yb, 20, 20);
}

public void shoot(){
yb -= v;
}

}
