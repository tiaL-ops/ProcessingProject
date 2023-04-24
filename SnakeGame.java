import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SnakeGame extends PApplet {

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


SoundFile snakeEatApple; // sound to play when snake eat apple
SoundFile snakeHiss; // sound to play when snake change direction
SoundFile snakeGameOver; // sound to play when game is over

public void setup() {

  

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
  apple.x= (apple.rectNX + 1/2.0f)* rectW;
  apple.y= (apple.rectNY + 1/2.0f)* rectH;

  // upload Sound files
  snakeEatApple= new SoundFile(this, "snakeEatApple.wav");
  snakeHiss= new SoundFile(this, "snakehiss.mp3");
  snakeGameOver= new SoundFile(this, "gameOver.wav");
}

public void draw() {
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
PImage appleImage;

class Apple {
  float x, y; // x and y position of the apple
  int rectNX, rectNY; 

  public void display() {
    imageMode(CENTER);
    image(appleImage, x, y,50,50);
  } 

  // function to randomize apple position 
  public void random_Location() {
    // randomize apple rectangle position
    rectNX= (int)random(1, divisor);
    rectNY= (int)random(1, divisor);

    // update x, y position 
    x= (rectNX + 1/2.0f)* rectW;
    y= (rectNY + 1/2.0f)* rectH;
  }
}
// Background 
public void gameBackground() {
    img = loadImage("grass4.png");
  image(img, 0, 0, width*2, height*2);
  


}
public void displayScore() {
  textAlign(CORNER);
  fill(0);
  textSize(20);
  text("Score= "+score, 15, 20 );
}
public void instructionPage() {
  background(0);
  // First page
  String instruction;

instruction="Welcome to the Snake game! \n"+
  "The main goal is eat the apple and avoid eating yourself.\n"+ 
  "Use the key code to move your snake (up,right,down,left)\n"+
  "Ready?\n Feed your pet!"; 
  
  
  textAlign(CENTER);
  textSize(13);
  fill(255, 192, 203);
  text(instruction, width/2, height/6);

  // Options:
  rectMode(CORNER);
  // Easy
  stroke(0);
  fill(255, 192, 203);
  rect(width/12, height/2, 2*width/12, height/7);
  fill(255);
  text("Beginner", 2*width/12, 8 *height/14);

  // Moderate
  fill(255, 192, 203);
  rect(5*width/12, height/2, 2*width/12, height/7);
  fill(255);
  text("Friendly", 6*width/12, 8 *height/14);

  // Hard
  fill(255, 192, 203);
  rect(9*width/12, height/2, 2*width/12, height/7);
  fill(255);
  text("Master", 10*width/12, 8 *height/14);
}

public void mousePressed() {

  if (!play && gameOver) {    // If mouse is pressed and game has not started

    if (width/12<=mouseX && mouseX<=3*width/12 && height/2<=mouseY && mouseY<=9*height/14) {
      // Easy difficulty chosen
      frameRate(easyDifficulty);
      play=true;
      gameOver=false;
      menu=false;
    }

    if (5*width/12<=mouseX && mouseX<=7*width/12 && height/2<=mouseY && mouseY<=9*height/14) {
      // Moderate difficulty chosen, 2times harder than Easy Mode
      frameRate(2*easyDifficulty);
      play=true;
      gameOver= false;
      menu=false;
    }

    if (9*width/12<=mouseX && mouseX<=11*width/12 && height/2<=mouseY && mouseY<=9*height/14) {
      // Hard difficulty chosen, 2 times harder than moderate
      frameRate(2*2*easyDifficulty);
      play=true;
      gameOver= false;
      menu=false;
    }
  }
}
boolean L, R, U, D; // To check if Head is moving Left, Right, Up, or Down

// For Direction Control and GameOver to return to Menu
public void keyPressed() {
  
  if (play && !gameOver) {
    switch(keyCode) {
    case 37: // Left key is Pressed
      if (!(L||R)) { // If head of snake is not moving horizontally
        snakeHiss.play(); // Play snakeHiss sound

        speedX= -rectW; // Move head to go Left
        speedY= 0; // y-position of head do not change

        L= true; // Head is now moving to leftward
        R= false; 
        U= false;
        D= false;
      }
      break;

    case 39: // Right key is Pressed
      if (!(L||R)) { // If head of snake is not moving horizontally
        snakeHiss.play(); // Play snakeHiss sound

        speedX= rectW; // Move head to go Right
        speedY= 0; // y-position of head do not change

        L= false; 
        R= true; // Head is now moving to the rightward
        U= false;
        D= false;
      }
      break;

    case 38: // Up key is Pressed
      if (!(U||D)) { // If head of snake is not moving vertically
        snakeHiss.play(); // Play snakeHiss sound

        speedX= 0; // x-position of head do not change 
        speedY= -rectH; // Move head to go Up

        L= false; 
        R= false;
        U= true; // Head is now moving to the upward
        D= false;
      }
      break;

    case 40: // Down key is Pressed
      if (!(U||D)) { // If head of snake is not moving vertically
        snakeHiss.play(); // Play snakeHiss sound

        speedX= 0; // x-position of head do not change 
        speedY= rectH; // Move head to go Down

        L= false; 
        R= false;
        U= false;
        D= true; // Head is now moving to the downward
      }
      break;
    }
  }

  // When Game is Over
  if (gameOver) {
    if (key==' ') {
      menu=true;
      snake.initialize();
    }
  }
}
class Snake {
  // RGB of Snake
  
  int r;
  int g;
  int b;

  // Head variables
  float headX, headY; // Coordinates of the Head
  float eW, eH; // Size of eyes
  float eX1, eY1, eX2, eY2; // Coordinates of eyes
  // Togue variables
  float tongueX, tongueY; // Position of tongue
  float tdX; // Horizontal distance from head when moving left or rigth
  float tdY; // vertical distance from head when moving up or down

  int tongueT=5; // Tongue Thickness
  int tongueV; // Visibility of tongue


  // Body variables
  float[] bodyX= new float[1];
  float[] bodyY= new float[1];

  // Tail Variables
  float tailX;
  float tailY;

  // Constructor
  Snake(int r, int g, int b) { // RGB color of Snake
    this.r=r;
    this.g=g;
    this.b=b;
  }

  public void move() { 
    bodyFollowHead();
    moveHead();
    tailFollowBody();
  }

  public void display() {
    displayTail();
    displayBody();
    displayHead();
  }

  public void displayHead() {
    // display tongue
    displayTongue();

    //Display head
    rectMode (CENTER);
    fill(0, 255, 0);
    noStroke();
    rect (headX, headY, rectW, rectH);

    // Eyes
    // Adjust Eyes coordinates depending on Head movement
    if (L) { // Head going Leftward
      eX1= headX - rectW/2;
      eX2= eX1;

      eY1= headY - rectH/2;
      eY2= headY + rectH/2;
    }

    if (R) { // Head going Rightward 
      eX1= headX + rectW/2;
      eX2= eX1;

      eY1= headY - rectH/2;
      eY2= headY + rectH/2;
    }

    if (U) { // Head going Upward
      eX1= headX - rectW/2;
      eX2= headX + rectW/2;

      eY1= headY - rectH/2;
      eY2= eY1;
    }

    if (D) { // Head going Downward
      eX1= headX - rectW/2;
      eX2= headX + rectW/2;

      eY1= headY + rectH/2;
      eY2= eY1;
    }
    // Draw Eyes 
    ellipseMode(CENTER);
    stroke(0);
    fill(0,255,0);
    ellipse(eX1, eY1, eW*1.5f, eH*1.5f);
    fill(255);
    ellipse(eX1, eY1, eW*0.5f, eH*0.5f);
    fill(0,255,0);
    ellipse(eX2, eY2, eW*1.5f, eH*1.5f);
    fill(255);
    ellipse(eX2, eY2, eW*0.5f, eH*0.5f);
  }

  public void displayTongue() {
    if (dist(headX, headY, apple.x, apple.y)<= rectW+ rectH) { // if snake is approximatelly 2 grids from apple
      tongueV=200;
    } else {
      tongueV=0;
    }

    // Position of tongue depends on where the head goes
    if (L) {
      tongueX= headX- (rectW/2+tdX);
      tongueY= headY;

      // draw tongue
      strokeWeight(tongueT);
      stroke(255, 0, 0, tongueV); // Color red, visibility depending on tongueV 
      noFill();
      line (headX, headY, tongueX, tongueY); 

      ellipseMode(CENTER);
      arc(tongueX, tongueY+tdY, tdX, tdY, PI, 3*PI/2);
      arc(tongueX, tongueY-tdY, tdX, tdY, HALF_PI, PI);

      fill(0);
      strokeWeight(1);
    }
    if (R) {
      tongueX= headX+ (rectW/2+tdX);
      tongueY= headY;

      // draw tongue
      strokeWeight(tongueT);
      stroke(255, 0, 0, tongueV); // Color red, visibility depending on tongueV 
      noFill();
      line (headX, headY, tongueX, tongueY); 

      ellipseMode(CENTER);
      arc(tongueX, tongueY+tdY, tdX, tdY, 3*PI/2, 2*PI);
      arc(tongueX, tongueY-tdY, tdX, tdY, 0, HALF_PI);

      fill(0);
      strokeWeight(1);
    }
    if (U) {
      tongueX= headX;
      tongueY= headY-(rectH/2+tdY);

      // draw tongue
      strokeWeight(tongueT);
      stroke(255, 0, 0, tongueV); // Color red, visibility depending on tongueV 
      noFill();
      line (headX, headY, tongueX, tongueY); 

      ellipseMode(CENTER);
      arc(tongueX-tdX, tongueY, tdX, tdY, 3*PI/2, 2*PI);
      arc(tongueX+tdX, tongueY, tdX, tdY, PI, 3*PI/2);

      fill(0);
      strokeWeight(1);
    }
    if (D) {
      tongueX= headX;
      tongueY= headY+(rectH/2+tdY);

      // draw tongue
      strokeWeight(tongueT);
      stroke(255, 0, 0, tongueV); // Color red, visibility depending on tongueV 
      noFill();
      line (headX, headY, tongueX, tongueY); 

      ellipseMode(CENTER);
      arc(tongueX-tdX, tongueY, tdX, tdY, 0, HALF_PI);
      arc(tongueX+tdX, tongueY, tdX, tdY, HALF_PI, PI);

      fill(0);
      strokeWeight(1);
    }
  }


  public void moveHead() {
    headX+= speedX;
    headY+= speedY;
  }

  // To make the body follow head  
  public void bodyFollowHead() {
    // Make coordinates of different parts of body follow head
    for (int i=bodyX.length-1; 0<i; i--) {
      bodyX[i]=bodyX[i-1];
      bodyY[i]=bodyY[i-1];
    }

    bodyX[0]=headX;
    bodyY[0]=headY;
  } 


  public void displayBody() {
    rectMode(CENTER);
    // same color as head
    fill(0, 255, 0);
    noStroke();
    for (int i=0; i<bodyX.length-1; i++) {

      rect(bodyX[i], bodyY[i], rectW, rectH);
    }
    stroke(0);
  }


  public void displayTail() {
    ellipseMode(CENTER);
    noStroke();
    fill(0, 255, 0);
    ellipse(tailX, tailY, rectW, rectH);
    stroke(0);
  }

  public void tailFollowBody() {
    //the tail is the last part of body
    tailX= bodyX[bodyX.length-1];
    tailY= bodyY[bodyY.length-1];

    if (bodyX.length!=1) { // if snake has eaten apple(s) 
      if (tailX==bodyX[bodyX.length-2]) {
        if (tailY<bodyY[bodyY.length-2]) {
          tailY= bodyY[bodyY.length-1]+ rectH/2;
        } else {
          tailY= bodyY[bodyY.length-1]- rectH/2;
        }
      } else if (tailY==bodyY[bodyY.length-2]) {
        if (tailX<bodyX[bodyX.length-2]) {
          tailX= bodyX[bodyY.length-1]+ rectW/2;
        } else {
          tailX= bodyX[bodyY.length-1]- rectW/2;
        }
      } else if (tailY>bodyY[bodyY.length-2]) {
        tailY= bodyY[bodyY.length-1]- rectH/2;
      } else {
        tailY= bodyY[bodyY.length-1]+ rectH/2;
      }
    } else { // if snake is in initial length or score is 0
      if (L) {
        tailX= headX + rectW/2;
        tailY= headY;
      } else if (R) {
        tailX= headX - rectW/2;
        tailY= headY;
      } else if (U) {
        tailX= headX;
        tailY= headY + rectH/2;
      } else if (D) {
        tailX= headX;
        tailY= headY - rectH/2;
      }
    }
  }

  public void eatApple() {

    if (headX==apple.x && headY==apple.y) { // If Snake eat apple
      //play snakeEatApple sound
      snakeEatApple.play();

      score= score+1; // score go up
      apple.random_Location(); // apple position change at random
      // body get larger
      bodyX= append (bodyX, bodyX[bodyX.length-1]);
      bodyY= append (bodyY, bodyY[bodyY.length-1]);
    }
  }

  public void touchBody() {
    // Test for each part of the body 
    for (int i=1; i<bodyX.length; i++) { // Start from i=1 because head will never touch body[0] and if we start from i=0, this will always be true once every frame because of the program to make body follow head
      if (bodyX[i]==headX && bodyY[i]==headY) { //if head "eat" body
        gameOver=true;
        play=false;
        // Snake do not move anymore
        speedX=0;
        speedY=0;

        //play Game over sound
        snakeGameOver.play();
      }
    }
  } 

  public void headHitEdge() {
    if (headX<0 || headX>width || headY<0 || headY>height) {
      gameOver=true;
      play=false;
      // Snake do not move anymore
      speedX=0;
      speedY=0;

      //play Game over sound
      snakeGameOver.play();
    }
  }

  public void initialize() {
    // score back to 0
    score= 0;

    // head initial position
    headX= rectW/2;
    headY= rectH/2;

    // size of eyes
    eW= rectW/2;
    eH= rectH/2;

    // Initial eyes positions
    eX1= headX + rectW/2;
    eX2= eX1;
    eY1= headY - rectH/2;
    eY2= headY + rectH/2;

    // Body back to initial
    bodyX= new float[1];
    bodyY= new float[1];

    bodyX[0]= headX-rectW;
    bodyY[0]= headY ;

    // Tail initial position
    tailX= headX - rectW/2;
    tailY= headY;

    // do not move snake unless game starts
    speedX= 0;
    speedY= 0;
  }
}
public void back(){
  img = loadImage("grass4.png");
  image(img, 0, 0, width, height);
}
  public void settings() {  size (400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SnakeGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
