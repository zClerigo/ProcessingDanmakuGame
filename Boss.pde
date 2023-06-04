public class Boss{
  int x, y, health, movePattern;
  boolean finished, ready1, ready2, movement, finalMove;
  Boss(){
  y = height - 530;
  x = width/2;
  health = 30000;
  movePattern = 0;
  }
 
  void drawBoss(){
  imageMode(CENTER);
  image(loadImage("cucumber.png"),x, y );
  }
  
  void move(){
    if (health > 25000){
    if (movePattern == 0){
      if (health < 900) {
        movePattern = 1;
      }
    }
    else if (movePattern == 1){
     if (x < width - 200){
    x += 3;
     } else{
       shot = 0;
     finished = true;
     }
     
     } else if (movePattern == 2){
      if(x > width - 500){
     x -= 3;
      } else {
        finished = false;
      shot = 0;
      movePattern = 1;
      }
     }
    } else if (health <= 25000 && health > 20000) {
      if (x != width/2){
        if(x>width/2) {
        x-= 3;
        }
        if(x<width/2) {
         x+= 3;
        }
        
      } else if (y != height/2) {
        y += 2;
      }
    
  else {ready1 = true;}
    } else if (health <= 20000 && health > 10000) {
      ready1 = false;
    if (y != height-530) {
        y -= 2;
      } else {ready2 = true;}
    
  }  
   
  }
  
  void finalMove(){
    ready2 = false;
    finalMove = true;
     if (x < width - 200 && movement != false){
    x ++;} else{ movement = false;}
     if (x >= width - 500 && movement == false) {x --;} else {movement = true;}
  }
}
