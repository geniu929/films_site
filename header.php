<!doctype html>
<html>
	<head>
		<title> Bienvenue sur notre forum! </title> 
		<meta charset="UTF-8"/>
		<meta name="keywords" content="html,projet"/>
		<meta name="author" content="MRABET & IACOBCIUC"/>
		<link href="header.css" rel="stylesheet" style="text/css"/>
	</head>
<body>
				
					 <a href="e.php">Accueil</a>
				
				<main>
				<?php
				
					session_start();
						
					if (isset($_SESSION['user']))
					{
						$usr = ($_SESSION['user']);
						?> <bnv> <?php echo("Bienvenue " . '<a href ="Profil.php"> ' . $usr['PSEUDO'] . ' </a> ' . '<a href ="Deconnexion.php">   [Déconnexion] </a> ');?> <br> <?php
						echo("On est le " . date("d-m-Y") . " et il est " . date("H:i")); ?> </bnv>
					<recherche>
					<form methode="GET" action="Recherche.php" >
						<label for="recherche"> Tapez votre recherche </label>
						<input type="text" id="rech" name="rech" />
						<label for="typ"> Vous cherchez ?</label>
       						<select name="type" id="dom">
         						<option value="serie"> Série </option>
           						<option value="indiv"> Individu </option>
           						<input type="submit" id="sub" value="Go!"/> <br/>
							
					</form>
				
				
				
				</recherche>
				<?php		
					}    
					else
					{
				?>
				<cnx>
					<form method="post" action="connexionClient.php" > 
						<label for="login">Identifiant</label>
						<input type="text" id="login" name="login" size="3"/>
						<label for="pwd">Mot de passe</label>
						<input type="password" id="pwd" name="pwd" size="3"/> 
						<input type="submit" id="sub" value="Allons-y!"/> <br/>
					
					</form>
					Pas encore inscrit ? 
					<a href="NewUser.php"> Inscrivez-vous! </a> <br /> 
				</cnx>		
				<recherche>
					<form methode="GET" action="Recherche.php" >
						<label for="recherche"> Tapez votre recherche </label>
						<input type="text" id="rech" name="rech" />
						<label for="typ"> Vous cherchez ?</label>
       						<select name="type" id="dom">
         						<option value="serie"> Série </option>
           						<option value="indiv"> Individu </option>
           						<input type="submit" id="sub" value="Go!"/> <br/>
							
					</form>
				
				
				
				</recherche>
				
				
				
				</main>
				<?php
				}
				?>
				<hr>
</body>
</html>
