//JEU
void jeu1P() {
  background(0);
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
  gestionSurchauffe();
  //score
  affichageScore();
  //surchaffe
  affichageSurchauffe();
  //vie
  affichageVie();
  //fin du jeu
  gameOver();
}

void gestionSurchauffe() {
  if (TFx-252 + compteurMissile <= TFx-50) surchauffeX=TFx-252 + compteurMissile;

  if (Espace==false && Up==false && surchauffeX > TFx-252) compteurMissile-=0.5;
}

void affichageSurchauffe() {
  fill(0);
  stroke(255);
  strokeWeight(2);
  rectMode(CORNERS);
  rect(TFx-254, 20, TFx-52, 40);
  fill(255, 0, 0);
  noStroke();
  rect(TFx-252, 22, surchauffeX, 39);
  /*if(x>200){
   fill(0,255,0);
   textAlign(CENTER,CENTER);
   textSize(30);
   text("Overheating",150,35);
   }*/
}

//gestion des bombes
void gestion_bombes() {
  if (compteur%120==1) { //intervalle entre les bombes (120/fps)
    int colonne_lanceur = int(random(0, colonnes-1));//random de la colonne de lancer
    int rangee_lanceur =0;
    //cherche l'alien ayant une vue vers le sol pour lui faire tirer la bombe et eviter de lancer depuis le milieu du groupe
    for (int i = 0; i<rangees; i++) {
      if (ennemis[colonne_lanceur][i] != ' ')  rangee_lanceur = i;
    }
    //ajout de la bombe avec une securite en cas de bug
    if (ennemis[colonne_lanceur][rangee_lanceur] != ' ')    bombes.add(new Bombe(rangee_lanceur, colonne_lanceur));
  }
  //actualisation pour chaque bombe de ses differentes fonctions
  for (int i = 0; i < bombes.size(); i++) {
    bombes.get(i).collision(i);
    bombes.get(i).chute();
    bombes.get(i).affichage();
  }
}

//rechargement
void rechargement() {
  //augementation d une variable de recharge au cours du temps
  if (compteur % 15 == 1) {
    recharge += 1;
  }
}
//lancement du missile
void miseAFeu() {
  //verification de la temporisation de charge
  if (recharge>= temp_recharge && surchauffeX< TFx-55) {
    //si une touche de lancement est appuyee
    if (Espace) {
      tir.rewind();
      fill(255);
      missiles.add(new Missile(2));//lancement du missile
      compteurMissile+=5; //ajout de 1 au compteur de surchauffe missile
      recharge=0; //reset de la recharge
      tir.play(); //joue le son de tir
    }
    //idem
    if (Up) {
      tir.rewind();
      fill(255);
      missiles.add(new Missile(1));
      compteurMissile+=5; //ajout de 1 au compteur de surchauffe missile
      recharge=0;
      tir.play();
    }
  }
}

//Initialisation des ennemis
void TableauEnnemis() {
  ennemis = new char[colonnes][rangees]; // chaque cellule prend comme valeur 0

  // Changer la valeur des cellules
  for (i=0; i < colonnes; i=i+1) {
    for (j=0; j <rangees; j=j+1) {
      switch(j) {
      case 0:
        ennemis[i][j] = 'A'; //type d'ennemi 1
        break;
      case 1:
        ennemis[i][j] = 'C'; //type d'ennemi 2
        break;
      case 2:
        ennemis[i][j] = 'E'; //...
        break;
      case 3:
        ennemis[i][j] = 'G';
        break;
      case 4:
        ennemis[i][j] = 'I';
        break;
      case 5:
        ennemis[i][j] = 'K';
        break;
      case 6:
        ennemis[i][j] = 'M';
        break;
      }
    }
  }
}

//contours de la zone de jeu
void zone() {
  //tracer les 4 lignes de contour en blanc
  fill(255);
  stroke(255);
  line(marge, marge, marge, TFy-marge);
  line(marge, marge, TFx-marge, marge);
  line(marge, TFy-marge, TFx-marge, TFy-marge);
  line(TFx-marge, marge, TFx-marge, TFy-marge);
}

