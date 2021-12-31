boolean isUP, isDOWN, isLEFT, isRIGHT;
int aeroliteNum = 3;
boolean spaceBarPressed = false; 
PImage [] aerolite = new PImage[aeroliteNum];
float [] aX = new float[aeroliteNum];
float [] aY = new float[aeroliteNum];
float [] aW = new float[aeroliteNum];
float [] aH = new float[aeroliteNum];
float [] aScale = new float[aeroliteNum];
float [] aSpeedX = new float[aeroliteNum];
float [] aSpeedY = new float[aeroliteNum];
boolean [] aAlive = new boolean[aeroliteNum];
int UFOkilled;
PImage [] button = new PImage[3];
PImage bg2;
PImage blueflame;
PImage Continue;
PImage dragon;
float dX;
float dY; 
float dW;  
float dH;
float dSpeedX;  
float dSpeedY; 
float dScale; 
boolean dAlive;
PImage FighterAircraft;
PImage flame;
PImage bg1;
PImage healthbar;
PImage UFOlaser;
PImage pause;
PImage play;
PImage ufo;
int continueX, continueY;
int continueW, continueH;
int playX, playY;
int playW, playH;
int stageNum;
int fX, fY, fW, fH;
int fSpeed;
int hX, hY, hW, hH;
int pauseW;
int pauseH;
int pauseX;
int score;
float bgY;
float bgSpeed;
int buttonX, buttonW, buttonH;
int totalNum = 5;
boolean [] ufoAlive = new boolean[totalNum];
boolean [] ULvisible = new boolean[totalNum];
float [] UFOlaserX = new float[totalNum];
float [] UFOlaserY = new float[totalNum];
float [] ufoX = new float[totalNum];
float [] ufoY = new float[totalNum];
float [] ufoW = new float[totalNum];
float [] ufoH = new float[totalNum];
float [] ufoScale = new float[totalNum];
float [] ufoSpeedX = new float[totalNum];
float [] ufoSpeedY = new float[totalNum];
int [] ufoHealth = new int[totalNum];
PImage laserF;
int laserFNum = 30;
boolean [] visible = new boolean[laserFNum];
float [] laserFX = new float[laserFNum];
float [] laserFY = new float[laserFNum];
float laserFSpeed;
int laserFH;
int laserFW;
int UFOlaserW;
int UFOlaserH;
float UFOlaserSpeed;
boolean found;
boolean flameVisible;
float flameX, flameY; 
int flameW, flameH;
float flameSpeed;
int dHealth;



