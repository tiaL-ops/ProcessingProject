boolean play= false; // True if the game is on
boolean gameOver= true; // True if game is over: if snake hit edge
boolean menu= true; // True if the instruction should appear

int easyDifficulty=5; // Value of frameRate of Easy Mode as speed of snake increase by frameRate

int divisor= 20; /* Number of separation on x-axis and on y-axis;
 number of (possible) rectangles in the window is divisor*divisor
 */
float rectW, rectH; // Width and Height of a rectangle (of body part of Snake)

float speedX, speedY; // Horizontal and Vertical rates of movement

int score= 0;
int bu_xi,bu_yi;
// Declare instance of Apple
Apple apple; 
// Declare instance of Snake
Snake snake;
PImage img;

//Sound
import processing.sound.*;

SoundFile snakeEatApple; // sound to play when snake eat apple
SoundFile snakeHiss; // sound to play when snake change direction
SoundFile snakeGameOver; // sound to play when game is over

void setup() {

  size (400, 400);

  // Initialize apple
  apple= new Apple();

  // Initialize snake
  snake= new Snake(20, 40, 200);

  // Adjust rectW and rectH to size of window and divisor
  rectW= width/divisor; 
  rectH= height/divisor;

  // head initial position
  snake.headX= rectW/2;
  snake.headY= rectH/2;

  // size of eyes
  snake.eW= rectW/2;
  snake.eH= rectH/2;

  // Initial eyes positions
  snake.eX1= snake.headX + rectW/2;
  snake.eX2= snake.eX1;
  snake.eY1= snake.headY - rectH/2;
  snake.eY2= snake.headY + rectH/2;

  // Initialize tdX and tdY
  snake.tdX= rectW/4; 
  snake.tdY= rectH/4;

  // Initial body position
  snake.bodyX[0]= snake.headX-rectW;
  snake.bodyY[0]= snake.headX;

  // Tail initial position
  snake.tailX= snake.headX - rectW/2;
  snake.tailY= snake.headY;

  // do not move snake unless game starts
  speedX= 0;
  speedY= 0;

  // initiate apple image
  appleImage= loadImage("apple124.png");
  // resize apple image
  appleImage.resize(width/divisor, height/divisor);
  // Initial apple rectangle position
  apple.rectNX= divisor/2;
  apple.rectNY= divisor/2;
  // initiate x, y position 
  apple.x= (apple.rectNX + 1/2.0)* rectW;
  apple.y= (apple.rectNY + 1/2.0)* rectH;

  // upload Sound files
  snakeEatApple= new SoundFile(this, "snakeEatApple.wav");
  snakeHiss= new SoundFile(this, "snakehiss.mp3");
  snakeGameOver= new SoundFile(this, "gameOver.wav");
}

void draw() {
 //background(255);
 gameBackground();
 
  

  if (play) {
    

    apple.display();
    snake.display();
    //snake.gameBackground();
    snake.move();
    snake.headHitEdge();
    snake.eatApple();
    snake.touchBody();
    displayScore();
  } else if (menu) {
    instructionPage();
  } else if (gameOver) {
    background(0);
    textSize(width/10);
    
    text("SCORE: " + score, width/2, height/2);
    
     String gmo;

gmo="GAME OVER\n"+
  "Better try next time\n"+ 
  "Click space to go back to menu\n";
  
  
  textAlign(CENTER);
  textSize(20);
  fill(255, 192, 203);
  text(gmo, width/2, height/6);
  
    
  
      
  }
}
