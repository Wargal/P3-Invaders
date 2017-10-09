//OBJET VAISSEAU
class Vaisseau {
  int x; //position du vaisseau

  Vaisseau() {
    x  = xVaisseauInit;
  }

  void mouvement(int i) {
    //modification des variables de positions en fonction du vaisseau
    switch(i) {
    case 0: // vaisseau 1
      if (Left && x>marge) x -= 5;
      if (Right && x<TFx-marge-50) x += 5;
      xVaisseau1=x;
      break;
    case 1: //vaisseau 2
      if (Q && x>marge) x -= 5;
      if (D && x<TFx-marge-50) x += 5;
      xVaisseau2=x;
      break;
    }
  }

  void affichage(int i) {
    //pour chaque vaisseau
    switch(i) {
    case 0:
      fill(0, 128, 0); //couleur vaisseau 1
      break;
    case 1:
      fill(234, 39, 194); // couleur vaisseau 2
      break;
    }
    //affichage du vaisseau lettre - dans la police
    textFont(Invaders, 30); 
    text('-', x, TFy);
  }
}

//OBJET MISSILE TIRE PAR LE VAISSEAU
class Missile {
  int x;
  int y;
  int proprietaire; //pour differencier ceux du vaiseau 1 et 2

  Missile(int proprio) {
    proprietaire = proprio;
    //lance avec le bon vaisseau
    switch(players) {
    case 1:
      x  = xVaisseau1+19;
      break;
    case 2:
      switch(proprietaire) {
      case 1:
        x  = xVaisseau1+19;
        break;
      case 2:
        x  = xVaisseau2+19;
        break;
      }
      break;
    }
    y  = TFy-34;
  }

  void chute() {
    y = y - vitesseMissile;
  }



  void collision() {
    pixelMissile=get(x, y);
    //println(hex(pixelMissile));

    //test de collision avec la couleur
    if (pixelMissile != #000000 && pixelMissile != #FFFFFF && pixelMissile != #FF0000) {
      //test si mystery touché
      if (y < marge + 50 && y>marge+5) {
        xMystery = TFx + 50;//sort le mystery de la fenetre
        mystery = false; //desactive le mystery
        dejapasse = true; //dit au prog qu'il est deja passe
        scoreAjoutMystere(); //ajout du score variable du mystery ship
      }
      xMissileAbsol = int((x - correctionX - incrementX - decalageX)/largeurColonne); //determine le x de lennemi visé
      yMissileAbsol = int((y - correctionY - incrementY + marge)/hauteurRangee);//determine le y de lennemi visé
      //test si ennemi touche
      if (0 <= xMissileAbsol && xMissileAbsol < colonnes && 0 <= yMissileAbsol && yMissileAbsol < rangees) { //evite le out of array
        ennemis[xMissileAbsol][yMissileAbsol]=' ';
        y=-100; //sort le missile de la fenetre
        ennemi_killed += 1 ; //ajout de 1 aux nombres d'ennemis tues
        scoreNormal(proprietaire); //ajout du score normal dun ennemi
        dejapasse=false; //reinitialise le vaisseau mystere
        invaderkilled.rewind(); //rembobine le son d'anhilation de lennemi
        invaderkilled.play(); //joue le son
      }
      if (pixelMissile == #1ECE1E && x>100 && x<200) {
        rempart1=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #008000 && x>100 && x<200) {
        rempart1=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #004A00 && x>100 && x<200) {
        rempart1=#000000;
        y=-10; 
        x=2500;
      }

      if (pixelMissile == #1ECE1E && x>300 && x<400) {
        rempart2=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #008000 && x>300 && x<400) {
        rempart2=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #004A00 && x>300 && x<400) {
        rempart2=#000000;
        y=-10; 
        x=2500;
      }

      if (pixelMissile == #1ECE1E && x>500 && x<600) {
        rempart3=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #008000 && x>500 && x<600) {
        rempart3=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #004A00 && x>500 && x<600) {
        rempart3=#000000;
        y=-10; 
        x=2500;
      }

      if (pixelMissile == #1ECE1E && x>700 && x<800) {
        rempart4=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #008000 && x>700 && x<800) {
        rempart4=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #004A00 && x>700 && x<800) {
        rempart4=#000000;
        y=-10; 
        x=2500;
      }

      if (pixelMissile == #1ECE1E && x>900 && x<1000) {
        rempart5=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #008000 && x>900 && x<1000) {
        rempart5=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #004A00 && x>900 && x<1000) {
        rempart5=#000000;
        y=-10; 
        x=2500;
      }

      if (pixelMissile == #1ECE1E && x>1100 && x<1200) {
        rempart6=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #008000 && x>1100 && x<1200) {
        rempart6=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelMissile == #004A00 && x>1100 && x<1200) {
        rempart6=#000000;
        y=-10; 
        x=2500;
      }
    }
  }