void setup() {
  bg2 = loadImage("bg2.png");
  size(800, bg2.height);
  bg1 = loadImage("bg1.png");
  FighterAircraft = loadImage("FighterAircraft.png");
  Continue = loadImage("Continue.png");
  pause = loadImage("pause.png");
  play = loadImage("play.png");
  healthbar = loadImage("healthbar.png");
  ufo = loadImage("ufo.png");
  laserF = loadImage("laserF.png");
  UFOlaser = loadImage("UFOlaser.png");
  flame = loadImage("flame.png");
  UFOkilled = 0;
  continueX = 270;
  continueY = 550;
  continueW = 250;
  continueH = 60;
  playX = 320;
  playY = 600;
  playW = 150;
  playH = 50;
  stageNum = 0;
  fW = 100;
  fH = 120;
  fX = 350;
  fY = height - fH;
  hX = 40;
  hY = 25;
  hW = 100;
  hH = 40;
  fSpeed = 5;
  pauseW = 30;
  pauseX = width - pauseW;
  pauseH = 30;
  score = 0;
  bgY = 0;
  bgSpeed = -0.2;
  buttonX = 300;
  buttonW = 180;
  buttonH = 70;
  laserFW = UFOlaserW = 8;
  laserFH = UFOlaserH = 25;
  laserFSpeed = 5;
  UFOlaserSpeed = 3.5;
  dragon = loadImage("dragon.png");
  dAlive = false;
  dScale = 1.5;
  dW = dragon.width * dScale;
  dH = dragon.height * dScale;
  dX = random(0, height - dW);
  dY = -random(200, dH);
  dSpeedX = random(1, 2);
  dSpeedY = random(1, 2);
  dHealth = 300;
  isUP = false;
  isDOWN = false;
  isLEFT = false;
  isRIGHT = false; 
  flameW = 30;
  flameH = 50;
  flameSpeed = 3;
  flameVisible = false;
  for (int i = 0; i < aerolite.length; i++) {
    aAlive[i] = true;
    aerolite[i] = loadImage("aerolite" + i + ".png");
  }
  for (int i = 1; i < 3; i++) {
    aY[i] = random(height/2-200, height/2);
    aSpeedY[i] = random(1.5, 1.8);
  }
  aScale[0] = random(0.5, 0.6);
  aW[0] = aerolite[0].width * aScale[0];
  aH[0] = aerolite[0].height * aScale[0];
  aX[0] = random(0, width - aW[0]);
  aY[0] = -random(1000, 1500);
  aSpeedY[0] = random(1, 2);
  aScale[1] = random(0.15, 0.25);
  aW[1] = aerolite[1].width * aScale[1];
  aH[1] = aerolite[1].height * aScale[1];
  aX[1] = -random(2000, 2500);
  aScale[2] = random(0.25, 0.3);
  aW[2] = aerolite[2].width * aScale[2];
  aH[2] = aerolite[2].height * aScale[2];
  aX[2] = random(3000, 3500);
  aSpeedX[1] = random(1, 1.5);
  aSpeedX[2] = -random(0.5, 1);
  for (int i = 0; i < ufoX.length; i++) {
    ufoAlive[i] = true;
    ufoScale[i] = random(0.2, 0.35);
    ufoW[i] = ufo.width * ufoScale[i];
    ufoH[i] = ufo.height * ufoScale[i];
    ufoX[i] = random(0, width - ufoW[i]);
    ufoY[i] = -random(300, 250);
    ufoSpeedX[i] = random(-2.5, 3);
    ufoSpeedY[i] = random(1, 2);
    ufoHealth[i] = 30;
    ULvisible[i] = false;
  }
  for (int i = 0; i < button.length; i++) {
    button[i] = loadImage("button" + i + ".png");
  } 
  for (int i = 0; i < visible.length; i++) {
    visible[i] = false;
  }
}

void draw() {
  if (stageNum == 0) {
    drawmainmenu();
  } else if (stageNum == 1) {
    drawScenario();
  } else if (stageNum == 2) {
    drawInstructions();
  } else if (stageNum == 3) {
    drawGame();
  } else if (stageNum == 4) {
    pause();
  } else if (stageNum == 5) {
    resume();
  } else if (stageNum == 6) {
    restart();
  } else if (stageNum == 7) {
    exit();
  } else if (stageNum == 8) {
    gameover();
  }
}

void drawmainmenu() {
  image(bg2, 0, 0);
  fill(200, 204, 209);
  textSize(80);
  text("Galaxy Strike", 150, 250);
  fill(65, 125, 201);
  textSize(20);
  text("Press any key to start the game!", 240, 400);
  image(FighterAircraft, 320, 470, 150, 200);
}

void drawScenario() {
  image(bg2, 0, 0);
  fill(200, 204, 209);
  textSize(50);
  text("Scenario", 300, 100);
  textSize(30);
  text("Our galaxy is invaded by unknown creatures!", 75, 200);
  text("You have been chosen as the guardian of the", 75, 300);
  text("galaxy.", 75, 330);
  textSize(27);
  text("During the mission, you will pilot a fighter aircraft", 75, 430);
  text("to wipe out enemies.", 75, 460);
  image(Continue, continueX, continueY, continueW, continueH);
}

void drawInstructions() {
  image(bg2, 0, 0);
  fill(200, 204, 209);
  textSize(30);
  text("Instructions", 310, 90);
  textSize(20);
  text("1. Control the directions of the fighter aircraft by pressing the arrow", 60, 150); 
  text("keys", 85, 180);
  text("2. Press the SPACE button to attack enemies", 60, 250);
  textSize(19.5);
  text("3. Earning marks by defeating enemies, destroying aerolites or evading", 60, 310);
  text("the aerolites", 85, 340);
  textSize(20);
  text("4. Once the fighter aircraft is attacked, HP decreases", 60, 400);
  text("5. When the HP becomes zero, the mission fails", 60, 470);
  text("6. Pause the game at any time by clicking the     botton", 60, 540);
  image(pause, 505, 520, 25, 25);
  image(play, playX, playY, playW, playH);
}

