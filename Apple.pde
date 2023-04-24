PImage appleImage;

class Apple {
  float x, y; // x and y position of the apple
  int rectNX, rectNY; 

  void display() {
    imageMode(CENTER);
    image(appleImage, x, y,50,50);
  } 

  // function to randomize apple position 
  void random_Location() {
    // randomize apple rectangle position
    rectNX= (int)random(1, divisor);
    rectNY= (int)random(1, divisor);

    // update x, y position 
    x= (rectNX + 1/2.0)* rectW;
    y= (rectNY + 1/2.0)* rectH;
  }
}
