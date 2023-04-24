void instructionPage() {
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

void mousePressed() {

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
