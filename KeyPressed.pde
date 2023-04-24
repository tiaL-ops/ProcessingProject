boolean L, R, U, D; // To check if Head is moving Left, Right, Up, or Down

// For Direction Control and GameOver to return to Menu
void keyPressed() {
  
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
