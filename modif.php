<?php  
require 'conexion.php';
					require 'Profil.php';
if (isset($_GET['pseudo'])) {		
					
	$requete = $dbh->prepare('UPDATE UTILISATEURS SET PSEUDO = ? WHERE PSEUDO = ? ');
	$requete->execute(array($_GET['login'], $user['PSEUDO']));
	($_SESSION['user'])['PSEUDO']=$_GET['login'];
	header('Profil.php');}
				
else if (isset($_GET['mdp']))	{
	if($_GET['pwd1']==$_GET['pwd2']){
		$requete = $dbh->prepare('UPDATE UTILISATEURS SET PSEUDO = ?, PWD = ? WHERE PSEUDO = ? ');
		$requete->execute(array($user['PSEUDO'], $_GET['pwd1'], $user['PSEUDO']));
		//($_SESSION['user'])['PWD']=$_GET['login'];
		header('Profil.php');}}
else if (isset($_GET['sexe']))	{
		$requete = $dbh->prepare('UPDATE UTILISATEURS SET SEXE = ? WHERE PSEUDO = ? ');
		$requete->execute(array($_GET['genre'], $user['PSEUDO']));
		//($_SESSION['user'])['PWD']=$_GET['login'];
		header('Profil.php');}
		
?>
