//ECRAN CHOIX DIFFICULTE
void Difficulte() {
  background(0);
  afftitre();
  affselection();
  affcharger();
}

void afftitre() {
  fill(255, 0, 0); //couleur
  textFont(CosAl, 100); //police
  textAlign(CENTER, CENTER); //mode de texte
  text("DIFFICULTE", TFx/2, 100); //ecriture
}

void affselection() {
  fill(255);
  rectMode(CENTER);
  //affichage carrée de sélection
  //facile
  if (mouseX > TFx/2 - 530 && mouseX < TFx/2 - 180 && mouseY < TFy/2-100+45 && mouseY > TFy/2-100-45) {
    fill(232, 229, 229);
  }
  rect(TFx/2-355, TFy/2-100, 350, 90);
  //moyen
  fill(255);
  if (mouseX > TFx/2 - 175 && mouseX < TFx/2 + 175 && mouseY < TFy/2-100+45 && mouseY > TFy/2-100-45) {
    fill(232, 229, 229);
  }
  rect(TFx/2, TFy/2-100, 350, 90);
  //difficulte
  fill(255);
  if (mouseX > TFx/2 +180 && mouseX < TFx/2 + 530 && mouseY < TFy/2-100+45 && mouseY > TFy/2-100-45) {
    fill(232, 229, 229);
  }
  rect(TFx/2+355, TFy/2-100, 350, 90);


  //affichage texte dans carrée
  fill(0);
  textFont(CosAl, 40);
  textAlign(CENTER, CENTER);
  text("facile", TFx/2-350, TFy/2-100);
  text("moyen", TFx/2, TFy/2-100);
  text("difficile", TFx/2+350, TFy/2-100);
}
//CHARGER PARTIE
void affcharger(){
fill(255);
if (mouseX > TFx/2 - 250 && mouseX < TFx/2 + 250 && mouseY < TFy/2+50+45 && mouseY > TFy/2+50-45) {
  fill(232, 229, 229);
}
rect(TFx/2, TFy/2+50, 500, 90);
fill(0);
 text("Charger partie", TFx/2, TFy/2+50);
}

//ECRAN CHOIX LVL
void affniv() {
  background (0);
  rectangleniveau ();
}

void rectangleniveau () {

  fill(255);
  rectMode(CENTER);
  rect(TFx/2-170, TFy/2, 80, 80);
  rect(TFx/2-85, TFy/2, 80, 80);
  rect(TFx/2, TFy/2, 80, 80);
  rect(TFx/2+85, TFy/2, 80, 80);
  rect(TFx/2+170, TFy/2, 80, 80);
  fill(0);
  textAlign(CENTER);
  text("1", TFx/2-170, TFy/2);
  text("2", TFx/2-85, TFy/2);
  text("3", TFx/2, TFy/2);
  text("4", TFx/2+85, TFy/2);
  text("5", TFx/2+170, TFy/2);

  textAlign(CENTER);
  textFont(CosAl, 50);
  fill(255, 0, 0);
  switch(difficulte) {
  case 0:
    text("niveau facile, difficulte", TFx/2, 100);
    break;
  case 1:
    text("niveau moyen, difficulte", 640, 250);
    break;
  case 2:
    text("niveau difficile, difficulte", 640, 250);
    break;
  }
}

//ECRAN READY
void ecran_ready() {
  background(0);
  fill(255, 0, 0);
  textFont(CosAl, 150);
  textAlign(CENTER, CENTER);
  textSize(75);
  text("SOLO", 1280/2, 100);

  fill(255);
  if (mouseX<1280 && mouseX>1030 && mouseY<720 && mouseY>680) {
    fill(232, 229, 229);
  }

  /*rectMode(CORNERS);
   rect(1030, 680, 1280, 720); 
   fill(0);
   textFont(CosAl, 40);
   textAlign(RIGHT, BOTTOM);
   text("Settings", 1280, 715);*/

  fill(255);
  if (mouseX<TFx/2+150 && mouseX>TFx/2-150 && mouseY<TFy/2+120 && mouseY>TFy/2-120) {
    fill(232, 229, 229);
  }
  rectMode(CENTER);
  rect(TFx/2, TFy/2, 300, 120);
  fill(0);
  textFont(CosAl, 150);
  textAlign(CENTER, BOTTOM);
  textSize(50);
  text("READY ?", 1280/2, 370);
}