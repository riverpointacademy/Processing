void makeRectangle(float x, float y) {
  // change these to effect how far apart rectangles can be drawn
  float minDist = -20; 
  float maxDist = 20;
  
  // use these values for pseudo randomness in position of rectangle 
  x = x + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
  y = y + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
  
  // use these value for perlin randomness in position of rectangle
  // x = x + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  // y = y + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  
  float firstX = x;
  float firstY = y;
  
  // change these to control size of rectangles
  float minLength = 10;
  float maxLength = 50;
 
  // use these values for pseudo randomness in size of rectangle
  //float h = map(randomizer.getPseudoRandom(),0,1,minLength,maxLength);
  //float w = map(randomizer.getPseudoRandom(),0,1,minLength,maxLength);
  
  // use these values for pelin randomness in size of rectangle
  float h = map(randomizer.getPerlinRandom(),0,1,minLength,maxLength);
  float w = map(randomizer.getPerlinRandom(),0,1,minLength,maxLength);
  
   //dropPen(); // place here to enable draglines
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));   // add first point
   
   dropPen(); // place here to remove drag lines
   x += w; // move to second point
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y)); // add second point
   
   y+= h; // move to third point
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y)); // add third point
   
   x -= w; // move to last point
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y)); // add last point
   
   ToDoList = (PVector[]) append(ToDoList, new PVector(firstX, firstY)); // add first point again
   raisePen();
}

void makeTriangle(float x, float y, float range) {
   // change these to effect how far apart rectangles can be drawn
  float minDist = -20; 
  float maxDist = 20;
  
  // use these values for pseudo randomness in position of triangle 
  //x = x + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
  //y = y + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
  
  // use these value for perlin randomness in position of triangle
   x = x + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
   y = y + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  
  float firstX = x;
  float firstY = y;
  
   //dropPen(); // place here to enable drag lines
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));   // add first point
   dropPen();  // place here to remove drag lines
   
   // reset x and y
   x = firstX;
   y = firstY;
   
   // get new random location for second point
   // use these values for pseudo randomness 
   //x = x + map(randomizer.getPseudoRandom(),0,1,-range,range);
   //y = y + map(randomizer.getPseudoRandom(),0,1,-range,range);
  
   // use these value for perlin randomness 
    x = x + map(randomizer.getPerlinRandom(),0,1,-range,range);
    y = y + map(randomizer.getPerlinRandom(),0,1,-range,range);
   
  ToDoList = (PVector[]) append(ToDoList, new PVector(x, y)); // add second point
  
  // reset x and y
  // get new random location for third point
  // use these values for pseudo randomness 
  //x = x + map(randomizer.getPseudoRandom(),0,1,-range,range);
  //y = y + map(randomizer.getPseudoRandom(),0,1,-range,range);
  
  // use these value for perlin randomness 
   x = x + map(randomizer.getPerlinRandom(),0,1,-range,range);
   y = y + map(randomizer.getPerlinRandom(),0,1,-range,range);
  
  ToDoList = (PVector[]) append(ToDoList, new PVector(x, y)); // add third point
   
  ToDoList = (PVector[]) append(ToDoList, new PVector(firstX, firstY)); // add first point again
  
  raisePen();

}


ArrayList<PVector> circlePoints;  //used to hold onto points for a circle that will be drawn
void findCirclePoints(float startX, float startY, float size) {
  circlePoints.clear();
  for(float i = 0; i<PI; i+=PI/36) {
    float tx = size*cos(i)*cos(i) + startX;
    float ty = size*cos(i)*sin(i) + startY;
    circlePoints.add(new PVector(tx,ty));
    //println(circlePoints.get(0).x);  // debugging
  }
}
 
//  makeCircle(startX+random(-20,20), startY+random(-20,20),50);
void makeCircle(float x, float y, float size) {
 // change these to effect how far apart circles can be drawn
  float minDist = -20; 
  float maxDist = 20;
  
  // use these values for pseudo randomness in position of triangle 
  x = x + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
  y = y + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
  
  // use these value for perlin randomness in position of triangle
  // x = x + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  // y = y + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  
  
  findCirclePoints(x, y, size);
  //dropPen(); // place here to enable drag lines
  ToDoList = (PVector[]) append(ToDoList, new PVector(circlePoints.get(0).x, circlePoints.get(0).y));
  dropPen(); //place here to remove drag lines
  
  for(int i = 1; i<circlePoints.size(); i++) {
    PVector temp = circlePoints.get(i);
    ToDoList = (PVector[]) append(ToDoList, new PVector(temp.x, temp.y));
  }
   raisePen();
}
