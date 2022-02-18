<!doctype html>
<html>
	<head>
		<title> Bienvenue sur notre forum! </title> 
		<meta charset="UTF-8"/>
		<meta name="keywords" content="html,projet"/>
		<meta name="author" content="MRABET & IACOBCIUC"/>
		<link href="serie.css" rel="stylesheet" style="text/css"/>
	</head>
	
	<body>
	
		<main>
		
			<header>
			<?php
				include 'header.php'
			?>
			</header><br/>
			
			<?php
				require 'conexion.php';
				require 'connexionClient.php';
				//include 'e.php';
				$user = $usr;  
				echo("Votre Pseudo est: " . $user['PSEUDO']); ?> <br><br><br><br> <?php
				echo("Vous souhaitez le modifier ? Insérer votre nouveau choix ici: "); ?>
				<form methode="GET" action="modif.php" >
				<input type="text" id="login" name="login" />
				<input type="submit" name="pseudo" value="Changer Pseudo"/> <br><br><br><br>
				
				
				<label for="pwd"> Vous souhaitez changer votre mot de passe ? <br> En-Insérez un nouveau ici:</label>
				<input type="password" id="pwd1" name="pwd1"/> 
				Encore une fois:
				<input type="password" id="pwd2" name="pwd2"/> 
				<input type="submit" name="mdp" value="Changer Mot de Passe"/> <br><br><br><br>
				
				
				<label for="sexe"> Vous étes de quel sexe ? <br> </label>
				<label for="genreF"> F </label>
				<input type="radio" id="genreF" name="genre" value="F"/>
				<label for="genreH"> M </label>
				<input type="radio" id="genreH" name="genre" value="M"/>
				<input type="submit" name="sexe" value="Changer le Sexe"/> <br><br><br><br>
				
				</form>
				
				Vous étes membre depuis: <?php echo( $user['DATE_INSC'] ); ?>
		</main>
	</body>
	
	
</html>
