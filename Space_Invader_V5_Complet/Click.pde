//CLIC SOURIS

void mouseClicked() {
  //println(mouseX + "/" + mouseY);
  switch(mode) {

  case 0://accueil
    //1P
    if (mouseX < TFx/2 && mouseX > TFx/2 - 175 && mouseY < TFy/2 -85 && mouseY > TFy/2 - 175) {
      mode=10;
    }
    //2P
    if (mouseX > TFx/2 && mouseX < TFx/2 + 175 && mouseY < TFy/2 -85 && mouseY > TFy/2 - 175) {
      TableauEnnemis();
      vaisseaux.add(new Vaisseau());
      mode=20;
    }
    //Options
    if (mouseX > TFx/2 - 175 && mouseX < TFx/2 + 175 && mouseY < TFy/2 +15 && mouseY > TFy/2 - 75) {
      mode=3;
    }
    //Commandes
    if (mouseX > TFx/2 - 175 && mouseX < TFx/2 + 175 && mouseY < TFy/2 +115 && mouseY > TFy/2 +25) {
      mode=4;
    }
    //Quitter
    if (mouseX > TFx/2 - 175 && mouseX < TFx/2 + 175 && mouseY < TFy/2 +215 && mouseY > TFy/2 +125) {
      //gestion_hiscore();
      exit();
    }
    break;

  case 13: //jeu
    //println(pixelBombe);
    break;

  case 3://parametres
    //println(mouseX + "/" + mouseY);
    //vitesse -
    if (mouseX < 5*TFx/8 + 30 && mouseX > 5*TFx/8 && mouseY < 215 && mouseY > 185) {
      incrementX-=1;
    }
    //vitesse +
    if (mouseX < 7*TFx/8 && mouseX > 7*TFx/8 - 30 && mouseY < 215 && mouseY > 185) {
      incrementX+=1;
    }
    //colonnes
    if (mouseX < 7*TFx/8 && mouseX > 7*TFx/8 - 30 && mouseY < 265 && mouseY > 235 && colonnes < 20) {
      colonnes+=1;
    }
    if (mouseX < 5*TFx/8 + 30 && mouseX > 5*TFx/8 && mouseY < 265 && mouseY > 235 && colonnes > 1) {
      colonnes-=1;
    }
    //rangees
    if (mouseX < 7*TFx/8 && mouseX > 7*TFx/8 - 30 && mouseY < 310 && mouseY > 280 && rangees < 7) {
      rangees+=1;
    }
    if (mouseX < 5*TFx/8 + 30 && mouseX > 5*TFx/8 && mouseY < 310 && mouseY > 280 && rangees > 1) {
      rangees-=1;
    }
    //Vitesse Missile
    if (mouseX < 7*TFx/8 && mouseX > 7*TFx/8 - 30 && mouseY < 365 && mouseY > 335 && vitesseMissile < 50) {
      vitesseMissile+=1;
    }
    if (mouseX < 5*TFx/8 + 30 && mouseX > 5*TFx/8 && mouseY < 365 && mouseY > 335 && vitesseMissile > 1) {
      vitesseMissile-=1;
    }
    //retour
    if (mouseX < 140 && mouseX > 0 && mouseY < 30 && mouseY > 0) {
      mode=0;
    }
    //println(mouseX + "/" + mouseY);
    break;

  case 14: //pause
    //resume
    if (mouseX < TFx/2+175  && mouseX > TFx/2-175 && mouseY < TFy/2 && mouseY > TFy/2-50) {
      mode=13;
    }
    //menu principal
    if (mouseX < TFx/2+175  && mouseX > TFx/2-175 && mouseY < TFy/2+75 && mouseY > TFy/2+25) {
      mode=0;
      reset();
    }
    //sauvegarder
    if (mouseX < TFx/2+175  && mouseX > TFx/2-175 && mouseY < TFy/2+150 && mouseY > TFy/2+100) {
      ecriture_sauvegarde();
    }

    break;

  case 4: //touches
    //retour
    if (mouseX < 140 && mouseX > 0 && mouseY < 30 && mouseY > 0) {
      mode=0;
    }
    break;

  case 6: //fin du jeu
    if (mouseX < TFx/2+160 && mouseX > TFx/2-160 && mouseY < TFy/2 + 100 + 60 && mouseY > TFy/2 + 100 - 60) {
      mode=0;
      reset();
      win.pause();
      win.rewind();
      gameoversong.pause();
      gameoversong.rewind();
      fond.play();
    }
    break;



  case 10: //difficulte
    //facile
    if (mouseX > TFx/2 - 530 && mouseX < TFx/2 - 180 && mouseY < TFy/2-100+45 && mouseY > TFy/2-100-45) {
      difficulte=0;
      mode=11;
    }
    //moyen
    if (mouseX > TFx/2 - 175 && mouseX < TFx/2 + 175 && mouseY < TFy/2-100+45 && mouseY > TFy/2-100-45) {
      difficulte=1;
      mode=11;
    }
    //difficile
    if (mouseX > TFx/2 +180 && mouseX < TFx/2 + 530 && mouseY < TFy/2-100+45 && mouseY > TFy/2-100-45) {
      difficulte=2;
      mode=11;
    }
    if (mouseX > TFx/2 - 250 && mouseX < TFx/2 + 250 && mouseY < TFy/2+50+45 && mouseY > TFy/2+50-45) {
      lecture_sauvegarde();
      mode=13;
    }
    break;
    //bug selection niveau
  case 11:
    if (mouseX>TFx/2-210 && mouseX<TFx/2-130 && mouseY<TFy/2+40 && mouseY>TFy/2-40) {
      niveau=1;
      mode=12;
    }
    if (mouseX>TFx/2-125 && mouseX<TFx/2-45 && mouseY<TFy/2+40 && mouseY>TFy/2-40) {
      niveau=2;
      mode=12;
    }
    if (mouseX>TFx/2-40 && mouseX<TFx/2+40 && mouseY<TFy/2+40 && mouseY>TFy/2-40) {
      niveau=3;
      mode=12;
    }
    if (mouseX<TFx/2+125 && mouseX>TFx/2+45 && mouseY<TFy/2+40 && mouseY>TFy/2-40) {
      niveau=4;
      mode=12;
    }
    if (mouseX<TFx/2+210 && mouseX>TFx/2+130 && mouseY<TFy/2+40 && mouseY>TFy/2-40) {
      niveau=5;
      mode=12;
    }
    difficulte();
    TableauEnnemis();
    break;

  case 12:
    if (mouseX<TFx/2+150 && mouseX>TFx/2-150 && mouseY<TFy/2+120 && mouseY>TFy/2-120) {
      mode=13;
    }
    break;
  }
}

