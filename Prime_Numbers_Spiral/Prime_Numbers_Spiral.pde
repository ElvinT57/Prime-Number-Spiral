//Our zoom control
Camera2D camera = new Camera2D();

//Our prime and composite points
Point[] points;
int numPoints;

//Control variables
int DESIRED_AMOUNT = 1400;  //the amount of desired points of primes and composite (Max is 1400)
boolean showPrimes = true;
boolean showComposites = true;

void setup() {
  size(1400, 900);
  background(0);
  //load numbers
  String[] primeNums = loadStrings("prime numbers.txt");
  String[] compositeNums = loadStrings("composite numbers.txt");

  //check thresholds
  if ((primeNums.length - DESIRED_AMOUNT) < 0 ||( compositeNums.length - DESIRED_AMOUNT) < 0) {
    println("Desired amount exceeds available amount of numbers. (Max Amount is 1400)");
    exit();
  }
  //initialize points
  points = new Point[(DESIRED_AMOUNT*2)];

  //assign radius and polar coordinate with the same prime or composite number
  //first intialize primes 
  for (int i = 0; i < DESIRED_AMOUNT; i++)
    points[i] = new Point(float(primeNums[i]), float(primeNums[i]), true);
  //then composite
  for (int i = 0; i < DESIRED_AMOUNT; i++)
    points[i + DESIRED_AMOUNT] = new Point(float(compositeNums[i]), float(compositeNums[i]), false);
}

void draw() {
  background(0);
  //update camera
  camera.update();

  //display our points
  for (int i = 0; i < (DESIRED_AMOUNT*2); i++) {
    pushMatrix();
    //translate to center of screen to show points
    translate(width/2, height/2);
    if ((showPrimes && points[i].isPrime) || (showComposites && !points[i].isPrime))
      points[i].display();
    popMatrix();
  }
}

void keyPressed() {
  if (keyCode == '1')
    showPrimes = !showPrimes;
  else if (keyCode == '2')
    showComposites = !showComposites;
  else if(keyCode == '3'){
     for (int i = 0; i < (DESIRED_AMOUNT*2); i++) {
       points[i].w -= 1;
     }
  }
  else if(keyCode == '4'){
     for (int i = 0; i < (DESIRED_AMOUNT*2); i++) {
       points[i].w += 1;
     }
  }
}
