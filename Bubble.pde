float x, y, cr, speed, colorgreen, score = 0;
boolean scored = false;

void setup() {
  size(400, 400);

  x = 100;
  cr = 50;
  speed = 5;
  y = height;
  score = 0;
}

void draw() {
  background(0);
  display();
  y -= speed;
  reset();
  //Make the circle pop 
  pop();
  move();
  scored = false;
}
