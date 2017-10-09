void param() {
  background(0);
  //boucle d'affichage (pour les commentaires des fonctions simples voir onglet menu fonction unjoueur()
  setings(); //desole pour la faute settings est un mot reserve
  retour();
  setAlienSpeed();
  setColonne();
  setRangee();
  setVitesseMissile();
}

void setings() {
  fill(255, 0, 0);
  textFont(CosAl, 100);
  textAlign(CENTER, CENTER);
  text("OPTIONS", TFx/2, 100);
}

void setAlienSpeed() {
  fill(255);
  textFont(CosAl, 30);
  textAlign(CENTER, CENTER);
  text("Vitesse", TFx/4, 200);
  //triangle
  triangle(7*TFx/8 - 30, 185, 7*TFx/8 - 30, 215, 7*TFx/8, 200  );//fleche droite
  triangle(5*TFx/8 + 30, 185, 5*TFx/8 + 30, 215, 5*TFx/8, 200  );//fleche gauche
  //vitesse
  textAlign(CENTER, CENTER);
  text(abs(incrementX), 3*TFx/4, 200);
}

void setColonne() {
  fill(255);
  textFont(CosAl, 30);
  textAlign(CENTER, CENTER);
  text("Colonnes", TFx/4, 250);
  //triangle
  triangle(7*TFx/8 - 30, 235, 7*TFx/8 - 30, 265, 7*TFx/8, 250  );//droite
  triangle(5*TFx/8 + 30, 235, 5*TFx/8 + 30, 265, 5*TFx/8, 250  );//gauche
  //vitesse
  textAlign(CENTER, CENTER);
  text(colonnes, 3*TFx/4, 250);
}

void setRangee() {
  fill(255);
  textFont(CosAl, 30);
  textAlign(CENTER, CENTER);
  text("Rangees", TFx/4, 300);
  //triangle
  triangle(7*TFx/8 - 30, 285, 7*TFx/8 - 30, 315, 7*TFx/8, 300  );//droite
  triangle(5*TFx/8 + 30, 285, 5*TFx/8 + 30, 315, 5*TFx/8, 300  );//gauche
  //vitesse
  textAlign(CENTER, CENTER);
  text(rangees, 3*TFx/4, 300);
}

void setVitesseMissile() {
  fill(255);
  textFont(CosAl, 30);
  textAlign(CENTER, CENTER);
  text("Vitesse du missile", TFx/4, 350);
  //triangle
  triangle(7*TFx/8 - 30, 335, 7*TFx/8 - 30, 365, 7*TFx/8, 350  );//droite
  triangle(5*TFx/8 + 30, 335, 5*TFx/8 + 30, 365, 5*TFx/8, 350  );//gauche
  //vitesse
  textAlign(CENTER, CENTER);
  text(vitesseMissile, 3*TFx/4, 350);
}


void retour() {
  fill(255);
  textFont(CosAl, 30);
  textAlign(TOP, RIGHT);
  text("Retour", 5, 25);
}