//GESTION TOUCHES
//test touche appuyee
void keyPressed() {
  testKeys(keyCode, true);
  if (mode==13||mode==20) {
    if (keyCode==80||keyCode==112) mode=14; //p pause
    if (keyCode==82||keyCode==114) mode=13; //r resume
  }
  if ( codeBanana_i == codeBanana.length() ) {
    codeBanana_i = 0;
  }
  if ( key == CODED ) {
    if (  (keyCode == UP && codeBanana.charAt(codeBanana_i) == 'u' )
      || (keyCode == DOWN && codeBanana.charAt(codeBanana_i) == 'd' )
      || (keyCode == LEFT && codeBanana.charAt(codeBanana_i) == 'l' )
      || (keyCode == RIGHT && codeBanana.charAt(codeBanana_i) == 'r' ) ) {
      codeBanana_i++; 
      //println( codeBanana_i );
    } else { 
      codeBanana_i = 0; //println( i );
    }
  } else {
    if ( ( (key == 'a' || key == 'A') && codeBanana.charAt(codeBanana_i) == 'a' ) 
      || ( (key == 'b' || key == 'B') && codeBanana.charAt(codeBanana_i) == 'b' ) ) {
      codeBanana_i= codeBanana_i + 1; //println( codeBanana_i );
    } else {
      codeBanana_i = 0; //println( codeBanana_i );
    }
  }
}
//test touche relachee
void keyReleased() {
  testKeys(keyCode, false);
}
//renvoie les valeurs de toutes les touches appuyees (evite lutilisation de la derniere touche uniquement)
boolean testKeys(int k, boolean b) {
  switch (k) {
  case 32:
    return Espace = b;
  case LEFT:
    return Left = b; 
  case RIGHT:
    return Right = b; 
  case UP:
    return Up = b;
  case 'Q':
  case 'q':
    return Q = b;
  case 'D':
  case 'd':
    return D = b;
  default:
    return b;
  }
}