public class Player{
int x, y, health, focus, speed;
boolean hit, up, down, left, right, alive;

Player() {
this.x = width / 2;
this.y = height/2;
health = 20;
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

ellipse(x, y, 20, 20);

}
}
