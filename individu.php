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
				$IndId = $_GET["id"]; 
				if (isset($IndId)){

					$requete = $dbh->prepare('SELECT * from INDIVIDUS WHERE ID_IND = ?');
					$requete->execute(array($IndId));
					$donnees = $requete->fetch();
					if (!isset($donnees["ID_IND"])){
					
						echo ("<test>Individu non existant!</test>");
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
						$requete = $dbh->prepare('SELECT URL from PHOTO_INDIVIDU WHERE ID_IND = ?');
						$requete->execute(array($IndId));
						$donnees2 = $requete->fetch();
					
						echo "<img src='".$donnees2['URL']."' />";
					?>
			
				</photo>
				
				<br>
				
				<nom> 
					<?php
					
					echo(strtoupper($donnees['NOM_IND']) . " " . $donnees['PREN_IND']);
					?>
				
				 </nom>
				 
				 <br>
				 
				<date> Né(e) le: 
					<?php
					
					echo($donnees['DATE_NAISS']);
					?>
				
				 </date>
				
				<br>
				
				<roles> Roles occupés par l'individu: <br>
					Producteur:
					<?php
					
					
					
					$requete = $dbh->prepare('SELECT DISTINCT TITRE_SERIE, P.ID_SERIE FROM (SERIES S INNER JOIN PRODUIRE P ON S.ID_SERIE = P.ID_SERIE) INNER JOIN INDIVIDUS WHERE P.ID_IND = ?  ');
					$requete->execute(array($IndId));
					$donnees1 = $requete->fetchall();
					if (count($donnees1)<=0){
					
						
						echo ("Cet individu n'a rien produit! ");
					}
					else{


						$count = count($donnees1);

						for($i=0;$i<$count;$i++){
							if ($i != 0)
							{
								echo("; ");
							}							
							echo('<a href="serie.php?id=' . $donnees1[$i]["ID_SERIE"] . '">' . $donnees1[$i]["TITRE_SERIE"] . '</a>');		

							
						}
							
						//autres ligne 						
						}
						
						
					?> <br>	
					Créateur:
					<?php
					
					
					
					$requete = $dbh->prepare('SELECT DISTINCT TITRE_SERIE, C.ID_SERIE, C.DATE_CREATION FROM (SERIES S INNER JOIN CREER C ON S.ID_SERIE = C.ID_SERIE) INNER JOIN INDIVIDUS WHERE C.ID_IND = ?  ');
					$requete->execute(array($IndId));
					$donnees1 = $requete->fetchall();
					if (count($donnees1)<=0){
					
						
						echo ("Cet individu n'a rien crée! ");
					}
					else{


						$count = count($donnees1);

						for($i=0;$i<$count;$i++){
							if ($i != 0)
							{
								echo("; ");
							}							
							echo('<a href="serie.php?id=' . $donnees1[$i]["ID_SERIE"] . '">' . $donnees1[$i]["TITRE_SERIE"] . ' ( ' . $donnees1[$i]["DATE_CREATION"] . ' ) ' . '</a>');		

							
						}
							

						}
						
					?> <br>
					
					Réalisateur:
					<?php
		
						$requete = $dbh->prepare('SELECT DISTINCT NOM_EP, DATE_EP, TITRE_SERIE, R.SAISON_EP, R.ID_EP FROM (EPISODES E INNER JOIN REALISER R ON E.ID_EP = R.ID_EP) INNER JOIN SERIES S ON E.ID_SERIE = S.ID_SERIE WHERE R.ID_IND = ?');
						$requete->execute(array($IndId));
						$donnees1 = $requete->fetchall();
						if (count($donnees1)<=0){
					
						
							echo ("Cet individu n'a rien réalisé! ");
						}
						else{


							$count = count($donnees1);

							for($i=0;$i<$count;$i++){
								if ($i != 0)
								{
									echo("; ");
								}							
								echo('<a href="episode.php?id=' . $donnees1[$i]["ID_EP"] . '">' . $donnees1[$i]["NOM_EP"] . ' ( ' . $donnees1[$i]["TITRE_SERIE"] . ' Saison ' . $donnees1[$i]["SAISON_EP"] . ' ) ' . '</a>');		

							
							}
							
							//autres ligne 						
							}
						
					?> <br>
				 </roles>
				
				
				
			</article>
			
		</main>
		
	</body>
	
</html>
