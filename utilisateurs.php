<?php

class Personnage

{

  public function Personnage($pseudo, $mdp, $sexe){
  	$_pseudo = $pseudo;
  	$_mdp = $mdp;
  	$_sexe = $sexe;
 }

  public $_pseudo;

  private $_mdp;

  public $_sexe;


  public function modifmdp($NewPWD)
  {
	require("conexion.php");
	$requete = $dbh->prepare('SELECT * from SERIES WHERE ID_SERIE = ?');
	$requete->execute(array($SerieId));
	$donnees = $requete->fetch();

  }

}

?>
