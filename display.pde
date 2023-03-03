// make the buble appears
void display(){
  fill(0, 408, 612, 816);
  text("Score : " + score, 0, 20, -120);
  text("Speed : " + speed, 0, 40, -120);
  fill(255, random(0, 255), 255);
  circle(x, y, cr);
}
