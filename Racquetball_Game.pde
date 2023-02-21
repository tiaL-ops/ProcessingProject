float circlex;
float circley;
int gap=50;
int paddley;
float directionx;
float directiony;
float mx;
float paddleyTy;
int point=0;
float speedSetup;
boolean firstCond = false;
boolean gameOver = false; 
 // To change the size og the paddle 
boolean back=true;
float paddleLenght;
float speedP;
int level;
float speedX, speedY;
int speedIncrement = 2;
float speed1;
void setup() {
  size(800, 400);
  background(0);
  instruction();
  paddley = height - gap;
  circlex = random(width);
  circley = 10;
  speedX = 5;
  speedY = 5;

  point = 0;  // Reset the point variable
 
}


void draw() {
 //press 1 for 100 pixels and speed 5
if ((keyPressed == true)&& key=='1'){
   level=1;
   speed1=5;
   ball_speed(speed1);
}
//press 2 for 100 pixels and speed 10
 if ((keyPressed == true)&& key=='2'){
   level=2;
   speed1=7;
   ball_speed(speed1);
}
//press 3 for 100 pixels and speed 15
 if ((keyPressed == true)&& key=='3'){
   level=3;
   speed1=10;
   ball_speed(speed1);
}
 
 if (level==1){
   start_game(100);
   
   
 }
  if (level==2){
   start_game(200);
 }
  if (level==3){
   start_game(300);
   
 }
 }
 


//Rainbow ball color
void mousePressed() {
  back=false;
  background(0, 0, 0, 0);
  fill(random(0, 255), random(0, 255), random(0, 255));
  circle(circlex, circley, 20);

//make the cirlce move
  circlex += directionx;
  circley += directiony;
  
}
// Make the background back to hide the color
void mouseReleased() {
  back=true;
  loop();
}
