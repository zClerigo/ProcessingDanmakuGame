boolean shooting, hasShot;
ArrayList<Bullet> pBullets = new ArrayList<Bullet>(); 
Player player;
void setup(){
size(800,600);
background(255,0,0);
hasShot = false;
player = new Player();
}


void drawBullets(){
  for(int i = 0; i <pBullets.size(); i ++){
    pBullets.get(i).drawBullet();
  }
}

void draw(){
  int m = millis();
  background(255,0,0);
  frameRate(60);
  drawBullets();
  if(player.alive == true){
     player.drawPlayer();
  }
  if (player.health == 0){
  player.alive = false;
  }


if (shooting == true) {
  if (m % 4 ==0 ) {
  hasShot = true;
  }
  else if (m % 4 != 0){
  hasShot = false;
  }
} else {hasShot = false;}

if (hasShot == true) {
   Bullet b = new Bullet(player);
   pBullets.add(b);
}
   
}

void keyPressed(){
if(key == CODED){

if (keyCode == UP){
  player.up = true;
} 
else if (keyCode == DOWN) {
  player.down = true;}
else if (keyCode == LEFT){
  player.left = true;
}
else if (keyCode == RIGHT){
  player.right = true;
}

if(keyCode == SHIFT) {
player.focus = 2;
}

if (keyCode == ALT) {
shooting = true;
}
}
}
void keyReleased(){
if(key == CODED){

if (keyCode == UP){
  player.up = false;
} 
else if (keyCode == DOWN) {
  player.down = false;}
else if (keyCode == LEFT){
  player.left = false;
}
else if (keyCode == RIGHT){
  player.right = false;
}
if(keyCode == SHIFT) {
player.focus = 0;
}
if (keyCode == ALT) {
shooting = false;
}
}
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
