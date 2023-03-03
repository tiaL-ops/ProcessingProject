// make the bubble go back 
void reset(){

  if (y < 0) {
    if (!scored) {
      score -= 1;
      speed *= 0.9;
      
    }
    y = height;
  }
}
