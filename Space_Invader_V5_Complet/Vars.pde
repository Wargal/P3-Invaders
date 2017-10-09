/**************************************************
 SPACE INVADERS
 ISN 2016-2017
 Lycee Leonard de Vinci Montaigu
 Benjamin, Mael, Bastien
 **************************************************/
//Initialisation variables

//gif animation
import gifAnimation.*;
Gif easterEggBanana;

//minim
import ddf.minim.*;
Minim minim;
AudioPlayer tir;
AudioPlayer fond;
AudioPlayer gameoversong;
AudioPlayer win;
AudioPlayer invaderkilled;


ArrayList <Missile> missiles = new ArrayList <Missile>();
ArrayList <Vaisseau> vaisseaux = new ArrayList <Vaisseau>();
ArrayList <Bombe> bombes = new ArrayList <Bombe>();




//cheat code
String codeBanana = "uuddlrlrba";
int codeBanana_i=0;

//DIFFICULTE
int difficulte=0;
//niveau
int niveau;

//hiscore
PrintWriter output;
int hiscore;

//choix du mode de depart
int mode=0;

//taille fenetre
int TFx=1280;
int TFy=720;
int marge=50;

//Barre de surfchauffe
float surchauffeX=TFx-252;
float compteurMissile=0;

//ALIEN ACCUEIL
int xAlien=0;
//couleur
color couleurAlien;
//lettre de base
char persoAlien = 'A';

//REMPARTS
  int rempart1 = #1ECE1E;
  int rempart2 = #1ECE1E;
  int rempart3 = #1ECE1E;
  int rempart4 = #1ECE1E;
  int rempart5 = #1ECE1E;
  int rempart6 = #1ECE1E;

//ALIENS JEU
// tableau des aliens
char[][] ennemis;
//cellules tableau
int colonnes = 10;
int rangees = 5;
//hauteur et largeur cellule
int largeurColonne = 50;
int hauteurRangee = 50;
//nombre tues
int ennemi_killed = 0;
//variation des lettres pour l'illusion de mouvement
int incr=-1;

//VAISSEAU MYSTERE
//presence
boolean mystery;
//position
int xMystery = TFx + 100;
int yMystery = marge + 25;
//passage
boolean dejapasse = false;

//COMPTEURS
//variables des boucles
int i=0; //for colonnes
int j=0; //for rangées
//Variable de modulo (ralentissement)
int compteur;

//LIMITES TABLEAU
//var de test
int testR=0;
int testL=0;
int testB=0;
//resultantes test
int ifinR=0;
int ifinL=0;
int jfinB=0;

//POSITIONS ENNEMIS
//positions
int xEnnemi;
int yEnnemi;
//positions limites
int xEnnemiR;
int xEnnemiL;
int yEnnemiB;
//Correction de positions
int correctionX=marge+10; //correction de placement pour ne pas toucher le bord
int correctionY=marge+30+25;
int decalageX; //variable de stockage de decalage de position des aliens par rapport au tableau en 0/0

//VITESSES
//vitesse missile
int vitesseMissile=3;
//vitesse aliens
int incrementX = 2;
int incrementY = 10;

//SOURIS
//position souris
int xSourisAbsol;
int ySourisAbsol;

//VAISSEAU
//position vaisseau
int xVaisseauInit=TFx/2-25;
int xVaisseau1;
int xVaisseau2;

//VARLOCALE ?
//gestion missile
color pixelMissile;
int xMissileAbsol;
int yMissileAbsol;
//gestion bombes
color pixelBombe;

//POLICES
PFont CosAl; //text
PFont Invaders; //ennemis
int Invaders_Size = 25;

//TOUCHES
boolean Espace, Left, Right, Up, Q, D;
//JOUEUR
//Score
int score=0;
int scoreJ1=0;
int scoreJ2=0;
//Vie
int vie=3;
int vieJ1=3;
int vieJ2=3;

//FIN DU JEU
int gameOver;

//RECHARGEMENT
int recharge=1; //pr le premier tir
int temp_recharge=1; //tempo entre deux tirs

//MULTIJOUEUR
int players=1;