//option de debug pour supprimer les ennemis a l'aide de la souris
void suppressionEnnemiSouris() {
  //test de souris cliquee
  if (mousePressed) {
    xSourisAbsol = int((mouseX - correctionX - incrementX - decalageX)/largeurColonne); //determine le x de lennemi visé
    ySourisAbsol = int((mouseY - correctionY - incrementY + marge)/hauteurRangee);//determine le y de lennemi visé
    if (0 <= xSourisAbsol && xSourisAbsol < colonnes && 0 <= ySourisAbsol && ySourisAbsol < rangees) { //evite le out of array
      if (ennemis[xSourisAbsol][ySourisAbsol]==' ') { //verifie que le clic soit pas sur un trou
      } else {
        ennemis[xSourisAbsol][ySourisAbsol]=' '; //supprime l ennemi
        invaderkilled.rewind();
        invaderkilled.play(); //joue le son
        ennemi_killed += 1; //ajoute un au compteur d'ennemi tue
        dejapasse = false; //reset le vaisseau mystere
      }
    }
  }
}

//test des limites du tableau pour les collisions sur les cotes et en bas
void testTableau() {
  //reset des variables de sortie de test
  testL=0;
  testR=0;
  testB=0;
  //test limites
  //limite droite
  if (testR==0) {
    for (i=0; i < colonnes; i=i+1) {
      for (j=0; j <rangees; j=j+1) {
        if (ennemis[i][j]!=' ') {
          ifinR=i+1;
          testR=1;
        }
      }
    }
  }
  //limite gauche
  if (testL==0) {
    for (i=colonnes-1; i >= 0; i=i-1) {
      for (j=rangees-1; j >= 0; j=j-1) {
        if (ennemis[i][j]!=' ') {
          ifinL=i; //pas de +1 car besoin de la position a gauche de la case
          testL=1;
        }
      }
    }
  }
  //limite basse
  if (testB==0) {
    for (j=0; j < rangees; j=j+1) {
      for (i=0; i < colonnes; i=i+1) {
        if (ennemis[i][j]!=' ') {
          jfinB=j;
          testB=1;
        }
      }
    }
  }
}


void mouvementEnnemis() {
  //calcul position extremes gauche droite et basse
  xEnnemiL = ifinL * largeurColonne + correctionX + incrementX + decalageX; 
  xEnnemiR = ifinR * largeurColonne + correctionX + incrementX + decalageX;
  yEnnemiB = jfinB * hauteurRangee + correctionY +incrementY;
  //test de collision sur les bords droits et gauche
  if (xEnnemiL <= marge || xEnnemiR >= TFx - marge) {//si collision
    incrementX = -incrementX; //inversion du deplacement en x
    incrementY = incrementY +10; //descente d'un cran
  } else {
    decalageX = decalageX + incrementX; //sinon continue a avancer
  }
}

void affichageEnnemis() {
  textFont(Invaders, Invaders_Size); //selection police
  if (compteur % 30 == 1) { //toute les demi secondes
    incr = -incr; //changement de l'increment (pour changer limage de lalien et le mettre en mouvement)
  }
  // Afficher les cellules
  for (i = 0; i < colonnes; i = i + 1) {
    for (j = 0; j < rangees; j = j + 1) {
      if (compteur % 30 == 1 && ennemis[i][j]!=' ') {        
        int cgt_lettre= int(ennemis[i][j] + incr);
        ennemis[i][j]= char(cgt_lettre);
      }
      xEnnemi = i * largeurColonne + correctionX + incrementX + decalageX; //calcul position en x
      yEnnemi = j * hauteurRangee + correctionY + incrementY; //calcul position y
      couleur(); //selection de la couleur
      text(ennemis[i][j], xEnnemi, yEnnemi); //ecriture de l'ennemi
    }
  }
}

