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
				$EpId = $_GET["id"]; 
				if (isset($EpId)){

					$requete = $dbh->prepare('SELECT * from EPISODES WHERE ID_EP = ?');
					$requete->execute(array($EpId));
					$donnees = $requete->fetch();
					if (!isset($donnees["ID_EP"])){
					
						echo ("Episode non existant!");
						die();
					}
					//print_r($donnees);
					

				}
				else
				{
					echo ("Mauvais paramétre ");
					die();
				}
			
			?>
			
			<article>
				<photo>  
				
					<?php
						$requete = $dbh->prepare('SELECT URL FROM (PHOTO_SERIE P INNER JOIN SERIES S ON S.ID_SERIE = P.ID_SERIE) INNER JOIN EPISODES E ON E.ID_SERIE = S.ID_SERIE WHERE ID_EP = ?');
						$requete->execute(array($EpId));
						$donnees2 = $requete->fetch();
					
						echo "<img src='".$donnees2['URL']."' />";
					?>
				
				</photo>
				<br>
				
				<titre> Nom de l'épisode:
				<?php
					
					echo($donnees['NOM_EP']);
				?>
				
				 </titre>
				
				
				
				<br>
				
				
				
				<date> Diffusé le :
				
					<?php
				
					echo($donnees['DATE_EP']);
					?>
				
				 </date>
				 
				 <br>
				 
				 <time> Durée :
				
					<?php
				
					echo($donnees['DUREE_EP']);
					?>
				
				 </time>
				
				<br>
				<resume> Résumé de l'épisode:
				
					<?php
				
					echo($donnees['SUM_EP']);
					?>
				
				 </resume>
				
				<br>
				
				
				
			</article>
			
		</main>
		
	</body>
	
</html>
