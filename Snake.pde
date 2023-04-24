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

  void move() { 
    bodyFollowHead();
    moveHead();
    tailFollowBody();
  }

  void display() {
    displayTail();
    displayBody();
    displayHead();
  }

  void displayHead() {
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
    ellipse(eX1, eY1, eW*1.5, eH*1.5);
    fill(255);
    ellipse(eX1, eY1, eW*0.5, eH*0.5);
    fill(0,255,0);
    ellipse(eX2, eY2, eW*1.5, eH*1.5);
    fill(255);
    ellipse(eX2, eY2, eW*0.5, eH*0.5);
  }

  void displayTongue() {
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


  void moveHead() {
    headX+= speedX;
    headY+= speedY;
  }

  // To make the body follow head  
  void bodyFollowHead() {
    // Make coordinates of different parts of body follow head
    for (int i=bodyX.length-1; 0<i; i--) {
      bodyX[i]=bodyX[i-1];
      bodyY[i]=bodyY[i-1];
    }

    bodyX[0]=headX;
    bodyY[0]=headY;
  } 


  void displayBody() {
    rectMode(CENTER);
    // same color as head
    fill(0, 255, 0);
    noStroke();
    for (int i=0; i<bodyX.length-1; i++) {

      rect(bodyX[i], bodyY[i], rectW, rectH);
    }
    stroke(0);
  }


  void displayTail() {
    ellipseMode(CENTER);
    noStroke();
    fill(0, 255, 0);
    ellipse(tailX, tailY, rectW, rectH);
    stroke(0);
  }

  void tailFollowBody() {
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

  void eatApple() {

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

  void touchBody() {
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

  void headHitEdge() {
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

  void initialize() {
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
