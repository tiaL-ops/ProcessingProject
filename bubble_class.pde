class Bubble{
  float x, y, cr, speed, colorgreen;
  boolean scored = false;
  

  // constructor
  Bubble(float x, float y, float cr, float speed, float colorgreen,boolean scored) {
    this.x=x;
    this.y=y;
    this.cr=cr;
    this.speed=speed;
    this.colorgreen=colorgreen;
    //this.score=score;
    this.scored=scored;
  }
  // make the buble appears
  void display() {
    fill(0, 408, 612, 816);
    //text("Score : " + score, 0, 20, -120);
   // text("Speed : " + speed, 0, 40, -120);
    fill(255, colorgreen, 20);
    circle(x, y, cr);
  }

  void move() {
    y -= speed;
  }
  // make the bubble pop
  void popIt() {
    if (mousePressed && dist(mouseX, mouseY, x, y) <= cr/2) {
     // ;
      //score += 1;
     
      x = random(width);
      speed += 1;
      score += 1;
      y = height;
      cr=random(20,50);
      colorgreen=random(0,255);
      println(score);
    }
  }
  // make the bubble go back 
  void reset() {

    if (y < 0) {
      cr=random(20,50);
      x=random(width);
      score -=1; 
      speed *=0.9;
      //if (!scored) {
      //  score -= 1;
      //  speed *= 0.9;
      //}
      colorgreen=random(0,255);
      y = height;
    }
  }

  //make the score
  //void score() {
  //  if (scored == true) {
  //    score += 1;
  //  }
  //}
  void shake(){
  x=x+random(-2,2);}
//  void display_score(){
//  fill(0, 408, 612, 816);
//  text("Score : " + score, 0, 20, -120);
////  text("Speed : " + speed, 0, 40, -120);
////  fill(255, random(0, 255), 255);
////  circle(x, y, cr);
////
//}
}
