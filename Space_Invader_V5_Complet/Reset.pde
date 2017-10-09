//REINITIALISATION DES VARIABLES
void reset() {
  vie=3;
  vieJ1=3;
  vieJ2=3;
  score=0;
  scoreJ1=0;
  scoreJ2=0;
  ennemi_killed=0;
  incrementY=0;
  decalageX=0;
  compteur = 0;
  TableauEnnemis(); //reset des ennemis
  incr=-1; 
  vaisseaux.clear();
  vaisseaux.add(new Vaisseau()); //initialisation du vaisseau 1
  //supression des missiles
  missiles.clear();
  //suppression des bombes
  bombes.clear();

}