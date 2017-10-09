//easter egg a add

void accueil() {
  background(0); //fond noir
  //affichage
  spaceInvaders(); //titre
  unjoueur(); //case 1p
  deuxjoueurs(); //case 2p
  options(); //case options
  commandes(); //...
  quitter();
  easter_egg(); //gestion easter egg
  alien(); //gestion de l'alien en bas de lecran
}

//AFFICHAGE TITRE
void spaceInvaders() {
  fill(255, 0, 0); //couleur
  textFont(CosAl, 100); //police
  textAlign(CENTER, CENTER); //mode de texte
  text("SPACE INVADERS", TFx/2, 100); //ecriture
}

void unjoueur() {
  fill(255); //couleur de fond
  if (mouseX < TFx/2 && mouseX > TFx/2 - 175 && mouseY < TFy/2 -85 && mouseY > TFy/2 - 175) {
    fill(232, 229, 229); //couleur de fond avec le passage de la souris
  }
  rectMode(CENTER);
  rect(TFx/2-88, TFy/2-130, 175, 90); //rectangle du bouton
  fill(0); //couleur ecrit
  textFont(CosAl, 50); //police
  textAlign(CENTER, CENTER); //mode de texte
  text("1P", TFx/2-88, TFy/2-130); //ecriture
}

void deuxjoueurs() {
  //comme unjoueur()
  fill(255);
  if (mouseX > TFx/2 && mouseX < TFx/2 + 175 && mouseY < TFy/2 -85 && mouseY > TFy/2 - 175) {
    fill(232, 229, 229);
  }
  rectMode(CENTER);
  rect(TFx/2+88, TFy/2-130, 175, 90);
  fill(0);
  textFont(CosAl, 50);
  textAlign(CENTER, CENTER);
  text("2P", TFx/2+88, TFy/2-130);
}

void options() {
  //comme unjoueur()
  fill(255);
  if (mouseX > TFx/2 - 175 && mouseX < TFx/2 + 175 && mouseY < TFy/2 +15 && mouseY > TFy/2 - 75) {
    fill(232, 229, 229);
  }
  rectMode(CENTER);
  rect(TFx/2, TFy/2-30, 350, 90);
  fill(0);
  textFont(CosAl, 50);
  textAlign(CENTER, CENTER);
  text("OPTIONS", TFx/2, TFy/2-30);
}

void commandes() {
  //comme unjoueur()
  fill(255);
  if (mouseX > TFx/2 - 175 && mouseX < TFx/2 + 175 && mouseY < TFy/2 +115 && mouseY > TFy/2 +25) {
    fill(232, 229, 229);
  }
  rectMode(CENTER);
  rect(TFx/2, TFy/2+70, 350, 90);
  fill(0);
  textFont(CosAl, 50);
  textAlign(CENTER, CENTER);
  text("commandes", TFx/2, TFy/2+70);
}

void quitter() {
  //comme unjoueur()
  fill(255);
  if (mouseX > TFx/2 - 175 && mouseX < TFx/2 + 175 && mouseY < TFy/2 +215 && mouseY > TFy/2 +125) {
    fill(232, 229, 229);
  }
  rectMode(CENTER);
  rect(TFx/2, TFy/2+170, 350, 90);
  fill(0);
  textFont(CosAl, 45);
  textAlign(CENTER, CENTER);
  text("Quitter", TFx/2, TFy/2+170);
}

void alien() {
  fill(couleurAlien);
  textFont(Invaders, 40); //police de l'alien
  text(persoAlien, xAlien, TFy - ((TFy) - (TFy/2 + 150))/2 +10 ); //affichage de l'alien
  xAlien=xAlien+3; //mouvement de l'alien
  //si sort de l'écran
  if (xAlien>TFx+100) {
    xAlien=0; //reset de sa position
    couleurAlien=color(random(1, 255), random(1, 255), random(1, 255)); //changelent de couleur
    int temp =int(random(65, 90)); //random de la lettre utilisee
    persoAlien = char(temp); //mie en place de la lettre de l'alien
  }
}

//gestion de l'easter egg de l'accueil
void easter_egg() {
  //test de validation du code
  if ( codeBanana_i==codeBanana.length() ) {
    imageMode(CENTER);
    image(easterEggBanana, TFx/4, TFy/2);//affichage gif gauche
    image(easterEggBanana, 3*TFx/4, TFy/2);//affichage gif droit
  }
}