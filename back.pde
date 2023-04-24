void back(){
  // Draw triangles background to make it nice
  background(0);
  noStroke();
  for (int i = 0; i < 100; i++) {
    fill(random(255), random(255), random(255), 50);
    triangle(random(width), random(height), random(width), random(height), random(width), random(height));
  }

}
