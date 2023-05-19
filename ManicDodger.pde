int x, y, xb, yb, speed, focus;
boolean hit, up, down, left, right, shooting, hasShot;
ArrayList<Bullet> pBullets = new ArrayList<Bullet>(); 
void setup(){
size(800,600);
background(255,0,0);
x=width/2;
y=height/2;
xb = x;
yb = y;
speed = 4;
focus = 0;
avatar(100,100);
avatar(300,300);
}

void yinYan(int x, int y){
  color white = color(255,255,255);
  color black = color(0,0,0);

// ellipse
fill(white);
stroke(white);
strokeWeight(0);
ellipse(x,y,160,160);
fill(black);
ellipse(x,y+40,80, 80);
fill(black);
arc(x, y, 160, 160, 3*PI/2, 2.5*PI);
fill(white);
ellipse(x,y-40,80, 80);
fill(white);
ellipse(x,y+40,30,30);
fill(black);
ellipse(x,y-40,30,30);

}

void avatar(int x, int y){
ellipse(x, y, 20, 20);
}

//void bullet(int xb, int yb, int v) {
//ellipse(x, y, 20, 20);
//}
void draw(){
  background(255,0,0);
  frameRate(60);
  avatar(x, y);
  if (y==520) {
  hit = true;
  }
  if (y == 80) {
  hit = false;}

//  if (keyPressed) {
//    if (key == 'z' || key == 'Z') {
//      shooting = true;;
//    }
//  }
//  if (!keyPressed) {
//    if (key == 'z' || key == 'Z') {
//      shooting = false;;
//    }
//  }
  
if (up == true && left == false && right == false){
  y-= speed - focus; 
} 
else if (down == true && left == false && right == false) {
  y +=speed - focus;
}
else if (left == true && up == false && down == false){
  x -= speed - focus;
}
else if (right == true && up == false && down == false){
  x += speed - focus;
}
else if (up == true && left == true){
x -= sqrt(speed- focus);
y -= sqrt(speed- focus);
}
else if (up == true && right == true){
x += sqrt(speed- focus);
y -= sqrt(speed- focus);
}
else if (down == true && left == true){
x -= sqrt(speed- focus);
y += sqrt(speed- focus);
}
else if (down == true && right == true){
x += sqrt(speed- focus);
y += sqrt(speed- focus);
}

if (shooting == true){
  pBullets.add(new Bullet(xb, yb - 3, 3));  
  for (int i = 0; i >pBullets.size(); i++){
  pBullets.get(i).shoot();
  }
  hasShot = true;
}

if (hasShot == true) {
  for (int i = 0; i >pBullets.size(); i++){
  pBullets.get(i).yb += 2 ;
  }
}



 // resetting();
   
}

void keyPressed(){
if(key == CODED){

if (keyCode == UP){
  up = true;
} 
else if (keyCode == DOWN) {
  down = true;}
else if (keyCode == LEFT){
  left = true;
}
else if (keyCode == RIGHT){
  right = true;
}

if(keyCode == SHIFT) {
focus = 2;
}

if (keyCode == ALT) {
shooting = true;
}
}
}
void keyReleased(){
if(key == CODED){

if (keyCode == UP){
  up = false;
} 
else if (keyCode == DOWN) {
  down = false;}
else if (keyCode == LEFT){
  left = false;
}
else if (keyCode == RIGHT){
  right = false;
}
if (key == 'z') {
  shooting = false;
}
if(keyCode == SHIFT) {
focus = 0;
}
if (keyCode == ALT) {
shooting = false;
}
}
}
void randomPos(){
 x=(int) random(0,800);
 y= (int)random(0,600);
}
//void resetting(){
//  if (hit == true) {
//  y-=5;}
//  if (hit == false){
//  y+=5;
//  }
//  if (hit == true) {
//  y=0;
//  hit=false;
//}
//}