void drawGame() {
  image(bg1, 0, bgY);
  image(bg1, 0, height + bgY);
  bgY = bgY + bgSpeed;
  if (bgY <= -height) {
    bgY = 0;
  }
  if (isUP) {
    fY = fY - fSpeed;
  }
  if (isDOWN) {
    fY = fY + fSpeed;
  }
  if (isLEFT) {
    fX = fX - fSpeed;
  }
  if (isRIGHT) {
    fX = fX + fSpeed;
  }
  if (fY >= height - fH) {
    fY = height - fH;
  }
  if (fX <= 0) {
    fX = 0;
  }
  if (fX >= width - fW) {
    fX = width - fW;
  }
  if (fY <= height*2/3) {
    fY = height*2/3;
  }
  
  if (dAlive == true) {
    image(dragon, dX, dY, dW, dH);
    dY = dY + dSpeedY; 
    if (dY >= 0) {
      dX = dX + dSpeedX;
      dSpeedY = 0;
    } 
    if (dX <= 0 || dX >= width - dW) {
      dSpeedX = -dSpeedX;
    }
    for (int i = 0; i < visible.length; i++) {
      if (laserFY[i] <= dY + dH && laserFX[i] <= dX + dW &&
          laserFX[i] + laserFW >= dX) {
            dHealth = dHealth - 10;
            visible[i] = false;
            found = true;
          }
      if (dHealth <= 0) {
        score = score + 1000;
        dW = dragon.width * dScale;
        dH = dragon.height * dScale;
        dX = random(0, height - dW);
        dY = -random(200, dH);
        dSpeedX = random(1, 2);
        dSpeedY = random(1, 2);
        dHealth = 300;
      }
    }
 }
  
  if (flameVisible == true) {
      image(flame, flameX, flameY, flameW, flameH);
      flameY = flameY + flameSpeed;
    } 
  if (found == true && flameVisible == false && dY >= 0) {
      flameVisible = true;
      flameX = dX + dW * 0.5;
      flameY = dY + dH;  
    }
  if (flameY >= height) {
      flameVisible = false;
      found = true;
    } 
  if (flameVisible == true && flameY + flameH >= fY && flameY <= fY + fH &&
      flameX + flameW >= fX && flameX <= fX + fW) {
       hW = hW - 30;       
       flameVisible = false;
       found = true;
    }   
  
   for (int i = 0; i < visible.length; i++) {
    if (visible[i] == true) {
      image(laserF, laserFX[i], laserFY[i], laserFW, laserFH);
      laserFY[i] = laserFY[i] - laserFSpeed;
    }
    if (laserFY[i] <= 0) {
      visible[i] = false;
      found = true;
    }
    if (found == true && visible[i] == false) {
      laserFX[i] = fX + 45;
      laserFY[i] = fY - 35;
    }
  
 }
 
  for (int i = 0; i < ufoX.length; i++) {
    if (ufoAlive[i] == true) {
      image(ufo, ufoX[i], ufoY[i], ufoW[i], ufoH[i]);
      ufoY[i] = ufoY[i] + ufoSpeedY[i];
      boolean found = false;
      
      if (ufoY[i] >= 0) 
        ufoX[i] = ufoX[i] + ufoSpeedX[i];
        
      
      if (ufoY[i] + ufoH[i] >= height/2
        || ufoY[i] <= 0 && ufoSpeedY[i] <=0) 
        ufoSpeedY[i] = -ufoSpeedY[i];
        
      if (ufoX[i] <= 0 || ufoX[i] >= width - ufoW[i])
        ufoSpeedX[i] = -ufoSpeedX[i];
       
      if (found == false && ULvisible[i] == false && ufoY[i] >= 0) {
        UFOlaserX[i] = ufoX[i] + ufoW[i]*0.5;
        UFOlaserY[i] = ufoY[i] + ufoH[i];
        ULvisible[i] = true;
        found = true;
      }
    
      if (ULvisible[i] == true) {
        image(UFOlaser, UFOlaserX[i], UFOlaserY[i], UFOlaserW, UFOlaserH);
        UFOlaserY[i] = UFOlaserY[i] + UFOlaserSpeed;
      }
    
      if (UFOlaserY[i] >= height) {
        ULvisible[i] = false;
      }
      if (UFOlaserX[i] <= fX + fW && UFOlaserX[i] + UFOlaserW 
      >= fX && UFOlaserY[i] <= fY + fH && UFOlaserY[i] + UFOlaserH >=
      fY) {
        hW = hW - 5;
        UFOlaserX[i] = ufoX[i] + ufoW[i]*0.5;
        UFOlaserY[i] = ufoY[i] + ufoH[i];
      }
    }
   for (int j = 0; j < visible.length; j++) {
   
    if (ufoY[i] >= 0 && laserFX[j] <= ufoX[i] + ufoW[i] && laserFX[j] + laserFW 
      >= ufoX[i] && laserFY[j] <= ufoY[i] + ufoH[i] && laserFY[j] + laserFH >=
      ufoY[i]) {
        ufoHealth[i] = ufoHealth[i] - 10;
        found = true;  
        visible[j] = false;
      }
     if (found == true && visible[j] == false) {
       laserFX[j] = fX + 45;
       laserFY[j] = fY - 35;
      }
     if (ufoHealth[i] <= 0) {
       score = score + 100;
       UFOkilled = UFOkilled + 1;
       ufoScale[i] = random(0.2, 0.35);
       ufoW[i] = ufo.width * ufoScale[i];
       ufoH[i] = ufo.height * ufoScale[i];
       ufoX[i] = random(0, width - ufoW[i]);
       ufoY[i] = -random(300, 250);
       ufoSpeedX[i] = random(-2.5, 3);
       ufoSpeedY[i] = random(1, 2);
       ufoHealth[i] = 30;  
      }
     if (UFOkilled >= 10 && dHealth > 0) {
       dAlive = true;
      }
   }
 }


  for (int i = 0; i < aerolite.length; i++) {
    if (aAlive[i] == true) {
      image(aerolite[i], aX[i], aY[i], aW[i], aH[i]);
      aY[0] = aY[0] + aSpeedY[0];
      aX[1] = aX[1] + aSpeedX[1];
      aX[2] = aX[2] + aSpeedX[2];

      if (aY[0] >= height) {
        score = score + 10;
        aX[0] = random(0, width - aW[0]);
        aY[0] = -random(1000, 1500);
      }
      if (aX[1] >= width || aY[1] >= height) {
        score = score + 10;
        aX[1] = -random(2000, 2500);
        aY[1] = random(height/2-200, height/2);
      }
      if (aX[2] + aH[2] <= 0 || aY[2] >= height) {
        score = score + 10;
        aX[2] = random(3000, 3500);
        aY[2] = random(height/2-200, height/2);
      }
      if (aX[1] + aW[1] >= 0) {
        aSpeedY[1] = 0.5;
        aY[1] = aY[1] + aSpeedY[1];
      }
      if (aX[2] <= width) {
        aSpeedY[2] = 0.5;
        aY[2] = aY[2] + aSpeedY[2];
      }
      if (aY[0] + aH[0] >= fY && aY[0] <= fY + fH && aX[0] <= fX + fW && aX[0] + aW[0] >= fX) {
        hW = hW - 10;
        aScale[0] = random(0.5, 0.6);
        aW[0] = aerolite[0].width * aScale[0];
        aH[0] = aerolite[0].height * aScale[0];
        aX[0] = random(0, width - aW[0]);
        aY[0] = -random(1000, 1500);
      }
      if (aY[1] + aH[1] >= fY && aY[1] <= fY + fH && aX[1] <= fX + fW && aX[1] + aW[1] >= fX) {
        hW = hW - 10;
        aScale[1] = random(0.15, 0.25);
        aW[1] = aerolite[1].width * aScale[1];
        aH[1] = aerolite[1].height * aScale[1];
        aX[1] = -random(2000, 2500);
        aY[1] = random(height/2-200, height/2);
      }
      if (aY[2] + aH[2] >= fY && aY[2] <= fY + fH && aX[2] <= fX + fW && aX[2] + aW[2] >= fX) {
        hW = hW - 10;
        aScale[2] = random(0.25, 0.3);
        aW[2] = aerolite[2].width * aScale[2];
        aH[2] = aerolite[2].height * aScale[2];
        aX[2] = random(3000, 3500);
        aY[2] = random(height/2-200, height/2);
      }
   }
}
      for (int j = 0; j < visible.length; j++) {
        if (visible[j] == true && laserFX[j] <= aX[0] + aW[0] && laserFX[j] + laserFW 
           >= aX[0] && laserFY[j] <= aY[0] + aH[0]) {
             score = score + 50;
             aScale[0] = random(0.5, 0.6);
             aW[0] = aerolite[0].width * aScale[0];
             aH[0] = aerolite[0].height * aScale[0];
             aX[0] = random(0, width - aW[0]);
             aY[0] = -random(1000, 1500);          
             visible[j] = false; 
             found = true;  
     }
        if (visible[j] == true && laserFX[j] <= aX[1] + aW[1] && laserFX[j] + laserFW 
           >= aX[1] && laserFY[j] <= aY[1] + aH[1]) {
             score = score + 50;
             aScale[1] = random(0.15, 0.25);
             aW[1] = aerolite[1].width * aScale[1];
             aH[1] = aerolite[1].height * aScale[1];
             aX[1] = random(0, width - aW[1]);
             aY[1] = -random(1000, 1500);
             visible[j] = false;
             found = true;  
           }
       if (visible[j] == true && laserFX[j] <= aX[2] + aW[2] && laserFX[j] + laserFW 
           >= aX[2] && laserFY[j] <= aY[2] + aH[2]) {
             score = score + 50;
             aScale[2] = random(0.25, 0.3);
             aW[2] = aerolite[2].width * aScale[2];
             aH[2] = aerolite[2].height * aScale[2];
             aX[2] = random(0, width - aW[2]);
             aY[2] = -random(1000, 1500);
             visible[j] = false;
             found = true;  
           }
        if (found == true && visible[j] == false) {
             laserFX[j] = fX + 45;
             laserFY[j] = fY - 35;
        }
          
      }
  
  if (hW <= 0) {
        stageNum = 8;
      }     
  textSize(20);
  fill(178, 207, 252);
  text("Score: " + score, 5, 20);
  text("HP:", 5, 50);
  image(healthbar, hX, hY, hW, hH);
  image(pause, pauseX, 0, pauseW, pauseH);
  image(FighterAircraft, fX, fY, fW, fH);
}


