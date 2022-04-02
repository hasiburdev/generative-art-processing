int[] numberArray = new int[100];
float lineWidth;

void setup() {
   size(1000, 600);
   frameRate(120);
   
   lineWidth = width / numberArray.length;
   
   for(int i = 0; i < numberArray.length; i++) {
      numberArray[i] = floor(random(height));
   }

}

void draw() {
  boolean isChanged = false;
  int changeIndex = 0;
  
  background(100);
  strokeWeight(lineWidth - 1);
  stroke(255);
 
  for(int i = 0; i < numberArray.length -1; i++) {
    if(numberArray[i] > numberArray[i+1]) {
      int temp = numberArray[i];
      numberArray[i] = numberArray[i+1];
      numberArray[i + 1] = temp;
      isChanged = true;
      changeIndex = i;
      break;
    }
  }
  
  for(int i = 0; i < numberArray.length; i++) {
    if(i == changeIndex) {
      push();
      stroke(0,255,0);
      line(i * lineWidth,height-numberArray[i], i * lineWidth, height); 
      pop();
    } else {
      line(i * lineWidth,height-numberArray[i], i * lineWidth, height); 
    }
  }
  
  if(!isChanged) {
    line(0,height-numberArray[0],0, height); 
    noLoop();
  }
   
}
