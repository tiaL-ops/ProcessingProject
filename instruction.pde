void instruction(){
  background(0);
  textSize(width/40); 
  textAlign(CENTER);
  fill(255, 192, 203); // Set fill color to pink
  stroke(0); // Set stroke color to black
  text("Welcome to the Bubble Pop game!", width/2, height*4/30);
  text("The main goal is to pop the bubbles using your mouse.", width/2, height*130/600); 
  text("Click on the bubbles to pop them and earn points.", width/2, height*180/600);
  text("'With great power comes great responsibility,\n  the more you gain points the quicker it goes.'", width/2, height*280/600);
  //fill(255); // Reset fill color to white
  text("With that being said, let's pop some bubbles!", width/2, height*400/600);
}

void button(){
  // Set button properties
  fill(255, 192, 203);
  bu_h = 75;
  bu_w = 150;
  bu_hi = 75;
  bu_wi = 150;
  
  rectMode(CENTER);
  
  // Draw left button
  bu_x = width/4;
  bu_y = height/2 + 150;
  rect(bu_x, bu_y, bu_w, bu_h, 10);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("LET'S GOOO!", bu_x, bu_y);
  
  // Draw right button
   fill(255, 192, 203);
  bu_xi = 3*width/4;
  bu_yi = height/2 + 150;
 
  rect(bu_xi, bu_yi, bu_wi, bu_hi, 10);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Nah, Thanks", bu_xi, bu_yi);
  
  // Check for mouse click
  if(mousePressed && mouseX>width/4-bu_w/2 && mouseX<width/4+bu_w/2 && mouseY>bu_y-bu_h/2 && mouseY<bu_y+bu_h/2){
    start=true;
  }
  if(mousePressed && mouseX>3*width/4-bu_w/2 && mouseX<3*width/4+bu_w/2 && mouseY>bu_y-bu_h/2 && mouseY<bu_y+bu_h/2){
    exit();
  }
}