void couleur() {
  //change de couleur a chaque rangee
  switch(j) {
  case 0:
    fill(255, 0, 0);
    break;
  case 1:
    fill(249, 3, 210);
    break;
  case 2:
    fill(132, 3, 233);
    break;
  case 3:
    fill(21, 238, 227);
    break;
  case 4:
    fill(4, 255, 0);
    break;
  case 5:
    fill(246, 253, 2);
    break;
  case 6:
    fill(255, 128, 0);
    break;
  }
  if (ennemis[i][j]==' ') {
    fill(255);
  }
}

void gameOver() {
  //test de collision basse
  if (yEnnemiB > TFy-marge || vie==0) { //si oui
    gameOver=1;
    mode=6;
  }
  //test de gain (tableau ennemi vide)
  if (ennemi_killed == colonnes*rangees || vieJ1==0 || vieJ2 ==0) {
    gameOver=2;
    mode=6;
  }
}

void affichageScore() {
  textFont(CosAl, 20); //choix police et taille
  switch(players) {
  case 1:
    fill(255); //choisi la couleur d'ecriture
    text("Score : " + score, 25, 20); //ecriture
    break;
  case 2:
    //Vaisseau 1
    fill(0, 128, 0); //choisi la couleur d'ecriture
    text("Score : " + scoreJ1, 25, 20); //ecriture
    //Vaisseau 2
    fill(234, 39, 194); //choisi la couleur d'ecriture
    text("Score : " + scoreJ2, TFx-200, 20); //ecriture
    break;
  }
}

void affichageRempart() {
  //création des remparts en bas 
  noStroke();
  fill(rempart1);
  rect(150, TFy-125, 50, 55);
  fill(rempart2);
  rect(350, TFy-125, 50, 55);
  fill(rempart3);
  rect(550, TFy-125, 50, 55);
  fill(rempart4);
  rect(750, TFy-125, 50, 55);
  fill(rempart5);
  rect(950, TFy-125, 50, 55);
  fill(rempart6);
  rect(1150, TFy-125, 50, 55);
}
void affichageVie() {
  switch(players) {
  case 1:
    fill(255);
    text("Vie : " + vie, 25, 40); //ecriture
    break;
  case 2:
    //J1
    fill(0, 128, 0);
    text("Vie : " + vieJ1, 25, 40); //ecriture
    //J2
    fill(234, 39, 194);
    text("Vie : " + vieJ2, TFx-200, 40); //ecriture
    break;
  }
}

void gestion_vaisseaux() {
  for (int i = 0; i < vaisseaux.size(); i++) {    
    vaisseaux.get(i).mouvement(i);
    vaisseaux.get(i).affichage(i);
  }
}

void gestion_missile() {
  //gestion missile
  for (int i = 0; i < missiles.size(); i++) {    
    missiles.get(i).collision();
    missiles.get(i).chute();
    missiles.get(i).affichage(i);
  }
}

//MYSTERE
//AFFICHAGE
void affichageMystere() {
  int test=0;
  textFont(Invaders, Invaders_Size); //selection police
  fill(212, 175, 55); //selection couleur
  if (mystery==false && dejapasse==false)  test = int(random(0, 600)); //si le vaisseau n'est pas la est n'est pas passé random d'une valeur
  //si cette valeur vaut 300
  if (test==300) {
    mystery = true; //lancement du mystery ship
    xMystery = TFx-50-marge; //initialisation de sa position
  }
  //s'il est deja passe annulation de l'affichage et du mouvement
  if (dejapasse == true) {
    mystery = false;
  }
  //S'il est present
  if (mystery == true) {
    xMystery -= 10; //mouvement
    if (xMystery < marge) { //s'il touche le bord de la zone de jeu
      xMystery = TFx + 50; //sortie de l'ecran
      mystery = false; //supression du mouvement
      dejapasse = true; //activation de la variable de passage
    }
  }
  text('1', xMystery, yMystery); //afichage du vaisseau
}

