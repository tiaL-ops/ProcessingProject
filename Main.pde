float x_pa;
float w_pad=20;
float h_pad=60;
float y_pa;
float color_pa=50;
int score;
int bu_x,bu_y,bu_h,bu_w;
int bu_xi,bu_yi,bu_hi,bu_wi;
boolean start=false;
Car mycar;
Car mycar2;
Car mycar3;
Car mycar4;
Car mycar5;
Car mycar6;
void setup(){
size(600,600);
// call 
x_pa=width-50;
mycar= new Car(10,height/2,0,10,40,10);//black

mycar2= new Car(0,300,255,5,60,50);//white

mycar3= new Car(0,350,200,2,20,40);//grey

mycar4= new Car(0,150,200,7,75,40);//grey

mycar5= new Car(0,250,200,1,30,15);//grey

mycar6= new Car(0,50,1,30,15);
}

void draw(){
  instruction();
  button();
  if (start){
    back();
paddle();
display_score();
//calling car one
mycar.display();
mycar.move();
mycar.reset();
mycar.touch();


//calling car two
mycar2.display(loadImage("cari.png"));
mycar2.move();
mycar2.reset();
mycar2.touch();

//calling car three
mycar3.display();
mycar3.move();
mycar3.reset();
mycar3.touch();

//calling car three
mycar4.display();
mycar4.move();
mycar4.reset();
mycar4.touch();

//calling car three
mycar5.display();
mycar5.move();
mycar5.reset();
mycar5.touch();

//caling car four
mycar6.display();
mycar6.move(5);
}
}
//Class of the car
class Car{
int x;
float y;
float colori;
int speed;
float rh ,rw;

Car(int x, float y,float colori,int speed,float rw, float rh){
 //this so it knows which variable which is each
this.x=x;
this.y=y;
this.colori=colori;
this.speed=speed;
this.rh=rh;
this.rw=rw;}


Car(int x, float y,int speed,float rw, float rh){
 //this so it knows which variable which is each
this.x=x;
this.y=y;
this.speed=speed;
this.rh=rh;
this.rw=rw;}

void display(){
  //background(0);
 
 fill(colori,255,colori);
 rect(x,y,rw,rh);}
 
void display(PImage img){
  
  //background(0);
  image(img, x, y, 50, 50);
 fill(colori,255,colori);}
 //rect(x,y,rw,rh);}
 
void move(){
x+=speed;}
void move(int nitro){
x+=speed*nitro;}

void reset(){
 if (x> width){
 x=0;
 colori=random(255);
 score-=1;
 speed-=1;
 rw=random(10,40);
 rh=random(10,40);
 if(speed<=0){
   speed=1;
 }
 }
 }
// when it cathes it
void touch(){

if (x +rw > x_pa && x+rw<x_pa+w_pad && (y>y_pa || y+rh>y_pa) && y< y_pa+h_pad){
  score+=1;
  speed+=1;
  x=0;
  rw=random(10,40);
 rh=random(10,40);
  colori=random(255);
  y=random(0,height);
}}
  }
