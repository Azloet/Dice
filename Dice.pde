int sum;

void setup()
{
  size(300,300);
  noLoop();
  colorMode(HSB,360,100,100,100);
}

void draw()
{
  background(210,25,100);
  noStroke();
  for(int i = 0; i<=100; i+=1){
    fill(210+i*30/100,25+i*25/100,100-i*50/100);
    rect(0,0,300,200-i*200/100);
  }
  for(int i = 0; i<=100; i+=1){
    fill(30+i*15/100,10+i*90/100,100,i*10/100);
    rect(0,150+i*100/100,300,100-i*100/100);
  }
  for(int r = 0; r<=25; r+=1){
    fill(60,5,100,100-20*Math.sqrt(r));
    ellipse(150,150,100+r,100+r);
  }
  for(int i = 0; i<=16; i+=1){
    fill(30,0,50,100-25*Math.sqrt(i));
    rect(0,250-i,300,50+i);
  }
  
  Die firstDie;
  sum = 0;
  int randy;
  
  for(int i = 0; i<10; i++){
    randy = (int)(Math.random()*50)+250;
    for(int j = 1; j<=(int)(Math.random()*8)+2; j++){
      firstDie = new Die(30*i + 5,randy-(j*20),20,20,30,0,30);
      firstDie.roll();
      firstDie.show();
    }
  }
  fill(0,0,0);
  text("Sum = " + sum,30,30);
}

void mousePressed()
{
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
