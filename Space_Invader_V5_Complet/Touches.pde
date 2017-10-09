void touches() {
  background(0);
  retour();
  texteTouche();
  affichageTouches();
}

void texteTouche() {
  fill(255, 0, 0);
  textFont(CosAl, 100);
  textAlign(CENTER, CENTER);
  text("TOUCHES", TFx/2, 100);
}

void affichageTouches() {
  fill(255);
  textFont(CosAl, 30);
  textAlign(CENTER, CENTER);
  text("ESPACE(J1) HAUT(J2) - Tirer              ", TFx/2, 250);
  text("           Q/D (J1) - Se Deplacer        ", TFx/2, 300);
  text("  GAUCHE/DROITE(J2) - Se Deplacer        ", TFx/2, 350);
  text("                  P - Pause              ", TFx/2, 400);
  text("                  R - Reprendre          ", TFx/2, 450);
  text("              Echap - Quitter            ", TFx/2, 500);
}