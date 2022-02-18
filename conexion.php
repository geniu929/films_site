<?php
	try{
		$dns = "mysql:host=localhost;dbname=FilmBDD";
		$Username = "root";
		$Password = "20344830a";
		$dbh = new PDO($dns, $Username, $Password );
	}
	catch(PDOException $e){
		print "Error!: " . $e->getMessage() . "<br/>";
		//die();
	}
?>
