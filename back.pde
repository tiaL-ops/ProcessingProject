void back() {
  background(23);
  //  center point
  float centerX = width / 2.0;
  float centerY = height / 2.0;

  //  radius to the corner of the window
  float maxRadius = dist(0, 0, centerX, centerY);

  // number of rows and columns of diamonds
  int numRows = 15;
  int numCols = 15;

  //  size of each diamond based on the number of rows and columns
  float diamondWidth = width / float(numCols);
  float diamondHeight = height / float(numRows);

  // Loop through each diamond position
  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {

      //  center point of the diamond
      float diamondX = col * diamondWidth + diamondWidth / 2.0;
      float diamondY = row * diamondHeight + diamondHeight / 2.0;

      // distance from the center to the diamond
      float distanceToCenter = dist(centerX, centerY, diamondX, diamondY);

      float colorValue = map(distanceToCenter, 0, maxRadius, 0, 255);

      fill(colorValue, 100, 200);

      // Draw the diamond shape
      float diamondDiagonal = diamondWidth / sqrt(2);
      beginShape();
      vertex(diamondX + diamondDiagonal / 2.0, diamondY);
      vertex(diamondX, diamondY + diamondDiagonal / 2.0);
      vertex(diamondX - diamondDiagonal / 2.0, diamondY);
      vertex(diamondX, diamondY - diamondDiagonal / 2.0);
      endShape(CLOSE);
    }
  }
}
