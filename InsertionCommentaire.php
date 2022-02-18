<?php

				
		require 'connexionClient.php';
		require 'conexion.php';
		//require 'serie.php';
		include 'serie.php';
		session_start();
		echo("ff");
		$req = $dbh->prepare("INSERT INTO NOTER_SERIES (PSEUDO, ID_SERIE, NOTE_NS, CMT_NS, DATE_NS) values(:PSEUDO, :ID_SERIE, :NOTE_NS, :CMT_NS, :DATE_NS)");
		$req->execute(array("PSEUDO" => ($_SESSION['user'])['PSEUDO'], "ID_SERIE" => $SerieId, "NOTE_NS" => $_POST['number'], "CMT_NS" => $_POST['message'], "DATE_NS" => time() ));
		header('e.php');
		

	
?>
