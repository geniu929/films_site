<?php

				
		require 'conexion.php';
		require 'header.php';
		if(isset($_GET['rech']) AND !empty($_GET['rech'])){
		if($_GET['type'] == "serie"){
			$requete = $dbh->prepare('SELECT * FROM SERIES WHERE TITRE_SERIE = ? ');
			$requete->execute(array($_GET['rech']));
			//echo($_POST['login']);
			$res = $requete->fetchall();
			if (count($res)==0){
					
						echo ("Aucun résultat trouvé! ");
					}
					else{
						//var_dump($donnees);

						$count = count($res);

						for($i=0;$i<$count;$i++){
				//header('Location: individu.php?id=' . $res['ID_IND']);
				echo('<a href="serie.php?id=' . $res[$i]['ID_SERIE'] . '">' . $res[$i]['TITRE_SERIE'] .'</a>'); ?> <br> <?php
				
		}}}
		else{
				$requete = $dbh->prepare('SELECT * FROM INDIVIDUS WHERE NOM_IND = ? OR PREN_IND = ?');
				$requete->execute(array($_GET['rech'], $_GET['rech']));
			//echo($_POST['login']);
			$res = $requete->fetchall();
				if (count($res)==0){
					
						echo ("Aucun résultat trouvé! ");
					}
					else{
						//var_dump($donnees);

						$count = count($res);

						for($i=0;$i<$count;$i++){
				//header('Location: individu.php?id=' . $res['ID_IND']);
				echo('<a href="individu.php?id=' . $res[$i]['ID_IND'] . '">' . $res[$i]['NOM_IND'] . $res[$i]['PREN_IND'] .'</a>'); ?> <br> <?php
		}
		} }}
	else{
		//echo("erreur");
		header('Location: Erreur.php');
			}
	
	//else header('Location: Erreur.php');
?>