//FENETRE CONTEXTUELLE DE PAUSE
void pause() {
  rectMode(CENTER);
  fill(34, 34, 34);
  rect(TFx/2, TFy/2, 400, 400); //rectangle gris
  textAlign(CENTER, CENTER);
  fill(0, 0, 255);
  textFont(CosAl, 40);
  text("PAUSE", TFx/2, TFy/2-100); //ecriture "pause"
  //emplacements des textes (rectangles bleus)
  rect(TFx/2, TFy/2-25, 350, 50);
  rect(TFx/2, TFy/2+50, 350, 50);
  rect(TFx/2, TFy/2+125, 350, 50); 
  fill(0);
  textFont(CosAl, 30);
  //ecriture du contenu des rectangles
  text("Resume", TFx/2, TFy/2-25);
  text("Menu Principal", TFx/2, TFy/2+50);
  text("Sauvegarder", TFx/2, TFy/2+125);
}

//GESTION DE FIN DU JEU
void finDuJeu() {
  fond.pause(); //arret de la musique
  //TEST WIN / LOOSE
  switch(gameOver) {
  case 1: //perdu
    loose();
    gestion_hiscore();
    replay();
    break;
  case 2: //gagne
    win();
    gestion_hiscore();
    replay();
    break;
  }
}

//EN CAS DE PERTE
void loose() {   
  background(0); //recouvre d'un fond noir
  fill(255, 0, 0); //choisi la couleur d'ecriture
  textFont(CosAl, 150); //choix police et taille
  textAlign(CENTER, CENTER);
  text("Game Over", TFx/2, TFy/2-100); //ecriture de game over
  textAlign(CENTER, CENTER);
  textFont(CosAl, 40); //choix police et taille
  fill(255); //choisi la couleur d'ecriture
  switch(players) {
  case 1:
    text("Score : " + score, TFx/2, TFy-100);
    text("Hi-Score : " + hiscore, TFx/2, TFy-50);
    break;
  case 2:
    text("Score J1 : " + scoreJ1, TFx/3, TFy-100);
    text("Score J2 : " + scoreJ2, 2*TFx/3, TFy-100);
    //text("Hi-Score : " + int_hiscore, TFx/2, TFy-50);
    break;
  }
  gameoversong.play();
}

//EN CAS DE GAIN
void win() {   
  background(0); //recouvre d'un fond noir
  fill(0, 255, 0); //choisi la couleur d'ecriture
  textFont(CosAl, 150); //choix police et taille
  textAlign(CENTER, CENTER);
  switch(players) {
  case 1:
    text("Win !!", TFx/2, TFy/2-100); //ecriture de game over
    break;
  case 2:
    if (scoreJ1 > scoreJ2 || vieJ2 == 0) {
      text("J1 Win !!", TFx/2, TFy/2-100); //ecriture de game over
    }
    if (scoreJ2 > scoreJ1 || vieJ1 ==0) {
      text("J2 Win !!", TFx/2, TFy/2-100); //ecriture de game over
    }
    if (scoreJ2 == scoreJ1 && vieJ1*vieJ2 !=0) {
      text("Egalite !!", TFx/2, TFy/2-100); //ecriture de game over
    }
    break;
  }
  textAlign(CENTER, CENTER);
  textFont(CosAl, 40); //choix police et taille
  fill(255); //choisi la couleur d'ecriture
  switch(players) {
  case 1:
    text("Score : " + score, TFx/2, TFy-100);
    text("Hi-Score : " + hiscore, TFx/2, TFy-50);
    break;
  case 2:
    text("Score J1 : " + scoreJ1, TFx/3, TFy-100);
    text("Score J2 : " + scoreJ2, 2*TFx/3, TFy-100);
    //text("Hi-Score : " + int_hiscore, TFx/2, TFy-50);
    break;
  }
  win.play(); //lance musique de win
}

//BOUTON REPLAY
void replay() {
  fill(255); //choix du blanc
  rectMode(CENTER); 
  rect(TFx/2, TFy/2 + 100, 340, 120); //rectangle blanc centre de 340 par 120
  fill(0); //choix noir
  textFont(CosAl, 75);
  textAlign(CENTER, CENTER);
  text("Replay", TFx/2, TFy/2+100); //ecriture de "Replay"
}