void pause() {
  fill(27, 30, 59);
  stroke(162, 156, 156);
  strokeWeight(4);
  rect(250, 150, 280, 370);
  for (int i = 0; i < button.length; i++)
  {
    image(button[i], buttonX, i*100+200, buttonW, buttonH);
  }
}

void resume() {
  fSpeed = 5;
  stageNum = 3;
}

void restart() {
  UFOkilled = 0;
  fSpeed = 5;
  stageNum = 3;
  bgY = 0;
  score = 0;
  fW = 100;
  fH = 120;
  fX = 350;
  fY = height - fH;
  for (int i = 0; i < ufoX.length; i++) {
    ufoScale[i] = random(0.2, 0.35);
    ufoW[i] = ufo.width * ufoScale[i];
    ufoH[i] = ufo.height * ufoScale[i];
    ufoX[i] = random(0, width - ufoW[i]);
    ufoY[i] = -random(300, 250);
    ufoSpeedX[i] = random(-2, 2);
    ufoSpeedY[i] = random(1, 2);
    ULvisible[i] = false;
  }
  for (int i = 0; i < visible.length; i++) {
    visible[i] = false;
  }
  aScale[0] = random(0.5, 0.6);
  aW[0] = aerolite[0].width * aScale[0];
  aH[0] = aerolite[0].height * aScale[0];
  aX[0] = random(0, width - aW[0]);
  aY[0] = -random(1000, 1500);
  aSpeedY[0] = random(1, 2);
  aScale[1] = random(0.15, 0.25);
  aW[1] = aerolite[1].width * aScale[1];
  aH[1] = aerolite[1].height * aScale[1];
  aX[1] = -random(2000, 2500);
  aScale[2] = random(0.2, 0.3);
  aW[2] = aerolite[2].width * aScale[2];
  aH[2] = aerolite[2].height * aScale[2];
  aX[2] = random(3000, 3500);
  aSpeedX[1] = random(1, 1.5);
  aSpeedX[2] = -random(0.5, 1);
  for (int i = 0; i < aerolite.length; i++) {
    aAlive[i] = true;
    aerolite[i] = loadImage("aerolite" + i + ".png");
  }
  for (int i = 1; i < 3; i++) {
    aY[i] = random(height/2-200, height/2);
    aSpeedY[i] = random(1.5, 1.8);
  }
  dAlive = false;
  dScale = 1.5;
  dW = dragon.width * dScale;
  dH = dragon.height * dScale;
  dX = random(0, height - dW);
  dY = -random(200, dH);
  dSpeedX = random(1, 2);
  dSpeedY = random(1, 2);
  dHealth = 300;
  hW = 100;
  flameVisible = false;
}

