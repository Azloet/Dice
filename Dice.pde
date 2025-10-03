int sum;
int parity = 0;
float hueShift;
int time = 1;

void setup()
{
  size(300,300);
  noLoop();
  colorMode(HSB,360,100,100,100);
}

void draw()
{
  background(210,25,100);
  noFill();
  //blue sky
  hueShift = 20+15*sin((float)time*2*PI/8);
  for(int i = 0; i<=75-(1-parity); i+=1){
    stroke(210+hueShift-i*hueShift/75,50-i*25/75,100);
    rect(-10,-10,320,10+(1-parity)+i*150/75);
  }
  hueShift = 20+15*sin((float)time*2*PI/8);
  for(int i = 0; i<=75-parity; i+=1){
    stroke(210+hueShift-i*hueShift/75,50-i*25/75,100);
    rect(-10,-10,320,10+parity+i*150/75);
  }
  //orange sky
  hueShift = -10+15*sin((float)time*2*PI/8);
  for(int i = 0; i<=50-parity; i+=1){
    stroke(40+hueShift-i*hueShift/50,30+i*70/50,100,i*100/50);
    rect(-10,-10,320,160+parity+i*100/50);
  }
  hueShift = 10+15*sin((float)time*2*PI/8);
  for(int i = 0; i<=50-(1-parity); i+=1){
    stroke(40+hueShift-i*hueShift/50,30+i*70/50,100,i*100/50);
    rect(-10,-10,320,160+(1-parity)+i*100/50);
  }
  //sun
  for(int r = 0; r<=100; r+=1){
    stroke(60,10,100,(100-r)*sqrt(time));
    ellipse(150,150,r,r);
  }
  //floor
  hueShift = 30+10*sin((float)time*2*PI/8);
  for(int i = 0; i<=25-(1-parity); i+=1){
    stroke(hueShift,20,60-sqrt(time));
    rect(-10,-10,320,260+1*(1-parity)+i*50/25);
  }
  hueShift = 30+10*sin((float)time*2*PI/8);
  for(int i = 0; i<=25-parity; i+=1){
    stroke(hueShift,10,60-sqrt(time));
    rect(-10,-10,320,260+1*parity+i*50/25);
  }
  
  //dice
  Die firstDie;
  sum = 0;
  int randy;
  noStroke();
  for(int i = 0; i<10; i++){
    randy = (int)(Math.random()*50)+250;
    for(int j = 1; j<=(int)(Math.random()*8)+2; j++){
      firstDie = new Die(30*i + 5,randy-(j*20),20,20,30,0,30);
      firstDie.roll();
      firstDie.show();
    }
  }
  
  //sum
  fill(0,0,0);
  text("Sum = " + sum,30,30);
}

void mousePressed()
{
  parity = 1 - parity;
  time+=1;
  redraw();
}

class Die //models one single dice cube
{
  int roll;
  int x,y,w,h,hue,s,v;  
  Die(int a, int b, int c, int d, int e, int f, int g) //constructor
  {
    x = a;
    y = b;
    w = c;
    h = d;
    hue = e;
    s = f;
    v = g;
  }
  void roll()
  {  
    roll = (int)(Math.random()*6)+1;
    sum += roll;
  }
  void show()
  {
    fill(hue,s,v);
    beginShape();
    vertex(x,y);
    vertex(x+w,y);
    vertex(x+w,y+h);
    vertex(x,y+h);
    endShape(CLOSE);
    
    fill(60,30,100);
    if(roll%2 == 1){
      ellipse(x+w/2,y+h/2,w/4,h/4);
    }
    if(roll>=2){
      ellipse(x+w*1/4,y+h*3/4,w/4,h/4);
      ellipse(x+w*3/4,y+h*1/4,w/4,h/4);
      if(roll >= 4){
        ellipse(x+w*1/4,y+h*1/4,w/4,h/4);
        ellipse(x+w*3/4,y+h*3/4,w/4,h/4);
        if(roll == 6){
          ellipse(x+w*1/4,y+h/2,w/4,h/4);
          ellipse(x+w*3/4,y+h/2,w/4,h/4);
        }
      }
    }
  }
}
