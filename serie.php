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
			<?php
				require 'connexionClient.php';
			?>
			<header>
			<?php
				include 'header.php'
			?>
			</header><br/>
			
			<?php
				require 'conexion.php';
				$SerieId = $_GET["id"]; 
				if (isset($SerieId)){

					$requete = $dbh->prepare('SELECT * from SERIES WHERE ID_SERIE = ?');
					$requete->execute(array($SerieId));
					$donnees = $requete->fetch();
					if (!isset($donnees["ID_SERIE"])){
					
						echo ("<test>Serie non existante!</test>");
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
						$requete = $dbh->prepare('SELECT URL from PHOTO_SERIE WHERE ID_SERIE = ?');
						$requete->execute(array($SerieId));
						$donnees2 = $requete->fetch();
					
						echo "<img src='".$donnees2['URL']."' />";
					?>
				
				</photo>
				<br>
				
				<titre> Titre de la série:
				<?php
					
					echo($donnees['TITRE_SERIE']);
				?>
				
				 </titre>
				
				<br>
				
				<genre> Genre de la série: 
				
					<?php
					
					$requete = $dbh->prepare('SELECT * FROM ETRE_DU_GENRE WHERE ID_SERIE = ? ');
					$requete->execute(array($SerieId));
					$donnees1 = $requete->fetch();
					echo($donnees1['NOM_GENRE']);

					?>					
				</genre>
				
				<br>
				
				<note> Note générale attribuée par les utilisateurs: 
				
					<?php	
					$requete = $dbh->prepare('SELECT AVG(NOTE_NS) FROM NOTER_SERIES WHERE ID_SERIE = ? ');
					$requete->execute(array($SerieId));
					$donnees1 = $requete->fetch();
					if(isset($donnees1))
						echo($donnees1['AVG(NOTE_NS)']);
					else
						echo("Série pas encore notée");
					?>					
				</note>
				
				<br>
				
				<date> Date de prod: 
				
					<?php
				
					echo($donnees['ANNEE_SERIE']);
					?>
					</date>
				
				<br>
				
				<orig> Origine de la série. 
				
					<?php
				
					echo($donnees['PAYS_SERIE']);
					?>	
				</orig>	
				
				<br>
				
				<resume> Résumé de la série:
				
					<?php
				
					echo($donnees['SUM_SERIE']);
					?>
				
				 </resume>
				
				<br>
				
				<act> Acteurs: 
				
					<?php
					
					$requete = $dbh->prepare('SELECT I.NOM_IND, I.PREN_IND, I.ID_IND FROM INDIVIDUS I inner JOIN JOUER P ON I.ID_IND = P.ID_IND WHERE P.ID_SERIE = ? ');
					$requete->execute(array($SerieId));
					$donnees1 = $requete->fetchall();
					
					if (count($donnees1)<=0){
					
						echo ("Acteur non renseigné!");
					}
					else{
						//var_dump($donnees);

						$count = count($donnees1);

						for($i=0;$i<$count;$i++){
							if ($i != 0)
							{
								echo("; ");
							}		
							$name = $donnees1[$i]["NOM_IND"] . " " . $donnees1[$i]["PREN_IND"];
							echo('<a href="individu.php?id=' . $donnees1[$i]["ID_IND"] . '">' . $name . '</a>');	
							//echo($donnees1[$i]["NOM_IND"] . " " . $donnees1[$i]["PREN_IND"]);
							
						}
							
						//autres ligne 						
						}

					?>
					
					
					
				</act>
				
				<br>
				
				<prod> Producteur: 
				
					<?php
					
					$requete = $dbh->prepare('SELECT I.NOM_IND, I.PREN_IND, I.ID_IND FROM INDIVIDUS I inner JOIN PRODUIRE P ON I.ID_IND = P.ID_IND WHERE P.ID_SERIE = ? ');
					$requete->execute(array($SerieId));
					$donnees1 = $requete->fetchall();
					
					if (count($donnees1)<=0){
					
						echo ("Producteur non renseigné!");
					}
					else{
						//var_dump($donnees);

						$count = count($donnees1);

						for($i=0;$i<$count;$i++){
							if ($i != 0)
							{
								echo("; ");
							}		
							$name = $donnees1[$i]["NOM_IND"] . " " . $donnees1[$i]["PREN_IND"];
							echo('<a href="individu.php?id=' . $donnees1[$i]["ID_IND"] . '">' . $name . '</a>');	
							//echo($donnees1[$i]["NOM_IND"] . " " . $donnees1[$i]["PREN_IND"]);
							
						}
							
						//autres ligne 						
						}

					?>
					
					
					
				</prod>
				
				<br>
				
				<cree> Créateurs: 
				
					<?php
					
					$requete = $dbh->prepare('	 ');
					$requete->execute(array($SerieId));
					$donnees1 = $requete->fetchall();
					
					if (count($donnees1)<=0){
					
						echo ("Créateur(s) non renseigné(s)!");
					}
					else{
						//var_dump($donnees);

						$count = count($donnees1);

						for($i=0;$i<$count;$i++){
							if ($i != 0)
							{
								echo("; ");
							}		
							$name = $donnees1[$i]["NOM_IND"] . " " . $donnees1[$i]["PREN_IND"];
							echo('<a href="individu.php?id=' . $donnees1[$i]["ID_IND"] . '">' . $name . '</a>');	
							//echo($donnees1[$i]["NOM_IND"] . " " . $donnees1[$i]["PREN_IND"]);
							
						}
							
						//autres ligne 						
						}

					?>		
				</cree>
				
				<br>
				
				<episodes> Liste des épisodes: <br>
				
				<?php
					
					$requete = $dbh->prepare('SELECT * FROM EPISODES WHERE ID_SERIE = ? ORDER BY DATE_EP');
					$requete->execute(array($SerieId));
					$donnees1 = $requete->fetchall();
					
					if (count($donnees1)<=0){
					
						echo ("Cette série n'a aucun épisode! ");
					}
					else{
						$count = count($donnees1);
						for($i=0;$i<$count;$i++){
							echo('<a href="episode.php?id=' . $donnees1[$i]['ID_EP'] . '">' . $donnees1[$i]['NOM_EP'] .  '(Saison ' . $donnees1[$i]['SAISON_EP'] . ')' . '</a>' );
							?> <br> <?php 	
							
						}
					}

					?>		
				</episodes>
				
				<br>
							
				<notes>
					Commentaires: <br>
					
					<?php	
						$requete = $dbh->prepare('SELECT * FROM NOTER_SERIES WHERE ID_SERIE = ? ORDER BY DATE_NS DESC');
						$requete->execute(array($SerieId));
						$donnees = $requete->fetchall();
						//print_r($donnees);
						$count = count($donnees);
						for($i=0;$i<$count;$i++){
							echo("L'utilisateur " . $donnees[$i]['PSEUDO'] . " a donné une note de " . $donnees[$i]['NOTE_NS']  . " à la série " . " : " . "' " .  $donnees[$i]['CMT_NS'] . " '" );
							?> <br> <?php 
						}
						
						//session_start();
				
						if (!isset($_SESSION['user'])){
							echo("Connectez-vous si vous voulez noter et laisser un commentaire! "); }
						else  { 
								//$link = "serie.php?id" . $SerieId;
								?>
								<form method="post" action=<?php $link ?>>
								<label for="note"> Votre Note </label>
								<input type="number" id="number" name="note"/> 
								<label for="commentaire"> Votre Commentaire </label>
								<input type="textarea" id="message" name="comm"/>
								<input type="submit" id="sub" value="Poster mon commentaire"/> <br/>
								 <?php
								$req = $dbh->prepare("INSERT INTO NOTER_SERIES (PSEUDO, ID_SERIE, NOTE_NS, CMT_NS, DATE_NS) values(:PSEUDO, :ID_SERIE, :NOTE_NS, :CMT_NS, :DATE_NS)");
								$req->execute(array("PSEUDO" => ($_SESSION['user'])['PSEUDO'], "ID_SERIE" => $SerieId, "NOTE_NS" => $_POST["note"], "CMT_NS" => $_POST["comm"], "DATE_NS" => "2017-05-03 16:42:09" )); ?>
								</form> <?php
							}
							
						?>	
					
				
				</notes>
				
			</article>
			
		</main>
		
	</body>
	
</html>

<?php $link ?>
