void over_game(){
  textSize(50);
  
    textAlign(CENTER);
    text("Press any key to restart the game", width / 2, height / 2 +50);
    textSize(100);
    textAlign(CENTER);
    fill(100);
    text("GAME OVER", width / 2, height / 2);
    point = 0;
    if ((keyPressed == true)) {
        point = 0;
        ball_speed(speed1);
        circley=0;
        
        
       // gameOver = false; 
    }
  }