  void affichage(int i) {
    if (y < marge) {
      missiles.remove(i); //supression du missile s'il sort de la fenetre
    }
    noStroke();
    if (proprietaire == 1) fill(0, 255, 0); //couleur missiles vaisseau 1
    if (proprietaire == 2) fill(255, 0, 0); //couleur missiles vaisseau 2
    rect(x, y, 2, 5); //affichage du missile
  }
}

//OBJETS BOMBES LACHEES PAR ALIENS
class Bombe {
  int x;
  int y;

  Bombe(int lanceur_i, int lanceur_j) {
    //Reglage de la position de la bombe en fonction de l'alien qui tire
    x = lanceur_j*50 + correctionX + incrementX + decalageX  +19;
    y = lanceur_i*50+ correctionY + incrementY;
  }

  void chute() {
    y += 1;
  }

  void collision(int i) {
    pixelBombe=get(x, y);
    //println(hex(pixelBombe));
    //si collision avec vaisseau
    if (pixelBombe == #007F00 || pixelBombe == #E927C1 ) {
      switch(players) {
      case 1:
        vie=vie-1; //eneleve une vie
        bombes.remove(i); //supprime le missile
        break;
      case 2:
      if(x <= xVaisseau1 + 20 && x >= xVaisseau1 -20 ){
        vieJ1=vieJ1-1; //eneleve une vie
        bombes.remove(i); //supprime le missile
      }
      if(x <= xVaisseau2 + 20 && x >= xVaisseau2 -20 ){
        vieJ2=vieJ2-1; //eneleve une vie
        bombes.remove(i); //supprime le missile
      }
        break;
      }
    }
    if (pixelBombe == #1ECE1E && x>100 && x<200) {
        rempart1=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #008000 && x>100 && x<200) {
        rempart1=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #004A00 && x>100 && x<200) {
        rempart1=#000000;
        y=-10; 
        x=2500;
      }

      if (pixelBombe == #1ECE1E && x>300 && x<400) {
        rempart2=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #008000 && x>300 && x<400) {
        rempart2=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #004A00 && x>300 && x<400) {
        rempart2=#000000;
        y=-10; 
        x=2500;
      }

      if (pixelBombe == #1ECE1E && x>500 && x<600) {
        rempart3=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #008000 && x>500 && x<600) {
        rempart3=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #004A00 && x>500 && x<600) {
        rempart3=#000000;
        y=-10; 
        x=2500;
      }

      if (pixelBombe == #1ECE1E && x>700 && x<800) {
        rempart4=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #008000 && x>700 && x<800) {
        rempart4=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #004A00 && x>700 && x<800) {
        rempart4=#000000;
        y=-10; 
        x=2500;
      }

      if (pixelBombe == #1ECE1E && x>900 && x<1000) {
        rempart5=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #008000 && x>900 && x<1000) {
        rempart5=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #004A00 && x>900 && x<1000) {
        rempart5=#000000;
        y=-10; 
        x=2500;
      }

      if (pixelBombe == #1ECE1E && x>1100 && x<1200) {
        rempart6=#008000;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #008000 && x>1100 && x<1200) {
        rempart6=#004A00;
        y=-10; 
        x=2500;
      }
      if (pixelBombe == #004A00 && x>1100 && x<1200) {
        rempart6=#000000;
        y=-10; 
        x=2500;
      }
  }

    void affichage() {
      noStroke();
      fill(0, 0, 255);
      rectMode(CENTER);
      rect(x, y, 5, 10);
    }
  }

  //SCORE
  //Score alien tue
  void scoreNormal(int proprietaire) {
    switch(players) {
    case 1:
      score=score+10*abs(rangees-yMissileAbsol); //ajout du score en fonction de la position de l'alien (10 le plus proche puis 10 par rangees)
      break;
    case 2:
      switch(proprietaire) {
      case 1:
        scoreJ1=scoreJ1+10*abs(rangees-yMissileAbsol); //ajout du score en fonction de la position de l'alien (10 le plus proche puis 10 par rangees)
        break;
      case 2:
        scoreJ2=scoreJ2+10*abs(rangees-yMissileAbsol); //ajout du score en fonction de la position de l'alien (10 le plus proche puis 10 par rangees)
        break;
      }
    }
  }
  //Score vaisseau mystere
  void scoreAjoutMystere() {
    score = score + int(random(0, 1000)); //ajout au score entre 0 et 1000
  }