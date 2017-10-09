void jeu2P() {
  background(0);
  temp_recharge=2;
  compteur=compteur+1; //variable de compteur augmentant a chaque passage
  //temps de recharge
  rechargement();
  //carré de deplacement
  zone();
  //test positions extremes
  testTableau();
  //gestion ennemis
  mouvementEnnemis(); 
  affichageEnnemis();
  affichageMystere();
  //missile
  miseAFeu();
  //dev option
  suppressionEnnemiSouris();
  //rempart
  affichageRempart();
  //vaisseau
  gestion_vaisseaux();
  gestion_missile();
  gestion_bombes();
  //score
  affichageScore();
  //vie
  affichageVie();
  //fin du jeu
  gameOver();
}