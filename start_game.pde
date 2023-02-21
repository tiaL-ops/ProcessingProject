void start_game(float paddleLenght){
  
  
    
  
  firstCond = false;
  if (back){
    background(0);
  }
  fill(255);
  rectMode(CENTER);
  mx = constrain(mouseX, 50, 750);
  paddleyTy = constrain(circley, mx, mx + 20);
  textSize(50);
  text("Point:" + point, width - 200, 50);
  //Paddle
  rect(mx, height - gap, paddleLenght, 20);

  fill(random(0, 255), random(0, 255), random(0, 255));
  circle(circlex, circley, 20);

//make the cirlce move
 
  circlex+=speedX;
  circley+=speedY;
 
// Make it rebound and go faster if it touches the paddley
  if (circley > height - gap - 20 && circley < height - gap - 10 && circlex > mx - paddleLenght/2 && circlex < mx + paddleLenght/2) {
    /*directionx = -directionx;
    directiony = -directiony;*/
    point += 1;
    speedSetup += 1;
    speedX = -speedX;
    speedX += speedX > 0 ? speedIncrement : -speedIncrement;
    speedY = -speedY;
    speedY += speedY > 0 ? speedIncrement : -speedIncrement;
    
    firstCond = true;
  }
// Make it rebound if it touches the vertical edge
  if ((circlex < 0 || circlex > width) && (!firstCond)) {
    speedX = -speedX;
  }
  
// Make it rebound if it touches the top
  if (circley < 0) {
    speedY = -speedY;
  }
//Game over
  if (circley > height) {
    over_game();
  }
}
