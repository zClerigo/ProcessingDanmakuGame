boolean shooting, hasShot, pressed;
ArrayList<Bullet> pBullets = new ArrayList<Bullet>();
ArrayList<Bullet> bBullets = new ArrayList<Bullet>();
ArrayList<Bullet> TBullets = new ArrayList<Bullet>();
ArrayList<Bullet> cBullets = new ArrayList<Bullet>();
ArrayList<Bullet> c3Bullets = new ArrayList<Bullet>();
ArrayList<Bullet> aBullets = new ArrayList<Bullet>();
Player player;
Turret turret;
Bullet superBullet;
Boss boss1;
int shot = 0;
int boss1Attack = 1;
boolean set = true;
void setup(){
size(800,600);
background(loadImage("space.png"));
hasShot = false;
player = new Player();
turret = new Turret(player);
boss1 = new Boss();
superBullet = new Bullet(boss1);
textSize(50);
textFont(createFont("VT323-Regular.ttf", 50));
}


void drawPbullets(){
  for(int i = 0; i <pBullets.size(); i ++){
    pBullets.get(i).drawPlayerBullet();
  }
  for(int i = 0; i <pBullets.size(); i ++){
    pBullets.get(i).drawTurretBullet();
  }
}

void drawTbullets(){
  for(int i = 0; i < bBullets.size(); i++) {
    bBullets.get(i).drawTrackerBullet();
}
}

void drawCbullets(){
  for(int i = 0; i<cBullets.size(); i++) {
    cBullets.get(i).drawCircleBulletTracker(superBullet);
  }
}

void drawC3bullets(){
  for(int i = 0; i<c3Bullets.size(); i++) {
    c3Bullets.get(i).drawCircleBulletTracker1();
   if(shot==40 || boss1.finalMove == true) {
    c3Bullets.get(i).ready = true;
  }
  }
}

void drawAbullets(){
  for(int i = 0; i<aBullets.size(); i++) {
    aBullets.get(i).drawAsteroid();
  }
}

void drawHealth(){
  if (player.health >= 1){
  image(loadImage("heart.png"),20, 580 );
  } if (player.health >= 2){
  image(loadImage("heart.png"),30, 580 );
  } if (player.health == 3){
  image(loadImage("heart.png"),40, 580 );
  }
}

