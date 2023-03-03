// make the bubble pop
void pop(){
  if (mousePressed && dist(mouseX, mouseY, x, y) <= cr/2) {
    println("if pressed");
    scored = true;
    y = -10;
    x = random(width);
    speed += 1;
    score += 1;
  }
  }
