class Point {
  PVector loc;
  boolean show;
  boolean isPrime;
  int num;
  int w = 2;
  
  Point(float r, float theta, boolean isPrime) {
    loc = new PVector((r * cos(theta)), (r * sin(theta)));
    this.isPrime = isPrime;
    num = int(r);
  }

  void display() {
    if(isPrime){
      stroke(0, 207, 62);
      fill(0, 207, 62);
    } else{
        stroke(255);
        fill(255);
    }
    ellipse(loc.x, loc.y, w, w);
    textSize(3);
    fill(255);
    text(num, loc.x + (w/2), loc.y - (w/2));
  }
}
