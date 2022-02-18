<!doctype html>
<?php
				
	require 'connexionClient.php';
?>
<html> 

	
	<head>
		<title> Bienvenue sur notre forum! </title> 
		<meta charset="UTF-8"/>
		<meta name="keywords" content="html,projet"/>
		<meta name="author" content="MRABET & IACOBCIUC"/>
		<link href="e.css" rel="stylesheet" style="text/css"/>
	</head>

	<body>
		<main>
			<header>
			<?php
				include 'header.php'
			?>
			</header><br/>
		
			<br/>
		
		
			<article>
				<?php 
				
					require 'conexion.php';

					$reponse = $dbh->query('SELECT ID_SERIE, TITRE_SERIE from SERIES ORDER BY TITRE_SERIE');
					while ($donnees = $reponse->fetch())
					{						
						echo('<a href="serie.php?id=' . $donnees['ID_SERIE'] . '">' . $donnees['TITRE_SERIE'] . '</a>');


					?>


					<br>
					

					<?php
					}
					$auj = date("Y-m-d");
					$req = $dbh->prepare("SELECT NOM_IND, URL, P.ID_IND FROM INDIVIDUS I INNER JOIN PHOTO_INDIVIDU P ON I.ID_IND = P.ID_IND WHERE DATE_NAISS = ? ");
					$req->execute(array($auj));
					$donnees = $req->fetchall();
					$count = count($donnees);
					if($count > 0 ){
						for($i=0;$i<$count;$i++){
							
							echo ('<a href="individu.php?id='.$donnees[$i]['ID_IND'].'"><img src="'. $donnees[$i]['URL'].'" /></a>') ;
							//echo($donnees[$i]['NOM_IND']);
							?> <br> <?php 
						}}
				 ?>
			</article>
		</main>
	</body>
</html>
