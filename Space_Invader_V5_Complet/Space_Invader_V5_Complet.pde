void setup() {
  frameRate(60); //60 fps
  fenetre();
  polices();
  TableauEnnemis();
  easterEggBanana = new Gif(this, "Peanut-butter-jelly-time.gif");
  easterEggBanana.play();
  vaisseaux.add(new Vaisseau()); //initialisation du vaisseau 1
  couleurAlien=color(random(1, 255), random(1, 255), random(1, 255)); //initialisation de la couleur de l'alien de l'accueil
  sons();
}

void draw() {
  //reparametrage des variables TFx et TFy a chaque passage (pour optimiser l'affichage avec une fenetre redimensionnable
  TFx = width;
  TFy = height;
  //changements de mode
  switch(mode) {
  case 0: //menu principal
    accueil();
    break;

  case 10:
    //choix diff
    Difficulte();
    break;
  case 11:
    //choix lvl
    affniv();
    break;
  case 12:
    //ready
    ecran_ready();
    break;
  case 13:
    //jeu 1P
    textAlign(TOP, LEFT);
    rectMode(CORNER);
    
    jeu1P();
    break;
  case 14:
    pause();
    break;

  case 20:
    textAlign(TOP, LEFT);
    rectMode(CORNER);
    players=2;
    jeu2P();
    break;

  case 3: //options
    param();
    break;

  case 4: //commandes
    touches();
    break;

  case 6: //ecrans de fin du jeu
    finDuJeu();
    break;
  }
}









//INITIALISATION DE LA FENETRE
void fenetre() {
  //size(TFx,TFy);
  surface.setSize(TFx, TFy);
  surface.setResizable(true);//taille de la fenêtre
  background(0);
  //fullScreen();
}

//PRECHARGEMENT DES POLICES
void polices() {
  //stockage des polices dans des variables
  CosAl = loadFont("CosmicAlien-48.vlw");
  Invaders = loadFont("Invaders-48.vlw");
}

//PRECHARGEMENT DES SONS
void sons() {
  //initialisation de minim
  minim = new Minim(this); 
  //chargement de chaque son dans une variable
  tir = minim.loadFile("tir.wav");
  fond = minim.loadFile("Cirno Fortress Stage 2.mp3");
  gameoversong = minim.loadFile("Game Over.mp3");
  win = minim.loadFile("win.mp3");
  invaderkilled = minim.loadFile("invaderkilled.wav");
  //lancement de la musique de background
  fond.play();
}