void gameover() {
  fill(27, 30, 59);
  stroke(162, 156, 156);
  strokeWeight(4);
  rect(250, 150, 280, 370);
  fill(200, 204, 209);
  textSize(40);
  text("Game Over!", 275, 200);
  textSize(30);
  text("Score: " + score, 300, 280);
  for (int i = 0; i < button.length; i++) {
    if (i == 1 || i == 2) {
  image(button[i], 300, i*100+230, buttonW, buttonH);
  }
 }
}

void keyPressed() {
  if (keyCode == ESC) {
    key = 0;
  }
  if (stageNum == 0) {
    stageNum = 1;
  }
  if (stageNum == 3 && key == ' ') {
    if (spaceBarPressed == false) {
      spaceBarPressed = true; 
      boolean found = false;
      for (int i = 0; i < visible.length; i++) {
        if (found == false && visible[i] == false) {
          laserFX[i] = fX + 45;
          laserFY[i] = fY - 35;
          visible[i] = true;
          found = true;
        }
      }
    }
  }
  if (keyCode == UP)
    isUP=true;
  if (keyCode == DOWN)
    isDOWN=true;
  if (keyCode == LEFT)
    isLEFT=true;
  if (keyCode == RIGHT)
    isRIGHT=true;
}

void keyReleased() {
  if (stageNum == 3 && key == ' ') {
    spaceBarPressed = false;
  }
  if (keyCode == UP)
    isUP=false;
  if (keyCode == DOWN)
    isDOWN=false;
  if (keyCode == LEFT)
    isLEFT=false;
  if (keyCode == RIGHT)
    isRIGHT=false;
}

