void instruction(){
  background(0);
  textSize(width/30); 
  textAlign(CENTER);
  fill(255, 192, 203); // Set fill color to pink
  stroke(0); // Set stroke color to black
  text("Welcome to the Catch game!", width/2, height/10);
  text("The main goal is to catch the rectangle using the paddle.", width/2, height/5); 
  text("Move the paddle with the mouse and earn points.", width/2, height/3.33);
  text("'With great power comes great responsibility,\n  the more you gain points the quicker it goes.'", width/2, height/2.5);
  //fill(255); // Reset fill color to white
  text("With that being said, let's catch those rect!", width/2, height/2);
}


void button(){
  // Set button properties
  fill(255, 192, 203);
  bu_h = height/10;
  bu_w = width/4;
  bu_hi = height/10;
  bu_wi = width/4;
  
  rectMode(CENTER);
  
  // Draw left button
  bu_x = width/4;
  bu_y = height/2 + height/6;
  rect(bu_x, bu_y, bu_w, bu_h, 10);
  fill(0);
  textSize(height/25);
  textAlign(CENTER, CENTER);
  text("LET'S GOOO!", bu_x, bu_y);
  
  // Draw right button
  fill(255, 192, 203);
  bu_xi = 3*width/4;
  bu_yi = height/2 + height/6;
  rect(bu_xi, bu_yi, bu_wi, bu_hi, 10);
  fill(0);
  textSize(height/25);
  textAlign(CENTER, CENTER);
  text("Midterms", bu_xi, bu_yi);
  
  // Check for mouse click
  if(mousePressed && mouseX>width/4-bu_w/2 && mouseX<width/4+bu_w/2 && mouseY>bu_y-bu_h/2 && mouseY<bu_y+bu_h/2){
    start=true;
  }
  if(mousePressed && mouseX>3*width/4-bu_w/2 && mouseX<3*width/4+bu_w/2 && mouseY>bu_y-bu_h/2 && mouseY<bu_y+bu_h/2){
    exit();
  }
}
