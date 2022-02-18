<?php
	require'connexionClient.php';
	if(!empty($_POST['login']) and !empty($_POST['pwd']) and !empty($_POST['genre'])){
		session_start();
		($_SESSION['user'])['PSEUDO']=$_POST['login'];
		require("conexion.php");
		$user=htmlentities($_POST['login']);
		$mdp=htmlentities($_POST['pwd']);
		$sexe=htmlentities($_POST['genre']);		
		try {
			$req = $dbh->prepare("insert into UTILISATEURS (PSEUDO, PWD, SEXE)values(:PSEUDO, :PWD, :SEXE)");
			$req->execute(array("PSEUDO" => $user, "PWD" => $mdp, "SEXE" => $sexe));
		}
		catch (PDOException $e) {
			print "Erreur !: " . $e->getMessage() . "<br/>";
			die();
		}
		
		header('Location: e.php');
	}
	else echo("nn");
	
?>
