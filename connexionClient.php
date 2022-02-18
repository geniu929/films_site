<?php

				

		require 'conexion.php';
		if(!empty($_POST['login']) and !empty($_POST['pwd']) ){
		$requete = $dbh->prepare('SELECT * FROM UTILISATEURS WHERE PSEUDO = ? AND PWD = ?');
		$requete->execute(array($_POST['login'], $_POST['pwd']));
		echo($_POST['login']);
		$user = $requete->fetch();
		
		

		if(isset($user['PSEUDO'])){

			session_start();
			//$perso = new Personnage($user['PSEUDO'], $user['PWD'], $user['SEXE']);

			$_SESSION['user'] = $user;

			//$_SESSION['user'] = $perso;
			header('Location: e.php');
		}
	else{
		echo("erreur");
		//header('Location: Erreur.php');
			}
	}
?>
