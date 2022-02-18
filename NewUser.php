<!doctype html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<meta name="keywords" content="html,cours"/>
		<meta name="author" content="Julien David"/>
		<title>Créez votre compte CinéAllo</title>
		<link href="NewUser.css" rel="stylesheet" style="text/css"/>
	</head>

	<body>

		<form method="post" action="inscripClient.php">
		
			<header>
				<?php include 'header.php'; ?>
			</header>
			<article>
			<header> <h3> </h3></header>
			<label for="login">Choisissez un identifiant </label> <br/> 
			<input type="text" id="login" name="login" autofocus required/>  <br/> <br/> <br/>
			
			<label for="pwd">Choisissez un mot de passe </label> <br/>
			<input type="password" id="pwd" name="pwd" required/> <br/> <br/>
			
			êtes-vous ? : <br/>
			<label for="genreH"> F </label>
			<input type="radio" id="genreH" name="genre" value="F"/>
			<label for="genreF"> M </label>
			<input type="radio" id="genreF" name="genre" value="M"/> <br/> <br/>
			
			<input type="submit" id="sub" value="Je m'inscris!"/>
			</article>
			
			
		
		
		</form>

	</body>

</html>
