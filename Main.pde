//boolean scored;
int score=0;
int bu_x,bu_y,bu_h,bu_w;
int bu_xi,bu_yi,bu_hi,bu_wi;
boolean start=false;
Bubble myBubble;
Bubble myBubble2;
Bubble myBubble3;
Bubble myBubble4;


void setup() {
  size(400, 400);
  // Define new objects , 4 Bubble to appear in the window
  myBubble= new Bubble(width-20, height, 50, 5, random(0,255), false);
  myBubble2= new Bubble(width-300, height, 60, 5, random(0,255), false);
  myBubble3= new Bubble(width/2, height, 40, 5, random(0,255), false);
  myBubble4= new Bubble(width/4, height, 30, 5, random(0,255), false);
  myBubble4= new Bubble(width/8, height, 30, 5, random(0,255), false);
}

void draw() {
  //this is to display the instruction
  instruction();
  // funciton to have two button
  button();
  if (start){
     back();
 
  fill(0, 408, 612, 816);
  text("Score : " + score, (width*1/4), 20);
  //scored = false;
  // calling method of the class
  myBubble.display();
  myBubble.move();
  myBubble.popIt();
  myBubble.reset();
  myBubble.shake();
  //myBubble.score();


  myBubble4.display();
  myBubble4.move();
  myBubble4.popIt();
  myBubble4.reset();
  myBubble4.shake();
  // myBubble4.score();


  myBubble2.display();
  myBubble2.move();
  myBubble2.popIt();
  myBubble2.reset();
  myBubble2.shake();
  //myBubble2.score();


  myBubble3.display();
  myBubble3.move();
  myBubble3.popIt();
  myBubble3.reset();
  myBubble3.shake();
  
   myBubble4.display();
  myBubble4.move();
  myBubble4.popIt();
  myBubble4.reset();
  myBubble4.shake();
  //myBubble3.score();
  // display_score();
  }
 
}