void draw(){
    for(int i = 0; i <bBullets.size(); i++){
  if(dist(player.x, player.y, bBullets.get(i).newX, bBullets.get(i).newY) < 32) {
    // COLLISION EVENT
    //player.alive = false;
    player.health --;
    player.x = width/2;
    player.y = height-10;
  }
  }
  for(int i = 0; i <TBullets.size(); i++){
  if(dist(player.x, player.y, TBullets.get(i).newX, TBullets.get(i).newY) < 32) {
    // COLLISION EVENT
    //player.alive = false;
    player.health --;
    player.x = width/2;
    player.y = height-10;
  }
  }
  for(int i = 0; i <cBullets.size(); i++){
  if(dist(player.x, player.y, cBullets.get(i).newX, cBullets.get(i).newY) < 32) {
    // COLLISION EVENT
    //player.alive = false;
    player.health --;
    player.x = width/2;
    player.y = height-10;
  }
  }
  for(int i = 0; i <c3Bullets.size(); i++){
  if(dist(player.x, player.y, c3Bullets.get(i).newX, c3Bullets.get(i).newY) < 32) {
    // COLLISION EVENT
    //player.alive = false;
    player.health --;
    player.x = width/2;
    player.y = height-10;
  }
  }
  for(int i = 0; i <aBullets.size(); i++){
  if(dist(player.x, player.y, aBullets.get(i).aSpawn, aBullets.get(i).y) < 40) {
    // COLLISION EVENT
    //player.alive = false;
    player.health --;
    player.x = width/2;
    player.y = height-10;
  }
  }
  
  for(int j = 0; j <pBullets.size(); j++){
    
  if (pBullets.get(j).y > height) {
  pBullets.get(j).dead = true;
  pBullets.get(j).deadL = true; 
  pBullets.get(j).deadR = true; 
  }
  if(dist(boss1.x, boss1.y, pBullets.get(j).x, pBullets.get(j).y) < 32) {
    // COLLISION EVENT
    //player.alive = false;
    boss1.health --;
    pBullets.get(j).dead = true;
  }
   if (dist(boss1.x, boss1.y, pBullets.get(j).x+40, pBullets.get(j).y) < 32 ){
   boss1.health--;
   pBullets.get(j).deadR = true;
   }
   if ( dist(boss1.x, boss1.y, pBullets.get(j).x-40, pBullets.get(j).y) < 32){
   boss1.health--;
   pBullets.get(j).deadL = true;
   }
   if ( dist(boss1.x, boss1.y, pBullets.get(j).x-10, pBullets.get(j).y) < 32){
   boss1.health--;
   pBullets.get(j).deadL = true;   }
   if ( dist(boss1.x, boss1.y, pBullets.get(j).x+10, pBullets.get(j).y) < 32){
   boss1.health--;
   pBullets.get(j).deadR = true;
   }
  }
  
  
  int m = millis();
  background(loadImage("space.png"));;
  frameRate(60);
  if (pressed != true){
  //textFont();
  text("Arrow Keys to Move",200, 200);
  text("ALT to Shoot",250, 250);
  text("Shift to Focus",235, 300);
  }
  
  text("BOSS HEALTH:", 10, 30);
  text(boss1.health, 250, 30);
  
  //superBullet.updateCoords(boss1);
  boss1.drawBoss();
  drawPbullets();
  drawTbullets();
  drawCbullets();
  drawC3bullets();
  drawAbullets();
  drawHealth();
  
  // BOSS 1
  if (pressed == true){
    
  if(boss1.ready1 == true){
    superBullet.drawCircleBullet();
    
    attack2();
  }
  if(boss1Attack == 1){
    boss1.movePattern = 1;
    boss1.move();
    if (boss1.finished == true) {
     boss1Attack = 2;
    }
  }
  else if (boss1Attack == 2) {
    attack1();
    if (boss1.finished == true) {
     boss1.movePattern = 2;
     boss1.move();
     attack1();
    } else {
    boss1.movePattern =  1;
     boss1.move();
     attack1();
    }
  }
  
  if (boss1.ready2 == true && boss1.health <= 20000 && boss1.health > 10000 ){
    boss1Attack = 3;
     superBullet.drawCircleBulletFast();
      attack3();
 
  } else if (boss1.health <= 10000 && boss1.health > 0) {
  boss1.finalMove();
  attack4();
  }
  }
  
  
  turret.drawTurret();
  if(player.alive == true){
     player.drawPlayer();
  }
  if (player.health == 0){
  player.alive = false;
  }


if (shooting == true) {
  if (m % 2 == 0 ) {
  hasShot = true;
  }
  else if (m % 2 != 0){
  hasShot = false;
  }
} else {hasShot = false;}

if (hasShot == true) {
   Bullet b = new Bullet(player);
   pBullets.add(b);
   
}
}

void keyPressed(){
  pressed = true;
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

void attack1(){
  int m = millis();
  if (shot < 20){
  if (m % 2 == 0){
    Bullet bBullet = new Bullet(boss1, superBullet, player);
    bBullets.add(bBullet);
    
    //bBullet.drawTrackerBullet();
    shot++;
  }
  }
}

void attack2(){
  int m = millis();
  if (m % 10 == 0){
    Bullet bullet = new Bullet(boss1, superBullet, player);
    cBullets.add(bullet);
  }
}

void attack3(){
   int m = millis();
   if (shot < 40){
  if (m % 2 == 0){
    Bullet bullet = new Bullet(boss1, superBullet, player);
    c3Bullets.add(bullet);
    shot++;
  }
   } else {shot = 0;}
}

void attack4(){
  int m = millis();
  if (m % 10 == 0) {
    Bullet bullet = new Bullet(boss1, superBullet, player);
    aBullets.add(bullet);
  }
}
