public class Bullet{
public float x, xtr, xtl, y, v, newX, newY, angleT, angleC, radius, aSpawn;
public PVector tracer, center, point;
public boolean dead, deadL, deadR, ready, finalMove;
ArrayList<Float> rNumbers = new ArrayList<Float>();

Bullet(Player player){
  this.x = player.x;
  this.y = player.y;
  this.xtr = player.x + 40;
  this.xtl = player.x - 40;  
  this.v = -10;
}

Bullet(Boss boss){
  this.x = boss.x;
  this.y = boss.y;
  v =  random(10, 13);
  
  tracer = new PVector(this.x,this.y, 0.);
  angleT = atan2(player.y - tracer.y, player.x - tracer.x);
  
  point = new PVector(this.x, this.y + 50);
  center = new PVector(this.x,this.y);
  angleC = atan2(this.x - point.x, this.y - point.y);
  radius = dist(this.x, this.y, point.x, point.y);
  

}

Bullet(Boss boss, Bullet superB, Player player){
  this.x = boss.x;
  this.y = boss.y;
  v =  random(10, 13);
  
  finalMove = boss.finalMove;
  tracer = new PVector(this.x,this.y, 0.);
  angleT = atan2(player.y - tracer.y, player.x - tracer.x);
  
  point = new PVector(this.x, this.y + 50);
  center = new PVector(this.x,this.y);
  angleC = atan2(this.x - point.x, this.y - point.y);
  radius = dist(this.x, this.y, point.x, point.y);
  
  newX =  cos(superB.angleC / 2) * v + tracer.x;
  newY = sin(superB.angleC / 2) * v + tracer.y;
  
  set = true;
  aSpawn = random(0, width);
}

//Bullet(Boss boss, Bullet superBullet) {
//  this.angleC = superBullet.angleC;
//  this.tracer = superBullet.tracer;
//  this.point =superBullet.point;
//  this.center = superBullet.center;
//  this.radius = superBullet.radius;
//  this.x = boss.x;
//  this.y = boss.y;
//   v =  random(10, 13);
//}

public void drawPlayerBullet(){
if(dead != true){

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

public void drawTurretBullet(){
ellipseMode(CENTER);
fill(color(244,200,197));
if (player.focus == 0){
   if(deadR != true){
ellipse(x + 40,y,16,25);
   }
   if(deadL != true){
ellipse(x - 40,y,16,25);
   }
} else {
   if(deadL != true){
ellipse(x - 10,y -30,16,25);
   }
    if(deadL != true){
ellipse(x + 10,y -30,16,25);
    }
}
y += v;
}

public void drawTrackerBullet(){
  if (y< height){
  //int m = millis();
  if (finalMove != true){
  ellipse(tracer.x ,tracer.y ,16,16);
  //image(loadImage("green_orb-min(1)(2).png"),tracer.x, tracer.y );
  newX =  cos(angleT) * v + tracer.x;
  newY = sin(angleT) * v + tracer.y;
  tracer.set(newX,newY,0.);
  }
  }
  }

public void drawCircleBullet(){
  if (finalMove != true){ 
  float travelX = this.x + cos(angleC)*radius;
  float travelY = this.y + sin(angleC)*radius;
  
  ellipse(travelX, travelY, 20, 20);
  angleC += PI/120;
  }
}
public void drawCircleBulletFast(){
  if (finalMove != true){ 
  float travelX = this.x + cos(angleC)*radius;
  float travelY = this.y + sin(angleC)*radius;
  
  ellipse(travelX, travelY, 20, 20);
  angleC += PI/20;
  }
}
public void drawCircleBulletTracker(Bullet superB){
 if (finalMove != true){ 
  ellipse(tracer.x, tracer.y, 20, 20);
  newX =  cos(superB.angleC) * v + tracer.x;
  newY = sin(superB.angleC) * v + tracer.y;
  tracer.set(newX, newY, 0.);
 }
}

public void drawCircleBulletTracker1(){
  if (finalMove != true){ 
  ellipse(tracer.x, tracer.y, 20, 20);
  if (ready == true){
  newX =  cos(angleT) * 4 + tracer.x;
  newY = sin(angleT) * 4 + tracer.y;
  }
  tracer.set(newX, newY, 0.);
  }
  
}

public void drawAsteroid(){
   ellipse(aSpawn, y, 40, 40);
   y+=7;
}

public void updateCoords(Boss boss){
  this.x = boss.x;
  this.y = boss.y;
  this.finalMove = boss.finalMove;
}

}
