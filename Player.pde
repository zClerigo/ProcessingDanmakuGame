public class Player{
int x, y, health, focus, speed;
boolean hit, up, down, left, right, alive;

Player() {
imageMode(CENTER);
this.x = width / 2;
this.y = height - 200;
health = 9999;
alive = true;
focus = 0;
speed = 4;
}

void drawPlayer(){
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

if (right == false && left == false){
if (focus == 0){
image(loadImage("cat.png"),x, y );
} else {
image(loadImage("catF.png"),x, y );
}
} else if (left == true) {
if (focus == 0){
image(loadImage("catR.png"),x, y );
} else {
image(loadImage("catRF.png"),x, y );
}
}else if (right == true) {
if (focus == 0){
image(loadImage("catL.png"),x, y );
} else {
image(loadImage("catLF.png"),x, y );
}
}

}
}
