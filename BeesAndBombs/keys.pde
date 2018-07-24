void keyPressed() {
 if(key == 'g') {
  $grid = !$grid; 
  if($grid) {
    printD("grid",true);
  } else {
    printD("grid",false); 
  }
  //drawGrid($gridWidth);
 }
 
 if(key == 'a') {
   // start animation
   for (int i = 0; i<$rows*$cols; i++) {
     $segments.get(i).startAnimation();
   }
   //$testSegment.startAnimation();
 }

 
 // deprecated
 // if(key == 's') {
 //    background(255);
 //    // showSegments("start");
 //     $showing = "start";
 //     println("$showing: "+$showing);
 //     key = 'z';
 //   }
 //   if(key == 'e') {
 //     //showSegments("end");
 //     $showing = "end";
 //     println("$showing: "+$showing);
 //     key = 'z';
 //   }
 
 if(key == 'd') {
  $debug = !$debug;
  if($debug) {
    printD("debug",true);
  } else {
    printD("debug",false); 
  }
 }
 
 //if(key == 'l') {
 // looping = !looping;
 // if(looping) {
 //  loop(); 
 // } else {
 //  noLoop(); 
 // }
 //}
 
 //if(key == 'r') {
 // background(255);
 // loop();
 // drawRandom(); 
 // noLoop();
 // //loop();
 //}
}

// Helper functions
void printD(String m, boolean t) {
  if (t) {
    println(m + ": on");
  } else {
    println(m + ": off");
  }
}
