float posx;
float posy;
float posrasx;
float posrasy;
float playerradius=50;
float multi=2;
float toobig=125;
int eaten=0;

int coinnummer=300;
int coinsx[]=new int[coinnummer];
int coinsy[]=new int[coinnummer];
int coinsc[][]=new int[coinnummer][3];
float coinsradius[]=new float[coinnummer];

int enemytotal=10;
int enemyx[]=new int[enemytotal];
int enemyy[]=new int[enemytotal];
float enemyradius[]=new float[enemytotal];
int enemyc[][]=new int[enemytotal][3];

void setup() {
  size(1000, 1000, P2D);
  smooth();
  for (int i=0; i<coinnummer; i++) {
    coinsx[i]=int(random(-2000, 2000));
    coinsy[i]=int(random(-2000, 2000));
    coinsc[i][0]=int(random(255));
    coinsc[i][1]=int(random(255));
    coinsc[i][2]=int(random(255));
    coinsradius[i]=int(random(20, 40));
  }
  for (int i=0; i<enemytotal; i++) {
    enemyx[i]=int(random(-2000, 2000));
    enemyy[i]=int(random(-2000, 2000));
    enemyc[i][0]=int(random(255));
    enemyc[i][1]=int(random(255));
    enemyc[i][2]=int(random(255));
    enemyradius[i]=int(random(50, 150));
  }
}

void draw () {
  background(0);
  raycast(500, 500, mouseX, mouseY);
  posx-=raycasty*5;
  posy-=raycastx*5;
  posrasx-=raycasty*5;
  posrasy-=raycastx*5;
  if (posrasx>50) {
    posrasx-=50;
  }
  if (posrasy>50) {
    posrasy-=50;
  }
  if (posrasx<0) {
    posrasx+=50;
  }
  if (posrasy<0) {
    posrasy+=50;
  }
  for (int i=0; i<21; i++) {
    for (int j=0; j<21; j++) {
      fill(#FFFFFF);
      rect((i*50)-posrasx, (j*50)-posrasy, 50, 50);
    }
  }
  for (int i=0; i<coinnummer; i++) {
    fill(coinsc[i][0], coinsc[i][1], coinsc[i][2]);
    circle(coinsx[i]-posx, coinsy[i]-posy, 40);
  }
  for (int i=0; i<enemytotal; i++) {
    fill(enemyc[i][0], enemyc[i][1], enemyc[i][2]);
    circle(enemyx[i]-posx, enemyy[i]-posy, enemyradius[i]);
    fill(0);
    text(i, enemyx[i]-posx, enemyy[i]-posy);
  }
  for (int i = 0; i < enemytotal; i++) {
    if (dist(500, 500, enemyx[i]-posx, enemyy[i]-posy) < playerradius/2 && playerradius > enemyradius[i]) {
      enemyx[i]=int(random(-2000, 2000)+posx);
      enemyy[i]=int(random(-2000, 2000)+posy);
      enemyc[i][0]=int(random(255));
      enemyc[i][1]=int(random(255));
      enemyc[i][2]=int(random(255));
      eaten+=1;
      playerradius = sqrt((((((playerradius/2)*(playerradius/2))*PI)+((enemyradius[i]/2)*(enemyradius[i]/2))*PI))/PI)*2;
      //playerradius = sqrt((((((playerradius/2)*(playerradius/2))*PI+(enemyradius[i]/2)*(enemyradius[i]/2))*PI))/PI);
      println(playerradius + "     ");
      enemyradius[i]=int(random(50, 150));
    }
  }
  for (int i = 0; i < enemytotal; i++) {
    if (dist(500, 500, enemyx[i]-posx, enemyy[i]-posy)>3000) {
      enemyx[i]=int(random(-2000, 2000)+posx);
      enemyy[i]=int(random(-2000, 2000)+posy);
      enemyc[i][0]=int(random(255));
      enemyc[i][1]=int(random(255));
      enemyc[i][2]=int(random(255));
      enemyradius[i]=int(random(50, 150));
    }
  }
  for (int i = 0; i < enemytotal; i++) {
    for (int j = 0; j <enemytotal; j++) {
      if  (i!=j) {
        if (dist(enemyx[i]-posx, enemyy[i]-posy, enemyx[j]-posx, enemyy[j]-posy)<enemyradius[i]/2 && enemyradius[i]>enemyradius[j]) {
          enemyx[j]=int(random(-2000, 2000)+posx);
          enemyy[j]=int(random(-2000, 2000)+posy);
          enemyc[j][0]=int(random(255));
          enemyc[j][1]=int(random(255));
          enemyc[j][2]=int(random(255));
          enemyradius[i] = sqrt((((((enemyradius[i]/2)*(enemyradius[i]/2))*PI)+((enemyradius[j]/2)*(enemyradius[j]/2))*PI))/PI)*2;
          enemyradius[j]=int(random(50, 150));
        }
      }
    }
  }
  for (int i = 0; i < enemytotal; i++) {
    if (dist(enemyx[i]-posx, enemyy[i]-posy, 500, 500)<enemyradius[i]/2 && enemyradius[i]>playerradius) {
      enemyradius[i] = sqrt((((((playerradius/2)*(playerradius/2))*PI)+((enemyradius[i]/2)*(enemyradius[i]/2))*PI))/PI)*2;
      posx=0;
      posy=0;
      playerradius=50;
    }
  }
  for (int i = 0; i < coinnummer; i++) {
    if (dist(500, 500, coinsx[i]-posx, coinsy[i]-posy) < playerradius/2) {
      coinsx[i]=int(random(-2100, 2100)+posx);
      coinsy[i]=int(random(-2100, 2100)+posy);
      coinsc[i][0]=int(random(255));
      coinsc[i][1]=int(random(255));
      coinsc[i][2]=int(random(255));
      playerradius = sqrt((((((playerradius/2)*(playerradius/2))*PI)+((coinsradius[i]/4)*(coinsradius[i]/2))*PI))/PI)*2;
      ;
      println(playerradius + "     ");
      coinsradius[i]=int(random(20, 40));
    }
    if (dist(500, 500, coinsx[i]-posx, coinsy[i]-posy)>3000) {
      coinsx[i]=int(random(-2100, 2100)+posx);
      coinsy[i]=int(random(-2100, 2100)+posy);
      coinsc[i][0]=int(random(255));
      coinsc[i][1]=int(random(255));
      coinsc[i][2]=int(random(255));
      coinsradius[i]=int(random(20, 40));
    }
  }
  // Teken de speler
  fill(#F51616);
  circle((1000/2), (1000/2), playerradius);
}