void mousePressed() {
  if (stageNum == 1 && mouseX > continueX && 
    mouseX < continueX + continueW &&
    mouseY > continueY && mouseY < continueY + continueH) {

    stageNum = 2;
  } else if (stageNum == 2 && mouseX > playX && mouseX < playX + playW && 
    mouseY > playY && mouseY < playY + playH) {

    stageNum = 3;
  } else if (stageNum == 3 && mouseX > pauseX && mouseX < pauseX + pauseW 
    && mouseY > 0 && mouseY < pauseH) {

    stageNum = 4;

  } else for (int i = 0; i < button.length; i++) {

    if (stageNum == 4 && mouseX > buttonX && mouseX < buttonX + buttonW &&
      mouseY > i*100+200 && mouseY < i*100+200+buttonH) {

      if (i == 0) {
        stageNum = 5;
      } else if (i == 1) {
        stageNum = 6;
      } else if (i == 2) {
        stageNum = 7;
      }
    }
     if (stageNum == 8 && mouseX > 300 && mouseX < 300 + buttonW &&
     mouseY > i*100+230 && mouseY < i*100+230+buttonH) {
       
      if (i == 1) {
        stageNum = 6;
      } else if (i == 2) {
        stageNum = 7;
      }
     }
   }
 } 









        
          
        
        

  
    
      
      
    
 