/*********************************************************/
//DIFFICULTE
void difficulte() {
  switch (difficulte) {
  case 0:

    //mode=9;
    switch(niveau) {
    case 1:
      vitesseMissile=1;
      incrementX=1;
      rangees=1;
      colonnes=3;
      break;
    case 2:
      vitesseMissile=2;
      incrementX=1;
      rangees=3;
      colonnes=4;
      break;
    case 3:
      vitesseMissile=3;
      incrementX=2;
      rangees=5;
      colonnes=5;
      break;
    case 4:
      vitesseMissile=4;
      incrementX=2;
      rangees=5;
      colonnes=7;
      break;
    case 5:
      vitesseMissile=5;
      incrementX=3;
      rangees=7;
      colonnes=10; 
      break;
    }
    break;

  case 1:
    switch(niveau) {
    case 1:
      vitesseMissile=6;
      incrementX=4;
      rangees=1;
      colonnes=3;
      break;
    case 2:
      vitesseMissile=7;
      incrementX=4;
      rangees=3;
      colonnes=5;
      break;
    case 3:
      vitesseMissile=8;
      incrementX=5;
      rangees=5;
      colonnes=10;
      break;
    case 4:
      vitesseMissile=9;
      incrementX=5;
      rangees=5;
      colonnes=12;
      break;
    case 5:
      vitesseMissile=10;
      incrementX=6;
      rangees=7;
      colonnes=15;
      break;
    }
    break;
  case 2:

    //mode=9;
    switch(niveau) {
    case 1:
      vitesseMissile=11;
      incrementX=7;
      rangees=1;
      colonnes=3; 
      break;
    case 2:
      vitesseMissile=12;
      incrementX=7;
      rangees=3;
      colonnes=5;
      break;
    case 3:
      vitesseMissile=13;
      incrementX=8;
      rangees=5;
      colonnes=10;
      break;
    case 4:
      vitesseMissile=14;
      incrementX=8;
      rangees=5;
      colonnes=15;
      break;
    case 5:
      vitesseMissile=15;
      incrementX=9;
      rangees=7;
      colonnes=20;
      break;
    }
    break;
  }
}

//GESTION HIGHSCORE
void lecture_sauvegarde() {
  String[] sauvegarde = loadStrings("sauvegarde.txt");
  //println("il y a " + sauvegarde.length + " lignes");
  mode=int(sauvegarde[0]);
  niveau =int(sauvegarde[1]);
  difficulte = int(sauvegarde[2]);
  score = int(sauvegarde[3]);
  hiscore =int( sauvegarde[4]);
  vie = int(sauvegarde[5]);
  rempart1 = int(sauvegarde[6]);
  rempart2 = int(sauvegarde[7]);
  rempart3 = int(sauvegarde[8]);
  rempart4 = int(sauvegarde[9]);
  rempart5 = int(sauvegarde[10]);
  rempart6 = int(sauvegarde[11]);
  incr = int(sauvegarde[12]);



  String[] ennemissave = loadStrings("ennemis.txt");
  rangees=ennemissave.length-1;
  colonnes=ennemissave[1].length();
  ennemis = new char[colonnes][rangees];
  //println("il y a " + rangees + " rangees et " +colonnes + "colonnes");
  for (i=0; i < colonnes; i=i+1) {
    //println();
    for (j=1; j <=rangees; j=j+1) {
      ennemis[i][j-1]=ennemissave[j].charAt(i);
      //println(ennemissave[j].charAt(i));
    }
  }
}

void ecriture_sauvegarde() {
  output = createWriter("data/sauvegarde.txt");
  output.println(mode);
  output.println(niveau);
  output.println(difficulte);
  output.println(score);
  output.println(hiscore);
  output.println(vie);
  output.println(rempart1);
  output.println(rempart2);
  output.println(rempart3);
  output.println(rempart4);
  output.println(rempart5);
  output.println(rempart6);
  output.println(incr);
  output.flush();
  output.close();
  output = createWriter("data/ennemis.txt");
  for (int i = 0; i < rangees; i = i + 1) {
    output.println();
    for (int j = 0; j < colonnes; j = j + 1) {
      output.print(ennemis[j][i]);
    }
  }
  output.flush();
  output.close();
}

void gestion_hiscore() {
  if (score>hiscore) hiscore=score;
}